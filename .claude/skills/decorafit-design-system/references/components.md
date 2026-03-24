# Decorafit Components

Use este arquivo quando precisar escolher componentes, revisar consistencia, decidir entre reutilizar ou criar algo novo, ou definir estados e variantes.

## Sumario

- Como usar este arquivo
- Hierarquia de reutilizacao
- Quando criar componente novo
- Estados obrigatorios
- Biblioteca de componentes
- Componentes de contexto Decorafit
- Checklist de entrega
- Anti-patterns

## 1. Como usar este arquivo

Antes de propor ou implementar UI:
1. identifique o componente ou padrao necessario
2. procure equivalente existente
3. decida entre reutilizar, estender ou criar novo
4. defina estados, variantes e comportamento responsivo

Ao final, deixe explicito para os componentes principais se foram:
- reutilizados
- estendidos
- novos

## 2. Hierarquia de reutilizacao

Sempre seguir esta ordem:
1. reutilizar componente existente
2. estender variante, estado, tamanho ou slot
3. compor com componentes existentes
4. criar componente novo apenas se houver nova responsabilidade semantica ou novo padrao recorrente

### Nao criar componente novo quando o problema for apenas:
- espacamento
- densidade
- hierarquia visual
- icone diferente
- variacao de copy
- combinacao de props que a API atual ja suporta

Nestes casos, preferir:
- nova variante
- novo tamanho
- novo estado
- nova composicao

## 3. Quando criar componente novo

Criar componente novo apenas se pelo menos um destes pontos for verdadeiro:
- a responsabilidade semantica mudou
- a interacao e diferente de forma relevante
- o padrao vai se repetir em varias telas
- compor componentes existentes geraria API confusa ou markup fragil

Todo componente novo deve nascer com:
- nome claro
- responsabilidade unica
- variantes e estados definidos
- comportamento mobile e desktop
- acessibilidade prevista
- motion previsto, quando relevante
- criterio de composicao com outros componentes

## 4. Estados obrigatorios

Todo componente que exibe dados ou responde a acao precisa prever:
- loading
- empty, quando aplicavel
- error
- partial, quando aplicavel
- ideal

Regras:
- loading prefere skeleton a spinner isolado
- error fala linguagem humana
- empty explica o motivo e sugere proxima acao
- partial mostra o que existe sem esconder o que falta

## 5. Biblioteca de componentes

### Acoes

#### Button
- variants: primary, secondary, ghost, destructive quando necessario
- precisa prever: default, hover, focus, active, disabled, loading, success temporario

#### Icon button
- usar apenas quando o significado for obvio ou houver label acessivel
- touch target minimo em mobile

#### Link action
- usar para acao secundaria e navegacao leve
- nao competir com CTA principal

### Formularios

#### Input
- altura confortavel em mobile
- label e help text quando necessario
- erro inline claro

#### Textarea
- para entrada textual real, nao improvisar com input esticado

#### Select
- usar quando houver lista fechada
- se busca for importante, considerar combobox ou filtro de busca

#### Checkbox, radio, switch
- checkbox para multiplas selecoes
- radio para escolha unica
- switch para estado binario imediato

#### Date range
- essencial em filtros e financeiro
- nao improvisar com dois inputs soltos se a relacao temporal for central

#### File upload
- importante para documentos, fotos e comprovacoes
- precisa mostrar progresso, erro e sucesso

### Superficies e feedback

#### Card
- agrupador basico de informacao
- pode variar por densidade, mas nao deve virar componente generico demais

#### Badge
- usar para estado ou classificacao curta
- nao colorir todos os badges ao mesmo tempo em telas densas

#### Empty state
- icone neutro + motivo + acao contextual

#### Skeleton
- deve imitar estrutura real
- evitar shimmer exagerado

#### Toast
- feedback breve, nao modal
- nunca substituir erro importante que precisa contexto

#### Modal
- usar para decisao focada ou confirmacao forte
- nao esconder fluxo inteiro dentro de modais encadeados

#### Drawer
- bom para detalhe, filtro e acoes secundarias
- especialmente forte em backoffice e mobile

#### Tooltip
- complementar, nao essencial
- nao esconder informacao critica dentro dele

### Navegacao e produtividade

#### Search bar
- tratar como componente central quando busca move a experiencia

#### Filters
- devem ser claros, resumiveis e reversiveis
- mostrar estado ativo e contagem quando fizer sentido

#### Table
- componente central do backoffice
- precisa prever coluna, ordenacao, filtro, empty, loading, linha selecionada e detalhe

#### List + detail
- forte para executor e backoffice
- manter contexto do item selecionado

#### Pagination
- usar quando volume pedir
- nao improvisar com botao "carregar mais" se o fluxo exigir navegacao controlada

#### Tabs
- usar para alternar contextos proximos
- nao usar como desculpa para empilhar conteudo sem hierarquia

#### Accordion
- usar para revelar detalhe secundario
- nao esconder conteudo principal dentro dele

#### Dropdown menu
- usar para acoes secundarias agrupadas
- evitar esconder acao principal

#### Bulk actions
- obrigatorio quando o backoffice opera listas grandes

## 6. Componentes de contexto Decorafit

### Timeline de obra
- mostra etapa, progresso, ultima atualizacao, proxima etapa e bloqueio

### Stepper por etapa
- bom para aprovacoes, onboarding e fluxo operacional

### Card de aprovacao
- mostra decisao, impacto em prazo e custo, e acao principal

### Card de ambiente
- conecta comodo, status, imagens e escolhas relevantes

### Comparador antes e depois
- sempre contextual
- nao usar como efeito vazio

### Galeria de fotos com legenda
- fotos sao evidencia, nao decoracao

### Resumo de custo e prazo
- precisa ser legivel e confiavel
- valores e deltas devem ficar claros

### Checklist operacional
- tarefa, prova de conclusao e bloqueio no mesmo contexto

### Prova de execucao
- upload, confirmacao e erro precisam ser muito claros

## 7. Checklist de entrega

- [ ] O componente central foi reutilizado ou estendido antes de considerar algo novo
- [ ] Variantes e estados foram definidos
- [ ] Mobile e desktop foram considerados
- [ ] Acessibilidade foi considerada
- [ ] Motion foi considerado quando relevante
- [ ] O componente melhora o sistema, nao so a tela atual

## 8. Anti-patterns

- criar componente novo por variacao visual pequena
- duplicar componente por tela
- criar componente enorme com muitas responsabilidades
- esconder estado importante dentro de tooltip
- improvisar fluxo de upload, tabela ou filtro com componentes genericos demais
- usar modal para substituir pagina inteira sem necessidade
