# Plano: comando `:queue`

Fila ranqueada 4x4 de futebol, estilo "procurar partida" do League of Legends.
Branch: `feature/queue`.

## Decisões

- **Formato:** 4x4 fixo. Posições: goleiro, zagueiro, meio-campo e atacante.
- **Escopo da fila:** única para o hotel inteiro, secreta (só a contagem e as
  posições em falta aparecem). O ranking é global.
- **Posições na fila:** cada jogador escolhe primária e secundária no painel.
  Matchmaker com janela de MMR crescente pelo tempo de espera, autofill a
  partir de 46 s e proteção contra autofill repetido (ver README).
- **Times:** montados automaticamente em serpente pelo MMR (Azul 1º, 4º, 5º e
  8º; Vermelho 2º, 3º, 6º e 7º). Não há capitães nem draft manual.
- **Partida:** conduzida pelo servidor. 2 tempos de 10 minutos, placar ao vivo,
  gol detectado automaticamente, registrando o autor (e gol contra). Termina
  sozinha quando o tempo acaba.
- **Resumo:** placar, autores dos gols com minuto e PDL ganho/perdido de cada
  jogador, disponível no `:queue`.

## Elo estilo LoL

- Bronze, Prata, Ouro, Platina, Esmeralda, Diamante com divisões IV → I,
  100 PDL por divisão.
- Mestre, Grão-Mestre e Desafiante sem divisões. Grão-Mestre e Desafiante são
  os melhores do hotel entre os Mestres (vagas configuráveis).
- MMR oculto define quanto PDL se ganha ou perde.
- Qualquer elo pode jogar com qualquer elo.

### Regras assumidas

- Jogador novo: Bronze IV, 0 PDL, sem partidas de classificação.
- Empate: ninguém ganha nem perde PDL.
- Sair do quarto durante a partida conta como derrota para quem saiu.
- Time Azul ataca o gol vermelho e vice-versa; sem troca de lado no intervalo.

## Arquitetura

- **Servidor (Comet):** `QueueCommand` registrado no `CommandManager`,
  `QueueManager` com o estado da fila por quarto, tabela `queue_ranking` e
  histórico de partidas e gols.
- **Subtela:** o cliente Nitro vem compilado, sem código-fonte. O painel fica em
  `app/hotel-web/index.html`, por cima do jogo, e observa o WebSocket que o
  Nitro já abre para trocar mensagens próprias da fila. Não precisa de porta
  nem de túnel novo.
- **Gols:** `FootballGoalFloorItem` já detecta a bola no gol e sabe quem chutou.
- **Pendência:** o quarto `aaa` não tem traves. Faltam os arquivos do
  `fball_goal_b` / `fball_goal_r` no Nitro e as definições no banco.

## Notas de implementação

- As classes ficam em `game.ranked` (`RankedQueueManager`, `RankedQueue`,
  `RankedProfile`, `RankedTier`) porque o Comet já tem uma `RoomQueue`
  (fila de espera de quarto lotado).
- **Build:** não há Maven. As classes alteradas são compiladas com
  `javac --release 17` contra os jars de `app/lib` e gravadas no
  `Comet-Server-2.11.1-TEST1.jar` com `jar uf`.
- **Cuidado:** parte do código-fonte não bate com o jar. O
  `CommandManager.java` foi ajustado para ficar igual ao jar (prefixo só `:`,
  `NewFurniFixCommand`, sem verificação de PIN) antes de receber o `:queue`.
  Antes de recompilar qualquer outra classe, compare o bytecode dela com o jar
  (`javap -c -p`).
- **Já alinhados ao jar** (o fonte divergia e foi corrigido):
  - `PlayerLoginRequest`: marca o PIN como verificado no login, envia um segundo
    `PingMessageComposer` depois do `CfhTopicsInit` e não abre a janela de
    verificação de PIN para staff.
  - `MessageHandler`: com `isDebugging`, registra cada pacote recebido
    (`[header] Evento conteúdo`).
  - Comet-API: `CometExternalSettings.baseAlertLink` (lido no boot pelo
    `ConfigDao.getExternalConfig` e usado pelo `HotelAlertLinkCommand`) e
    `IPlayer.INFINITE_BALANCE = String.valueOf(Integer.MAX_VALUE)`.
  - Conferidos e iguais ao jar, fora as mudanças da fila: `Player`,
    `PlayerEntity`, `CommandManager` e o resto da Comet-API (as únicas
    diferenças são o modo `PRESSURE` e classes novas de `messaging`).

## Etapas

1. Servidor: `:queue` + `QueueManager` + tabela `queue_ranking`, testado só com
   mensagens no chat.
2. Mensagens próprias servidor/navegador + painel no `index.html` (fila ao vivo).
3. Posições, matchmaking por MMR, autofill com proteção e times em serpente (feito).
4. Partida: cronômetro 2x10, placar, gols com autor, encerramento automático.
5. Elo/PDL + resumo da partida + ranking no painel.
6. Traves no campo + README.
