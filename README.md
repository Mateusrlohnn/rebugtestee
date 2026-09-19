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

- O modo 3 reproduz a disputa do Rebug antigo, sem porcentagens artificiais.
- Enquanto o personagem continua andando, seu mesmo evento de caminhada é
  mantido; novos cliques recalculam a rota, mas não criam uma prioridade nova.
- Quando os dois jogadores alcançam a bola no mesmo ciclo, o último contato
  válido daquele ciclo assume a bica e a condução.
- Diagonais, mudança de direção, retorno após bater na parede, bloqueios e
  *miss clicks* influenciam o roubo porque alteram a rota e a ordem real dos
  contatos, como aparece nos vídeos antigos.
- Não existe dono permanente, proteção de um segundo nem sorteio separado para
  mudança de direção ou bica.
- A física e a animação da bola continuam sendo as originais da bola Rebug.

O comando `:clickthrouse` continua controlando a colisão entre jogadores.

## Fila ranqueada (em construção)

Fila 4x4 única para o hotel inteiro, com elo global estilo League of Legends. O
plano completo está em `docs/queue-plano.md`.

- `:queue` é o único comando. Ele abre um painel escuro no estilo do cliente do
  League of Legends, com a foto do jogador e as abas **Perfil**, **Fila**,
  **Ranking** e **Como funciona**.
- A fila é secreta: o painel mostra só quantos jogadores estão esperando, nunca
  quem são. Os nomes aparecem apenas quando a partida é encontrada.
- As fotos vêm do gerador público de avatares do Habbo
  (`habbo.com/habbo-imaging`), a partir do visual do jogador.
- Entrar e sair da fila é feito pelos botões do painel, de qualquer quarto.
  Trocar de quarto não tira ninguém da fila. Quem sai do hotel (ou atualiza a
  página) tem 2 minutos para voltar sem perder o lugar.
- Com o painel fechado, um selo no topo da tela mostra que o jogador está na
  fila (ou que a partida foi encontrada) e reabre o painel com um clique.
- Repetir `:queue` várias vezes seguidas não conta como flood no chat.
- Quando a partida é encontrada, o painel abre sozinho para os 8 com os times e
  a posição de cada um. Ninguém é teleportado: os jogadores combinam onde jogar.
- O painel fica em `app/hotel-web/queue/` e usa a mesma conexão do Nitro: o
  servidor manda o pacote 7700 (JSON) e o painel responde com o 7701 (ação).

### Posições e matchmaking

- Antes de entrar, o jogador escolhe no painel a posição primária e a
  secundária: GK (goleiro), ZAG (zagueiro), MID (meia) ou ATK (atacante). Cada
  partida tem 2 de cada.
- A cada 3 segundos o `Matchmaker` tenta montar uma partida a partir de quem
  espera há mais tempo (o âncora). A espera do âncora abre a busca:

  | Espera | MMR | Posições |
  |---|---|---|
  | 0 a 15 s | ±50 | só primária |
  | 16 a 45 s | ±150 | primária ou secundária |
  | 46 a 90 s | ±300 | + autofill de quem não está protegido |
  | mais de 90 s | ±500 | + autofill de quem não está protegido |

- Autofill escolhe quem tem o MMR mais próximo do âncora. Quem cai em autofill
  ganha proteção (`autofill_protected`): na próxima partida só joga na primária
  ou secundária. A proteção some ao terminar uma partida numa posição escolhida.
- Os times saem em serpente pelo MMR: Azul fica com o 1º, 4º, 5º e 8º; Vermelho
  com o 2º, 3º, 6º e 7º.
- O MMR usa Elo: `E = 1 / (1 + 10^((MMR inimigo - MMR) / 400))` e
  `novo = MMR + K * (resultado - E)`, com K 64 nas 10 primeiras partidas e 32
  depois, contra a média do time adversário.
- O painel mostra as posições em falta ("fila mais rápida como ..."), o aviso de
  autofill e o escudo de proteção.

### Elos

- Bronze IV até Diamante I, 100 PDL por divisão. Chegou a 100, sobe na hora e
  a sobra vai junto; ficou negativo, cai para a divisão anterior descontando de
  100. Bronze IV com 0 é o piso.
- Diamante I com 100 PDL vira Mestre (sem teto de PDL; negativo volta ao
  Diamante I).
- Grão-Mestre: 10 vagas logo abaixo dos Desafiantes, recalculadas depois de
  cada partida. Desafiante: 3 vagas para os maiores PDL, recalculadas todo dia
  à meia-noite (horário de Brasília).
- Cada partida vale de 10 a 30 PDL, conforme o MMR escondido dos dois times.
  Empate não muda nada.
- O motor fica em `LeagueRules`, `RankedLadder` e `RankedScoring`. O resultado
  das partidas ainda não é registrado: isso vem com a partida automática.

A tabela `queue_ranking` (com as posições e a proteção) e a permissão do comando
são criadas por `database/queue.sql`, executado a cada abertura do hotel.

### Testes

Os testes ficam em `app/Emulator/Comet-Server/src/test/java`. O Maven do projeto
não resolve as dependências, então eles rodam com o JDK de `tools/` e as
bibliotecas de `app/lib` (depois de compilar as classes do servidor em `out/`):

```bash
JDK=$(ls -d tools/jdk17/*/bin)
"$JDK/javac.exe" -encoding UTF-8 -cp "out;app/lib/*;app/coerce-runtime/*" -d test-out \
  app/Emulator/Comet-Server/src/test/java/com/cometproject/server/game/ranked/*.java
"$JDK/java.exe" -cp "test-out;out;app/lib/*;app/coerce-runtime/*" org.junit.runner.JUnitCore \
  com.cometproject.server.game.ranked.MmrCalculatorTest com.cometproject.server.game.ranked.MatchmakerTest \
  com.cometproject.server.game.ranked.AutofillProtectionTest com.cometproject.server.game.ranked.TeamBalancerTest \
  com.cometproject.server.game.ranked.LeagueRulesTest
```

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
