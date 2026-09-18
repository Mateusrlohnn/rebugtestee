# Plano: comando `:queue`

Fila ranqueada 4x4 de futebol, estilo "procurar partida" do League of Legends.
Branch: `feature/queue`.

## Decisões

- **Formato:** 4x4 fixo. Posições: goleiro, zagueiro, meio-campo e atacante.
- **Escopo da fila:** por quarto. O ranking é global (vale em qualquer quarto).
- **Sem escolha de posição na fila.** Com 8 jogadores, os 2 com melhor ranking
  global viram capitães (desempate: MMR, depois sorteio).
- **Draft:** capitães escolhem alternado (A-B-B-A-A-B) e definem a posição de
  cada escolhido. Todos acompanham ao vivo.
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

## Etapas

1. Servidor: `:queue` + `QueueManager` + tabela `queue_ranking`, testado só com
   mensagens no chat.
2. Mensagens próprias servidor/navegador + painel no `index.html` (fila ao vivo).
3. Aceitar partida + capitães + draft pelo painel.
4. Partida: cronômetro 2x10, placar, gols com autor, encerramento automático.
5. Elo/PDL + resumo da partida + ranking no painel.
6. Traves no campo + README.
