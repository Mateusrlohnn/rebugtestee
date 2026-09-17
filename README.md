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
