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

    var TIERS = [
        { id: 'bronze', name: 'Bronze', color: '#b0703f', dark: '#6e3f1c' },
        { id: 'silver', name: 'Prata', color: '#a9b4be', dark: '#5f6b75' },
        { id: 'gold', name: 'Ouro', color: '#e0ac24', dark: '#8a6408' },
        { id: 'platinum', name: 'Platina', color: '#3fb0a6', dark: '#1d6a63' },
        { id: 'emerald', name: 'Esmeralda', color: '#22a95e', dark: '#0f6334' },
        { id: 'diamond', name: 'Diamante', color: '#5b7fe0', dark: '#2a4596' },
        { id: 'master', name: 'Mestre', color: '#a052cc', dark: '#5c2380' },
        { id: 'grandmaster', name: 'Grão-Mestre', color: '#d13b43', dark: '#7d161c' },
        { id: 'challenger', name: 'Desafiante', color: '#f2c94c', dark: '#2b6cb0' }
    ];

    var socket = null;
    var root = null;
    var view = {
        tab: 'profile',
        state: null,
        stateAt: 0,
        ranking: null
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
            '    <span class="rq-title">Fila Ranqueada 4x4</span>' +
            '    <button class="rq-close" type="button" aria-label="Fechar">✕</button>' +
            '  </div>' +
            '  <div class="rq-tabs" role="tablist">' +
            tabButton('profile', 'Meu perfil') +
            tabButton('queue', 'Fila') +
            tabButton('ranking', 'Ranking') +
            tabButton('docs', 'Como funciona') +
            '  </div>' +
            '  <div class="rq-content"></div>' +
            '</div>';

        document.body.appendChild(root);

        root.querySelector('.rq-close').addEventListener('click', hide);
        root.addEventListener('click', onClick);
        makeDraggable(root.querySelector('.rq-window'), root.querySelector('.rq-header'));

        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape' && isOpen()) {
                hide();
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
    }

    function hide() {
        if (!isOpen()) {
            return;
        }

        root.hidden = true;
        sendAction('close');
    }

    function onClick(event) {
        var tab = event.target.closest('[data-tab]');

        if (tab) {
            view.tab = tab.getAttribute('data-tab');

            if (view.tab === 'ranking') {
                sendAction('ranking');
            }

            render();
            return;
        }

        var action = event.target.closest('[data-action]');

        if (action) {
            sendAction(action.getAttribute('data-action'));
        }
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

        if (!view.state) {
            content.innerHTML = '<div class="rq-empty">Carregando...</div>';
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

        tickTimers();
    }

    function renderProfile() {
        var me = view.state.me;
        var tier = tierOf(me.tier);
        var hasDivisions = me.division !== '';
        var progress = Math.max(0, Math.min(100, me.leaguePoints));

        return renderMatch() +
            '<div class="rq-card">' +
            '  <div class="rq-profile">' +
            badge(me.tier, me.division, 96) +
            '    <div class="rq-profile-info">' +
            '      <div class="rq-name">' + escapeHtml(me.username) + '</div>' +
            '      <div class="rq-elo" style="color:' + tier.dark + '">' + escapeHtml(eloText(me)) + '</div>' +
            (hasDivisions
                ? '<div class="rq-bar"><span style="width:' + progress + '%"></span></div>' +
                  '<div class="rq-bar-label rq-muted">' + me.leaguePoints + ' / 100 PDL para subir de divisão</div>'
                : '<div class="rq-bar-label rq-muted">' + me.leaguePoints + ' PDL</div>') +
            '    </div>' +
            '  </div>' +
            '  <div class="rq-stats">' +
            stat(me.position ? '#' + me.position : '-', 'No ranking') +
            stat(me.wins, 'Vitórias') +
            stat(me.losses, 'Derrotas') +
            stat(me.draws, 'Empates') +
            stat(me.winRate + '%', 'Aproveitamento') +
            '  </div>' +
            '</div>' +
            '<div class="rq-card">' + renderQueueBar() + '</div>';
    }

    function renderMatch() {
        var match = view.state.match;

        if (!match) {
            return '';
        }

        var players = match.players.map(function (player) {
            return slot(player, player.captain ? 'Capitão' : null);
        }).join('');

        return '<div class="rq-card rq-match">' +
            '  <h3>Partida encontrada!</h3>' +
            '  <p class="rq-muted" style="margin:0 0 10px">Os 8 jogadores abaixo formam a partida. Os dois capitães têm o melhor elo ' +
            'e montam os times. Combinem entre vocês um quarto para jogar.</p>' +
            '  <div class="rq-slots">' + players + '</div>' +
            '  <div style="margin-top:10px;text-align:right">' +
            '    <button class="rq-button is-plain" type="button" data-action="dismiss">Ok, entendi</button>' +
            '  </div>' +
            '</div>';
    }

    function renderQueueBar() {
        var me = view.state.me;
        var queue = view.state.queue;

        if (me.inQueue) {
            return '<div class="rq-queue-bar">' +
                '  <div class="rq-queue-status">' +
                '    <b>Você está na fila</b><br>' +
                '    <span class="rq-muted">Esperando há <span data-wait="' + me.waitSeconds + '"></span> · ' +
                queue.size + '/' + queue.max + ' jogadores</span>' +
                '  </div>' +
                '  <button class="rq-button is-leave" type="button" data-action="leave">Sair da fila</button>' +
                '</div>';
        }

        return '<div class="rq-queue-bar">' +
            '  <div class="rq-queue-status">' +
            '    <b>Você não está na fila</b><br>' +
            '    <span class="rq-muted">' + queue.size + '/' + queue.max + ' jogadores esperando no hotel</span>' +
            '  </div>' +
            '  <button class="rq-button" type="button" data-action="join">Entrar na fila</button>' +
            '</div>';
    }

    function renderQueue() {
        var queue = view.state.queue;
        var slots = queue.players.map(function (player) {
            return slot(player, null, player.waitSeconds);
        });

        for (var i = queue.players.length; i < queue.max; i++) {
            slots.push('<div class="rq-slot is-empty">Vaga livre</div>');
        }

        return '<div class="rq-card">' + renderQueueBar() + '</div>' +
            '<div class="rq-card">' +
            '  <h3>Fila única do hotel · ' + queue.size + '/' + queue.max + '</h3>' +
            '  <div class="rq-slots">' + slots.join('') + '</div>' +
            '</div>';
    }

    function renderRanking() {
        if (!view.ranking) {
            return '<div class="rq-empty">Carregando ranking...</div>';
        }

        if (!view.ranking.length) {
            return '<div class="rq-card rq-empty">Ninguém entrou na fila ainda. Seja o primeiro!</div>';
        }

        var rows = view.ranking.map(function (player) {
            return '<tr class="' + (player.me ? 'is-me' : '') + '">' +
                '<td class="rq-pos">' + player.position + '</td>' +
                '<td><div class="rq-player-cell">' + badge(player.tier, player.division, 30) +
                '<span>' + escapeHtml(player.username) + '</span></div></td>' +
                '<td>' + escapeHtml(eloText(player)) + '</td>' +
                '<td class="rq-num">' + player.wins + 'V ' + player.losses + 'D ' + player.draws + 'E</td>' +
                '</tr>';
        }).join('');

        return '<div class="rq-card" style="padding:0;overflow:hidden">' +
            '<table class="rq-table">' +
            '<thead><tr><th class="rq-pos">#</th><th>Jogador</th><th>Elo</th><th class="rq-num">Partidas</th></tr></thead>' +
            '<tbody>' + rows + '</tbody>' +
            '</table></div>';
    }

    function renderDocs() {
        var tiers = TIERS.map(function (tier) {
            return '<div class="rq-tier-item">' + badge(tier.id, tier.id === 'master' || tier.id === 'grandmaster' || tier.id === 'challenger' ? '' : 'IV', 52) +
                tier.name + '</div>';
        }).join('');

        return '<div class="rq-docs">' +
            '<div class="rq-card">' +
            '  <h3>O que é</h3>' +
            '  <p style="margin:0">Partidas ranqueadas de futebol 4x4: goleiro, zagueiro, meio-campo e atacante em cada time. ' +
            'Existe uma fila só para o hotel inteiro, e você entra nela de qualquer quarto.</p>' +
            '</div>' +
            '<div class="rq-card">' +
            '  <h3>Como jogar</h3>' +
            '  <ul>' +
            '    <li>Digite <b>:queue</b> em qualquer quarto para abrir este painel.</li>' +
            '    <li>Clique em <b>Entrar na fila</b>. Você pode fechar o painel e continuar andando pelo hotel.</li>' +
            '    <li>Quando a fila chega a 8 jogadores, a partida é encontrada e o painel abre sozinho para os 8.</li>' +
            '    <li>Os 2 jogadores com melhor elo viram <b>capitães</b> e montam os times.</li>' +
            '    <li>Ninguém é levado para outro quarto: vocês combinam onde jogar.</li>' +
            '    <li>Para desistir, clique em <b>Sair da fila</b>. Desconectar do hotel também tira você da fila.</li>' +
            '  </ul>' +
            '</div>' +
            '<div class="rq-card">' +
            '  <h3>Elos</h3>' +
            '  <p style="margin:0">Todo jogador começa no <b>Bronze IV</b> com 0 PDL. Qualquer elo pode jogar com qualquer elo.</p>' +
            '  <div class="rq-tiers">' + tiers + '</div>' +
            '  <ul>' +
            '    <li>Do Bronze ao Diamante há 4 divisões, da IV (mais baixa) até a I.</li>' +
            '    <li>Cada divisão tem 100 PDL (Pontos de Liga). Ao chegar a 100, você sobe de divisão.</li>' +
            '    <li>Mestre, Grão-Mestre e Desafiante não têm divisões. Grão-Mestre e Desafiante são os melhores Mestres do hotel.</li>' +
            '  </ul>' +
            '</div>' +
            '<div class="rq-card">' +
            '  <h3>Ganhando e perdendo PDL</h3>' +
            '  <ul>' +
            '    <li>Vitória soma PDL, derrota tira.</li>' +
            '    <li>Um MMR escondido define quanto: vencer jogadores mais fortes vale mais.</li>' +
            '    <li>Empate não muda o PDL de ninguém.</li>' +
            '    <li>Sair do quarto durante a partida conta como derrota para quem saiu.</li>' +
            '  </ul>' +
            '</div>' +
            '</div>';
    }

    function slot(player, tag, waitSeconds) {
        var meta = escapeHtml(eloText(player));

        if (waitSeconds !== undefined) {
            meta += ' · <span data-wait="' + waitSeconds + '"></span>';
        }

        return '<div class="rq-slot' + (player.me ? ' is-me' : '') + '">' +
            badge(player.tier, player.division, 34) +
            '<div class="rq-slot-info">' +
            '  <div class="rq-slot-name">' + escapeHtml(player.username) +
            (player.me ? ' <span class="rq-muted">(você)</span>' : '') +
            (tag ? '<span class="rq-captain">' + tag + '</span>' : '') + '</div>' +
            '  <div class="rq-slot-meta">' + meta + '</div>' +
            '</div>' +
            '</div>';
    }

    function stat(value, label) {
        return '<div class="rq-stat"><b>' + value + '</b><span>' + label + '</span></div>';
    }

    /* Emblema de elo desenhado em SVG: escudo na cor do elo, com a divisão no centro. */
    function badge(tierId, division, size) {
        var tier = tierOf(tierId);
        var label = division || '★';

        return '<svg class="rq-badge" width="' + size + '" height="' + size + '" viewBox="0 0 64 64" aria-hidden="true">' +
            '<path d="M32 3 L57 12 V32 C57 47 46 56 32 61 C18 56 7 47 7 32 V12 Z" fill="' + tier.dark + '"/>' +
            '<path d="M32 8 L52 15.5 V32 C52 44 43.5 51.5 32 55.5 C20.5 51.5 12 44 12 32 V15.5 Z" fill="' + tier.color + '"/>' +
            '<path d="M32 8 L52 15.5 V24 C44 20 20 20 12 24 V15.5 Z" fill="#fff" opacity="0.25"/>' +
            '<text x="32" y="' + (division ? 40 : 42) + '" text-anchor="middle" font-family="Verdana, sans-serif" font-weight="700" ' +
            'font-size="' + (division ? 18 : 22) + '" fill="#fff" stroke="' + tier.dark + '" stroke-width="1.2" paint-order="stroke">' + label + '</text>' +
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

    function eloText(player) {
        return player.tierName + (player.division ? ' ' + player.division : '') + ' · ' + player.leaguePoints + ' PDL';
    }

    function tickTimers() {
        if (!isOpen()) {
            return;
        }

        var elapsed = Math.floor((Date.now() - view.stateAt) / 1000);

        root.querySelectorAll('[data-wait]').forEach(function (element) {
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
