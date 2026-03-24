# Decorafit Actors

Use este arquivo quando a decisao de UI depender de ator, tom, densidade, navegacao ou prioridade de informacao.

## Sumario

- Visao rapida dos tres atores
- Cliente
- Executor
- Backoffice
- Microcopy por ator
- Layout e navegacao por ator
- Anti-patterns por ator

## 1. Visao rapida dos tres atores

| Ator | Missao | Densidade | Mobile | Desktop | CTAs |
|---|---|---|---|---|---|
| Cliente | reduzir ansiedade | baixa | 1 coluna | 1 a 2 colunas fluidas | maximo 1 |
| Executor | clareza operacional | media | 1 coluna task-first | 2 colunas, podendo abrir mais contexto em telas largas | 1 a 2 |
| Backoffice | eficiencia maxima | alta | cards ou drawer | sidebar + conteudo fluido | multiplos |

## 2. Cliente

### Missao
Reduzir ansiedade e aumentar percepcao de controle sem sobrecarregar.

### O que deve dominar
- progresso da obra
- proxima etapa
- aprovacoes pendentes
- prazo e contexto
- evidencias visuais relevantes

### Densidade e CTA
- baixa densidade
- espaco em branco generoso
- no maximo 1 CTA primario por tela

### Tom
- caloroso
- claro
- tranquilizador
- sem jargao tecnico de obra

### Navegacao
- mobile: bottom nav simples ou navegacao curta
- desktop: topbar leve, layout fluido e sem aprisionar a pagina inteira em uma coluna estreita

### Layout
- mobile: 1 coluna
- tablet: coluna unica ou composicao simples
- desktop: 1 ou 2 colunas fluidas; limitar a largura do texto, nao da pagina inteira

### O que evitar
- tabelas densas
- mais de 1 CTA principal
- excesso de filtros
- linguagem tecnica

## 3. Executor

### Missao
Ajudar a concluir a tarefa certa agora, com o menor numero de toques possivel.

### O que deve dominar
- o que fazer
- onde
- ate quando
- o que prova conclusao
- o que esta bloqueando

### Densidade e CTA
- densidade media
- prioridade absoluta para a tarefa do agora
- 1 a 2 CTAs por tela, sem competir entre si

### Tom
- direto
- operacional
- curto
- sem rodeio

### Navegacao
- mobile: bottom nav, tabs curtas ou drawer funcional
- desktop: 1 ou 2 colunas no maximo

### Layout
- mobile: 1 coluna, acao evidente
- tablet: contexto secundario pode aparecer
- desktop: lista + detalhe quando fizer sentido, podendo abrir 2 ou 3 zonas funcionais em telas largas

### O que evitar
- onboarding longo
- confirmacoes demais
- animacao ornamental
- formularios extensos

## 4. Backoffice

### Missao
Maximizar throughput, triagem e qualidade de decisao.

### O que deve dominar
- o que exige acao hoje
- o que esta atrasado
- o que esta bloqueado
- o que saiu do esperado
- onde agir agora

### Densidade e CTA
- densidade alta
- multiplas acoes podem existir, mas uma sempre lidera
- tabelas, filtros e bulk actions sao bem-vindos

### Tom
- funcional
- objetivo
- termos internos sao aceitos

### Navegacao
- mobile: cards empilhados, drawer ou bottom nav
- tablet: sidebar colapsada ou navegacao por icones
- desktop: sidebar completa + conteudo fluido

### Layout
- mobile: stacked cards
- tablet: contexto reduzido
- desktop: grid funcional, paines, tabelas e detalhe ocupando o espaco disponivel

### O que evitar
- esconder informacao critica em nome de limpeza
- tom infantilizado
- transicoes lentas entre views operacionais

## 5. Microcopy por ator

### Cliente
Preferir:
- "Sua equipe atualizou a obra hoje"
- "Faltam 2 aprovacoes para seguir a proxima etapa"
- "Sua reforma esta avancando conforme o previsto"

Evitar:
- "Nenhum resultado encontrado"
- "Erro 500"
- "OS concluida com pendencia de insumo"

### Executor
Preferir:
- "3 tarefas para hoje"
- "Envie 2 fotos para concluir esta etapa"
- "Sem sinal agora? O envio continua quando a conexao voltar"

Evitar:
- texto longo
- mensagens vagas
- sucesso sem confirmacao objetiva

### Backoffice
Preferir:
- "12 projetos com atraso acima de 3 dias"
- "5 aprovacoes aguardando resposta do cliente"
- "2 executores sem envio hoje"

Evitar:
- copy emotiva demais
- frases longas
- esconder numeros importantes

## 6. Layout e navegacao por ator

### Cliente
- maximo de respiro
- poucos blocos
- status + proxima acao + contexto
- em telas grandes, usar o espaco para contexto lateral, comparacao ou modulos secundarios, sem aumentar densidade de forma agressiva

### Executor
- acao no topo
- formularios curtos
- progresso e prova de execucao na mesma jornada
- em telas grandes, expandir contexto operacional sem transformar a tela em painel poluido

### Backoffice
- filtros visiveis
- colunas uteis
- detalhe acessivel sem perder contexto
- nunca usar `max-width` fixo na pagina principal do backoffice

## 7. Anti-patterns por ator

### Cliente
- excesso de opcoes
- tabelas grandes
- tom frio ou corporativo demais

### Executor
- fluxo com muitos toques
- feedback tardio
- esconder dependencia critica

### Backoffice
- dashboards que nao destacam excecao
- tabela sem filtro e sem criterio de prioridade
- interface limpa, mas improdutiva
