# Hotel Rebug local

Pacote de teste local do Comet + Nitro antigo, com a bola Rebug e o modo de
Nitro Futebol criado durante os testes.

## Abrir pela primeira vez

Este pacote foi preparado para Windows 10/11 de 64 bits.

1. Baixe o repositorio pelo botao **Code > Download ZIP** e extraia a pasta.
2. Dê dois cliques em `1-Instalar.cmd`. A primeira instalacao baixa Java 17,
   MariaDB, Python portatil e Cloudflared. Isso acontece apenas uma vez.
3. Quando terminar, dê dois cliques em `2-Abrir-Hotel.cmd`.
4. O hotel abre em `http://127.0.0.1:8080/?sso=localplayer1`.

Para desligar tudo, use `Fechar-Hotel.cmd`.

## Jogar com outra pessoa

1. Abra o hotel normalmente.
2. Dê dois cliques em `3-Abrir-Para-Amigo.cmd`.
3. O arquivo `Link-Do-Amigo.txt` passa a mostrar três links diferentes, para
   as contas `Amigo`, `Jogador2` e `Jogador3`. Envie um link para cada pessoa.
4. O endereço é temporário e só funciona enquanto seu computador estiver
   ligado e o hotel estiver aberto.

Use `Fechar-Acesso-Externo.cmd` para encerrar os túneis.

## Nitro Futebol

Nos quartos de futebol configurados, use `:futnitro 3`.

- O primeiro jogador que toca na bola recebe a prioridade daquele movimento.
- Andar reto não sorteia roubo.
- O roubo só pode ser sorteado quando o dono muda a direção perto da bola e o
  adversário também está em movimento, disputando a mesma bola.
- As chances são 3% (45 graus), 5% (90 graus), 7% (135 graus) e 10% (180 graus).
- Uma bica confirmada do adversário também tem 2% de chance de roubar o Nitro,
  independentemente da direção do avatar.
- Mudança de direção e bica possuem intervalos separados de 1 segundo. Assim,
  uma virada do dono não cancela a tentativa da bica do adversário.
- Quando o jogador para de andar, perde a prioridade. A próxima jogada começa
  sem um dono fixo.
- A física e a animação da bola continuam sendo as originais da bola Rebug.

O comando `:clickthrouse` continua controlando a colisão entre jogadores.

## Fila ranqueada (em construção)

Fila 4x4 única para o hotel inteiro, com elo global estilo League of Legends. O
plano completo está em `docs/queue-plano.md`.

- `:queue` é o único comando. Ele abre um painel por cima do jogo com as abas
  **Meu perfil**, **Fila**, **Ranking** e **Como funciona**.
- Entrar e sair da fila é feito pelos botões do painel, de qualquer quarto.
  Trocar de quarto não tira ninguém da fila; desconectar do hotel tira.
- Com 8 jogadores, a partida é encontrada, o painel abre sozinho para os 8 e os
  2 melhores do ranking viram capitães. Ninguém é teleportado: os jogadores
  combinam onde jogar.
- O painel fica em `app/hotel-web/queue/` e usa a mesma conexão do Nitro: o
  servidor manda o pacote 7700 (JSON) e o painel responde com o 7701 (ação).

A tabela `queue_ranking` e a permissão do comando são criadas por
`database/queue.sql`, executado a cada abertura do hotel.

## Campo e movimentação

- O quarto `aaa` do `Jogador1` recebe automaticamente somente o campo completo:
  21 placas de gramado formando laterais, áreas, meias-luas e círculo central.
  A bola Rebug fica no centro.
- O campo é instalado por `database/campo-futebol.sql` na primeira abertura.
- O inventário do `Jogador1` recebe 100 unidades de cada uma das 9 partes do
  gramado (900 placas ao todo).
- O inventário também recebe 500 unidades do `Alambrado pequeno`, usado para
  cercar o campo.
- Atravessar jogadores continua desligado. Ao clicar numa casa ocupada por
  outro avatar, o personagem procura a casa livre alcançável mais próxima ao
  redor dele, em qualquer direção, em vez de travar.

## Conteúdo

- `app/Emulator`: código-fonte e binários compilados do emulador.
- `app/hotel-web`: Nitro antigo e seus recursos.
- `app/lib`: bibliotecas usadas pelo emulador.
- `database/habbo.sql`: banco inicial com quartos, contas de teste e bolas.
- `database/campo-futebol.sql`: móveis e montagem do campo do quarto `aaa`.
- `scripts`: instalação e inicialização portáteis.

As dependências grandes são baixadas na primeira instalação e ficam nas pastas
ignoradas `tools` e `runtime`; elas não precisam ser enviadas ao GitHub.

Uso destinado a testes privados e locais. Respeite as licenças e os direitos
dos projetos e recursos de terceiros incluídos.
