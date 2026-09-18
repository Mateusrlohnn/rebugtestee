/*
 * Painel da fila ranqueada (:queue).
 *
 * O Nitro vem compilado, então o painel é desenhado por cima do jogo e usa a mesma
 * conexão WebSocket que o Nitro abre. O servidor manda o pacote 7700 (JSON) e o painel
 * responde com o pacote 7701 (ação). O Nitro ignora esses dois números.
 *
 * Este arquivo precisa carregar antes dos scripts do Nitro.
 */
(function () {
    'use strict';

    var PANEL_HEADER = 7700;
    var ACTION_HEADER = 7701;
    var AVATAR_URL = 'https://www.habbo.com/habbo-imaging/avatarimage';

    var TIERS = [
        { id: 'bronze', name: 'Bronze', light: '#e2a476', mid: '#a0643a', dark: '#4a2a14', gem: '#d98c5f' },
        { id: 'silver', name: 'Prata', light: '#e6edf2', mid: '#98a6b1', dark: '#3d4852', gem: '#c7d3dc' },
        { id: 'gold', name: 'Ouro', light: '#fbe08a', mid: '#d0a032', dark: '#5e430b', gem: '#f5c84c' },
        { id: 'platinum', name: 'Platina', light: '#a6f0e2', mid: '#3aa89a', dark: '#0e4a44', gem: '#58d6c3' },
        { id: 'emerald', name: 'Esmeralda', light: '#8df5b2', mid: '#1f9e58', dark: '#08432a', gem: '#2fe07e' },
        { id: 'diamond', name: 'Diamante', light: '#c9d8ff', mid: '#6384e0', dark: '#1d2f6e', gem: '#9fc2ff' },
        { id: 'master', name: 'Mestre', light: '#e7b8ff', mid: '#9b4fcf', dark: '#3b1454', gem: '#d38bff' },
        { id: 'grandmaster', name: 'Grão-Mestre', light: '#ffb3b3', mid: '#c83838', dark: '#4f0d0d', gem: '#ff6060' },
        { id: 'challenger', name: 'Desafiante', light: '#fff2b8', mid: '#e8b830', dark: '#1a3d78', gem: '#7fd8ff' }
    ];

    var socket = null;
    var root = null;
    var badgeElement = null;
    var crestCount = 0;
    var view = {
        tab: 'profile',
        state: null,
        stateAt: 0,
        ranking: null,
        rankingPlayer: null
    };

    /* ---------- Conexão ---------- */

    var NativeWebSocket = window.WebSocket;

    function PanelWebSocket(url, protocols) {
        var ws = protocols === undefined ? new NativeWebSocket(url) : new NativeWebSocket(url, protocols);
        socket = ws;
        ws.addEventListener('message', onSocketMessage);
        return ws;
    }

    PanelWebSocket.prototype = NativeWebSocket.prototype;
    ['CONNECTING', 'OPEN', 'CLOSING', 'CLOSED'].forEach(function (key) {
        PanelWebSocket[key] = NativeWebSocket[key];
    });
    window.WebSocket = PanelWebSocket;

    function onSocketMessage(event) {
        if (event.data instanceof ArrayBuffer) {
            readPackets(event.data);
        } else if (typeof Blob !== 'undefined' && event.data instanceof Blob) {
            event.data.arrayBuffer().then(readPackets);
        }
    }

    function readPackets(buffer) {
        var data = new DataView(buffer);
        var offset = 0;

        while (offset + 6 <= buffer.byteLength) {
            var length = data.getInt32(offset);
            var header = data.getInt16(offset + 4);

            if (header === PANEL_HEADER) {
                var textLength = data.getUint16(offset + 6);
                var text = new TextDecoder('utf-8').decode(new Uint8Array(buffer, offset + 8, textLength));

                try {
                    onPanelMessage(JSON.parse(text));
                } catch (e) {
                    console.error('[fila] mensagem inválida', e);
                }
            }

            offset += 4 + length;
        }
    }

    function sendAction(action) {
        if (!socket || socket.readyState !== 1) {
            return;
        }

        var text = new TextEncoder().encode(action);
        var packet = new Uint8Array(4 + 2 + 2 + text.length);
        var data = new DataView(packet.buffer);

        data.setInt32(0, 2 + 2 + text.length);
        data.setInt16(4, ACTION_HEADER);
        data.setUint16(6, text.length);
        packet.set(text, 8);

        socket.send(packet.buffer);
    }

    /* ---------- Mensagens do servidor ---------- */

    function onPanelMessage(message) {
        if (message.type === 'state') {
            var hadMatch = view.state && view.state.match;

            view.state = message;
            view.stateAt = Date.now();

            if (message.match && !hadMatch) {
                view.tab = 'profile';
            }

            if (message.open) {
                show();
            }
        } else if (message.type === 'ranking') {
            view.ranking = message.players;
        }

        if (isOpen()) {
            render();
        }

        updateBadge();
    }

    /* ---------- Selo na tela enquanto está na fila ---------- */

    function updateBadge() {
        ensureRoot();

        var state = view.state;
        var visible = !isOpen() && state && (state.me.inQueue || state.match);

        badgeElement.hidden = !visible;

        if (!visible) {
            return;
        }

        if (state.match) {
            badgeElement.className = 'rq-badge-float is-match';
            badgeElement.innerHTML = logo() +
                '<span class="rq-badge-text"><b>Partida encontrada!</b><small>Clique para ver os jogadores</small></span>';
        } else {
            badgeElement.className = 'rq-badge-float';
            badgeElement.innerHTML = logo() +
                '<span class="rq-badge-text"><b>Procurando partida <span data-wait="' + state.me.waitSeconds + '"></span></b>' +
                '<small>' + state.queue.size + '/' + state.queue.max + ' na fila · clique para abrir</small></span>';
        }

        tickTimers();
    }

    /* ---------- Janela ---------- */

    function ensureRoot() {
        if (root) {
            return;
        }

        root = document.createElement('div');
        root.className = 'rq-root';
        root.hidden = true;
        root.innerHTML =
            '<div class="rq-window" role="dialog" aria-label="Fila ranqueada">' +
            '  <div class="rq-header">' +
            logo() +
            '    <div>' +
            '      <div class="rq-title">Ranqueada</div>' +
            '      <div class="rq-subtitle">Futebol 4x4</div>' +
            '    </div>' +
            '    <nav class="rq-tabs" role="tablist">' +
            tabButton('profile', 'Perfil') +
            tabButton('queue', 'Fila') +
            tabButton('ranking', 'Ranking') +
            tabButton('docs', 'Como funciona') +
            '    </nav>' +
            '    <button class="rq-close" type="button" aria-label="Fechar">✕</button>' +
            '  </div>' +
            '  <div class="rq-content"></div>' +
            '  <div class="rq-footer"></div>' +
            '</div>';

        document.body.appendChild(root);

        badgeElement = document.createElement('button');
        badgeElement.type = 'button';
        badgeElement.hidden = true;
        badgeElement.addEventListener('click', function () {
            sendAction('open');
        });
        document.body.appendChild(badgeElement);

        root.querySelector('.rq-close').addEventListener('click', hide);
        root.addEventListener('click', onClick);
        root.addEventListener('mousedown', function (event) {
            if (event.target === root) {
                hide();
            }
        });
        makeDraggable(root.querySelector('.rq-window'), root.querySelector('.rq-header'));

        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape' && isOpen()) {
                hide();
            }
        });

        root.addEventListener('keydown', function (event) {
            var player = event.target.closest('[data-player]');

            if (player && (event.key === 'Enter' || event.key === ' ')) {
                event.preventDefault();
                openRankingPlayer(Number(player.getAttribute('data-player')));
            }
        });

        setInterval(tickTimers, 1000);
    }

    function tabButton(id, label) {
        return '<button class="rq-tab" type="button" role="tab" data-tab="' + id + '">' + label + '</button>';
    }

    function isOpen() {
        return root && !root.hidden;
    }

    function show() {
        ensureRoot();

        if (!isOpen()) {
            root.hidden = false;

            if (view.tab === 'ranking') {
                sendAction('ranking');
            }
        }

        updateBadge();
    }

    function hide() {
        if (!isOpen()) {
            return;
        }

        root.hidden = true;
        sendAction('close');
        updateBadge();
    }

    function onClick(event) {
        var tab = event.target.closest('[data-tab]');

        if (tab) {
            view.tab = tab.getAttribute('data-tab');
            view.rankingPlayer = null;

            if (view.tab === 'ranking') {
                sendAction('ranking');
            }

            render();
            return;
        }

        var player = event.target.closest('[data-player]');

        if (player) {
            openRankingPlayer(Number(player.getAttribute('data-player')));
            return;
        }

        if (event.target.closest('[data-ranking-back]')) {
            openRankingPlayer(null);
            return;
        }

        var action = event.target.closest('[data-action]');

        if (action) {
            sendAction(action.getAttribute('data-action'));
        }
    }

    function openRankingPlayer(position) {
        view.rankingPlayer = position;
        render();
        root.querySelector('.rq-content').scrollTop = 0;
    }

    function makeDraggable(windowElement, handle) {
        var startX, startY, baseX = 0, baseY = 0, dragging = false;

        handle.addEventListener('pointerdown', function (event) {
            if (event.target.closest('button')) {
                return;
            }

            dragging = true;
            startX = event.clientX - baseX;
            startY = event.clientY - baseY;
            handle.setPointerCapture(event.pointerId);
        });

        handle.addEventListener('pointermove', function (event) {
            if (!dragging) {
                return;
            }

            baseX = event.clientX - startX;
            baseY = event.clientY - startY;
            windowElement.style.transform = 'translate(' + baseX + 'px, ' + baseY + 'px)';
        });

        handle.addEventListener('pointerup', function () {
            dragging = false;
        });
    }

    /* ---------- Desenho ---------- */

    function render() {
        root.querySelectorAll('.rq-tab').forEach(function (tab) {
            tab.setAttribute('aria-selected', String(tab.getAttribute('data-tab') === view.tab));
        });

        var content = root.querySelector('.rq-content');
        var footer = root.querySelector('.rq-footer');

        if (!view.state) {
            content.innerHTML = '<div class="rq-empty">Carregando...</div>';
            footer.innerHTML = '';
            return;
        }

        if (view.tab === 'queue') {
            content.innerHTML = renderQueue();
        } else if (view.tab === 'ranking') {
            content.innerHTML = renderRanking();
        } else if (view.tab === 'docs') {
            content.innerHTML = renderDocs();
        } else {
            content.innerHTML = renderProfile();
        }

        footer.innerHTML = renderFooter();
        tickTimers();
    }

    function renderFooter() {
        var me = view.state.me;
        var queue = view.state.queue;

        if (me.inQueue) {
            return '<div class="rq-footer-info">' +
                '  <div class="rq-footer-label">Procurando partida · ' + queue.size + '/' + queue.max + '</div>' +
                '  <div class="rq-footer-value is-searching" data-wait="' + me.waitSeconds + '"></div>' +
                '</div>' +
                '<button class="rq-play is-cancel" type="button" data-action="leave">Sair da fila</button>';
        }

        return '<div class="rq-footer-info">' +
            '  <div class="rq-footer-label">Fila ranqueada do hotel</div>' +
            '  <div class="rq-footer-value">' + queue.size + '/' + queue.max + ' jogadores procurando</div>' +
            '</div>' +
            '<button class="rq-play" type="button" data-action="join">Encontrar partida</button>';
    }

    function renderProfile() {
        return renderMatch() + renderPlayerProfile(view.state.me);
    }

    /* Foto, elo e estatísticas de um jogador. Usado no Perfil e ao clicar em alguém do ranking. */
    function renderPlayerProfile(player) {
        var tier = tierOf(player.tier);
        var hasDivisions = player.division !== '';
        var progress = Math.max(0, Math.min(100, player.leaguePoints));

        return '<div class="rq-profile">' +
            '  <div class="rq-hero">' +
            '    <div class="rq-avatar-ring">' + avatarImage(player.figure, 'l', player.username) + '</div>' +
            crest(player.tier, player.division, 92) +
            '  </div>' +
            '  <div class="rq-profile-info">' +
            '    <div class="rq-name">' + escapeHtml(player.username) + '</div>' +
            '    <div class="rq-rank-line">' +
            '      <span class="rq-elo" style="color:' + tier.light + '">' + escapeHtml(tier.name + (hasDivisions ? ' ' + player.division : '')) + '</span>' +
            '      <span class="rq-lp">' + player.leaguePoints + ' PDL</span>' +
            '    </div>' +
            (hasDivisions
                ? '<div class="rq-bar"><span style="width:' + progress + '%"></span></div>' +
                  '<div class="rq-bar-label"><span>Progresso da divisão</span><span>' + player.leaguePoints + ' / 100 PDL</span></div>'
                : '<div class="rq-bar-label"><span>Sem divisões · PDL sem limite</span><span>' + player.leaguePoints + ' PDL</span></div>') +
            '    <div class="rq-stats">' +
            stat(player.position ? '#' + player.position : '-', 'Ranking') +
            stat(player.wins, 'Vitórias') +
            stat(player.losses, 'Derrotas') +
            stat(player.draws, 'Empates') +
            stat(winRate(player) + '%', 'Aproveit.') +
            '    </div>' +
            '  </div>' +
            '</div>';
    }

    function winRate(player) {
        var games = player.wins + player.losses + player.draws;
        return games === 0 ? 0 : Math.round(player.wins * 100 / games);
    }

    function renderMatch() {
        var match = view.state.match;

        if (!match) {
            return '';
        }

        var cards = match.players.map(function (player) {
            var classes = 'rq-card' + (player.me ? ' is-me' : '') + (player.captain ? ' is-captain' : '');

            return '<div class="' + classes + '">' +
                (player.captain ? '<span class="rq-tag">Capitão</span>' : '') +
                avatarImage(player.figure, 'm', player.username, 'rq-card-head', true) +
                '<div class="rq-card-name">' + escapeHtml(player.username) + (player.me ? ' (você)' : '') + '</div>' +
                '<div class="rq-card-elo">' + crest(player.tier, player.division, 18) + escapeHtml(eloText(player)) + '</div>' +
                '</div>';
        }).join('');

        return '<div class="rq-match">' +
            '  <div class="rq-match-title">Partida encontrada</div>' +
            '  <p class="rq-match-text">Estes são os 8 jogadores da partida. Os dois capitães têm o melhor elo e montam os times. ' +
            'Combinem entre vocês um quarto para jogar.</p>' +
            '  <div class="rq-grid">' + cards + '</div>' +
            '  <div style="margin-top:16px"><button class="rq-ghost" type="button" data-action="dismiss">Ok, entendi</button></div>' +
            '</div>';
    }

    function renderQueue() {
        var me = view.state.me;
        var queue = view.state.queue;
        var pips = '';

        for (var i = 0; i < queue.max; i++) {
            pips += '<span class="rq-pip' + (i < queue.size ? ' is-filled' : '') + '"></span>';
        }

        return '<div class="rq-queue">' +
            '  <div class="rq-orb' + (me.inQueue ? ' is-searching' : '') + '">' +
            orb() +
            '    <div class="rq-orb-center">' +
            (me.inQueue
                ? '<div class="rq-orb-time" data-wait="' + me.waitSeconds + '"></div><div class="rq-orb-label">Procurando partida</div>'
                : '<div class="rq-orb-time">' + queue.size + '/' + queue.max + '</div><div class="rq-orb-label">Na fila agora</div>') +
            '    </div>' +
            '  </div>' +
            '  <div class="rq-pips" aria-label="' + queue.size + ' de ' + queue.max + ' jogadores">' + pips + '</div>' +
            '  <div class="rq-muted">' + queue.size + ' de ' + queue.max + ' jogadores na fila</div>' +
            '  <p class="rq-queue-note">Quem está na fila fica em segredo. Você só descobre os outros jogadores quando a partida ' +
            'for encontrada.</p>' +
            '</div>';
    }

    function renderRanking() {
        if (!view.ranking) {
            return '<div class="rq-empty">Carregando ranking...</div>';
        }

        if (!view.ranking.length) {
            return '<div class="rq-empty">Ninguém entrou na fila ainda. Seja o primeiro!</div>';
        }

        var selected = findRankingPlayer(view.rankingPlayer);

        if (selected) {
            return '<button class="rq-back" type="button" data-ranking-back>‹ Voltar ao ranking</button>' +
                renderPlayerProfile(selected);
        }

        var rows = view.ranking.map(function (player) {
            var classes = (player.me ? 'is-me ' : '') + (player.position <= 3 ? 'is-top' : '');

            return '<tr class="' + classes + '" data-player="' + player.position + '" tabindex="0" ' +
                'title="Ver estatísticas de ' + escapeHtml(player.username) + '">' +
                '<td class="rq-pos">' + player.position + '</td>' +
                '<td><div class="rq-player-cell">' + avatarImage(player.figure, 's', player.username, '', true) +
                '<span>' + escapeHtml(player.username) + '</span></div></td>' +
                '<td><div class="rq-elo-cell">' + crest(player.tier, player.division, 30) +
                '<span>' + escapeHtml(eloText(player)) + '</span></div></td>' +
                '<td class="rq-num">' + player.wins + 'V ' + player.losses + 'D ' + player.draws + 'E</td>' +
                '</tr>';
        }).join('');

        return '<table class="rq-table">' +
            '<thead><tr><th class="rq-pos">#</th><th>Jogador</th><th>Elo</th><th class="rq-num">Partidas</th></tr></thead>' +
            '<tbody>' + rows + '</tbody>' +
            '</table>';
    }

    function findRankingPlayer(position) {
        if (!position || !view.ranking) {
            return null;
        }

        for (var i = 0; i < view.ranking.length; i++) {
            if (view.ranking[i].position === position) {
                return view.ranking[i];
            }
        }

        return null;
    }

    function renderDocs() {
        var tiers = TIERS.map(function (tier) {
            var apex = tier.id === 'master' || tier.id === 'grandmaster' || tier.id === 'challenger';
            return '<div class="rq-tier-item" style="color:' + tier.light + '">' + crest(tier.id, apex ? '' : 'IV', 58) + tier.name + '</div>';
        }).join('');

        return '<div class="rq-docs">' +
            '<h3 class="rq-section-title">O que é</h3>' +
            '<div class="rq-box"><p>Partidas ranqueadas de futebol 4x4: goleiro, zagueiro, meio-campo e atacante em cada time. ' +
            'Existe uma fila só para o hotel inteiro, e você entra nela de qualquer quarto.</p></div>' +
            '<h3 class="rq-section-title">Como jogar</h3>' +
            '<div class="rq-box"><ul>' +
            '  <li>Digite <b>:queue</b> em qualquer quarto para abrir este painel.</li>' +
            '  <li>Clique em <b>Encontrar partida</b>. Pode fechar o painel e andar pelo hotel: um selo no topo da tela mostra que você está na fila e reabre o painel com um clique.</li>' +
            '  <li>Ninguém vê quem está na fila, só quantos jogadores estão esperando.</li>' +
            '  <li>Quando a fila chega a 8 jogadores, a partida é encontrada e o painel abre sozinho para os 8.</li>' +
            '  <li>Os 2 jogadores com melhor elo viram <b>capitães</b> e montam os times.</li>' +
            '  <li>Ninguém é levado para outro quarto: vocês combinam onde jogar.</li>' +
            '  <li>Para desistir, clique em <b>Sair da fila</b>. Se você sair do hotel e não voltar em 2 minutos, também sai da fila.</li>' +
            '</ul></div>' +
            '<h3 class="rq-section-title">Elos</h3>' +
            '<div class="rq-box">' +
            '  <p>Todo jogador começa no <b>Bronze IV</b> com 0 PDL. Qualquer elo pode jogar com qualquer elo.</p>' +
            '  <div class="rq-tiers">' + tiers + '</div>' +
            '  <ul>' +
            '    <li>Do Bronze ao Diamante há 4 divisões, da IV (mais baixa) até a I, com 100 PDL (Pontos de Liga) cada.</li>' +
            '    <li><b>Subir:</b> chegou a 100 PDL, sobe na hora para a próxima divisão, e o que passar de 100 vai junto. ' +
            'Ex.: Bronze IV com 90 ganha 25 e vira Bronze III com 15.</li>' +
            '    <li><b>Cair:</b> ficou com PDL negativo, desce para a divisão anterior, descontando de 100. ' +
            'Ex.: Bronze III com 5 perde 20 e vira Bronze IV com 85. Bronze IV com 0 não cai mais.</li>' +
            '  </ul>' +
            '</div>' +
            '<h3 class="rq-section-title">Mestre, Grão-Mestre e Desafiante</h3>' +
            '<div class="rq-box"><ul>' +
            '  <li><b>Mestre:</b> quem passa de 100 PDL no Diamante I. Daqui pra cima não há divisões nem limite de PDL. ' +
            'Ficou negativo, volta para o Diamante I.</li>' +
            '  <li><b>Grão-Mestre:</b> as 10 vagas logo abaixo dos Desafiantes. Passou os pontos do último Grão-Mestre, você entra ' +
            'na hora e ele volta para Mestre.</li>' +
            '  <li><b>Desafiante:</b> o topo absoluto do hotel. As 3 vagas vão para os maiores pontuadores e são atualizadas todo dia à meia-noite.</li>' +
            '</ul></div>' +
            '<h3 class="rq-section-title">Ganhando e perdendo PDL</h3>' +
            '<div class="rq-box"><ul>' +
            '  <li>Vitória soma PDL, derrota tira: entre 10 e 30 por partida.</li>' +
            '  <li>Um MMR escondido define quanto: vencer um time mais forte vale mais, e perder para um mais fraco custa mais.</li>' +
            '  <li>Empate não muda o PDL de ninguém.</li>' +
            '  <li>Sair do quarto durante a partida conta como derrota para quem saiu.</li>' +
            '</ul></div>' +
            '</div>';
    }

    function stat(value, label) {
        return '<div class="rq-stat"><b>' + value + '</b><span>' + label + '</span></div>';
    }

    /* Foto do jogador pelo gerador de avatares público do Habbo, a partir do visual (figure). */
    function avatarImage(figure, size, username, className, headOnly) {
        if (!figure) {
            return '';
        }

        var url = AVATAR_URL + '?figure=' + encodeURIComponent(figure) + '&size=' + size +
            '&direction=2&head_direction=3&gesture=sml' + (headOnly ? '&headonly=1' : '');

        return '<img' + (className ? ' class="' + className + '"' : '') + ' src="' + url + '" alt="' + escapeHtml(username) + '" loading="lazy">';
    }

    /* Emblema de elo: brasão hexagonal metálico na cor do elo, com a divisão por cima. */
    function crest(tierId, division, size) {
        var tier = tierOf(tierId);
        var id = 'rqc' + (++crestCount);
        var label = division || '';

        return '<svg class="rq-crest" width="' + size + '" height="' + size + '" viewBox="0 0 100 100" aria-hidden="true">' +
            '<defs>' +
            '  <linearGradient id="' + id + 'm" x1="0" y1="0" x2="0" y2="1">' +
            '    <stop offset="0" stop-color="' + tier.light + '"/><stop offset="0.5" stop-color="' + tier.mid + '"/><stop offset="1" stop-color="' + tier.dark + '"/>' +
            '  </linearGradient>' +
            '  <radialGradient id="' + id + 'g" cx="0.5" cy="0.4" r="0.6">' +
            '    <stop offset="0" stop-color="#fff"/><stop offset="0.35" stop-color="' + tier.gem + '"/><stop offset="1" stop-color="' + tier.dark + '"/>' +
            '  </radialGradient>' +
            '</defs>' +
            '<path d="M50 4 L62 16 L88 20 L80 44 L92 58 L70 70 L62 94 L50 84 L38 94 L30 70 L8 58 L20 44 L12 20 L38 16 Z" fill="url(#' + id + 'm)" stroke="#010a13" stroke-width="2"/>' +
            '<path d="M50 20 L72 32 L72 58 L50 72 L28 58 L28 32 Z" fill="#010a13" opacity="0.55"/>' +
            '<path d="M50 26 L66 35 L66 55 L50 65 L34 55 L34 35 Z" fill="url(#' + id + 'g)" stroke="' + tier.light + '" stroke-width="1.5"/>' +
            (label
                ? '<text x="50" y="92" text-anchor="middle" font-family="Cinzel, serif" font-weight="700" font-size="17" fill="#f0e6d2" ' +
                  'stroke="#010a13" stroke-width="3" paint-order="stroke">' + label + '</text>'
                : '<path d="M50 38 L53 46 L61 46 L55 51 L57 59 L50 54 L43 59 L45 51 L39 46 L47 46 Z" fill="#fff" opacity="0.9"/>') +
            '</svg>';
    }

    /* Anel da fila, com arco que gira enquanto procura partida. */
    function orb() {
        return '<svg width="230" height="230" viewBox="0 0 230 230" aria-hidden="true">' +
            '<defs>' +
            '  <linearGradient id="rqOrbGold" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#c8aa6e"/><stop offset="1" stop-color="#463714"/></linearGradient>' +
            '  <linearGradient id="rqOrbBlue" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#cdfafa"/><stop offset="1" stop-color="#0ac8b9" stop-opacity="0"/></linearGradient>' +
            '  <radialGradient id="rqOrbCore" cx="0.5" cy="0.45" r="0.55"><stop offset="0" stop-color="#0a323c"/><stop offset="1" stop-color="#010a13"/></radialGradient>' +
            '</defs>' +
            '<circle cx="115" cy="115" r="108" fill="none" stroke="url(#rqOrbGold)" stroke-width="2"/>' +
            '<circle cx="115" cy="115" r="98" fill="url(#rqOrbCore)" stroke="#463714" stroke-width="1"/>' +
            '<circle cx="115" cy="115" r="88" fill="none" stroke="#1e2328" stroke-width="6"/>' +
            '<g class="rq-orb-spin"><circle cx="115" cy="115" r="88" fill="none" stroke="url(#rqOrbBlue)" stroke-width="6" ' +
            'stroke-linecap="round" stroke-dasharray="180 373"/></g>' +
            '</svg>';
    }

    function tierOf(id) {
        for (var i = 0; i < TIERS.length; i++) {
            if (TIERS[i].id === id) {
                return TIERS[i];
            }
        }

        return TIERS[0];
    }

    function logo() {
        return '<svg class="rq-logo" width="34" height="34" viewBox="0 0 40 40" aria-hidden="true">' +
            '<path d="M20 2 L36 11 V29 L20 38 L4 29 V11 Z" fill="#010a13" stroke="#c8aa6e" stroke-width="2"/>' +
            '<circle cx="20" cy="20" r="8" fill="none" stroke="#0ac8b9" stroke-width="2"/>' +
            '<path d="M20 12 L22 18 L28 20 L22 22 L20 28 L18 22 L12 20 L18 18 Z" fill="#f0e6d2"/>' +
            '</svg>';
    }

    function eloText(player) {
        return player.tierName + (player.division ? ' ' + player.division : '') + ' · ' + player.leaguePoints + ' PDL';
    }

    function tickTimers() {
        var target = isOpen() ? root : badgeElement;

        if (!target || target.hidden) {
            return;
        }

        var elapsed = Math.floor((Date.now() - view.stateAt) / 1000);

        target.querySelectorAll('[data-wait]').forEach(function (element) {
            element.textContent = formatWait(Number(element.getAttribute('data-wait')) + elapsed);
        });
    }

    function formatWait(seconds) {
        var minutes = Math.floor(seconds / 60);
        var rest = seconds % 60;
        return minutes + ':' + (rest < 10 ? '0' : '') + rest;
    }

    function escapeHtml(text) {
        return String(text).replace(/[&<>"']/g, function (char) {
            return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char];
        });
    }
})();
