# Decorafit Motion System

## Sumario

- Por que este arquivo existe
- Papel do motion
- Direcao de design
- Principios
- Guardrails de performance
- Primitivos de motion
- Ritmo por ator
- Motion de navegacao
- Superficies e overlays
- Componentes e microinteracoes
- Views de dados
- Comportamento de loading
- Reduced motion
- Faca e nao faca
- Checklist de entrega
- Padroes de implementacao
- Resumo

## Por que este arquivo existe

Este arquivo concentra comportamento, coreografia e regras de performance de motion.
O `SKILL.md` deve continuar focado em workflow e tomada de decisao.
O `brand.md` deve continuar focado em tokens e regras visuais.
Motion fica aqui porque e uma camada comportamental que so precisa ser carregada quando for relevante para a tarefa.

## Papel do motion

Na Decorafit, motion nao e decoracao.
Ele deve cumprir um ou mais destes papeis:
- explicar o que mudou
- preservar continuidade espacial
- confirmar que uma acao funcionou
- reduzir a latencia percebida
- guiar a atencao sem gerar ruido

Se uma animacao nao melhora entendimento, confianca ou velocidade, remova.

## Direcao de design

O motion da Decorafit deve parecer:
- preciso
- silencioso
- contemporaneo
- rapido
- contido

O produto e minimalista e quase monocromatico na maior parte do tempo.
O motion deve seguir a mesma logica: sutil, intencional e nunca teatral.

## Principios

### 1. Funcional antes de bonito
Toda transicao deve esclarecer estado, hierarquia ou relacao entre elementos.
Nunca anime apenas para "parecer premium".

### 2. Rapido por padrao
A maior parte do motion deve parecer imediata.
A interface precisa continuar responsiva em mobile intermediario e em telas densas de desktop.

### 3. Saidas mais rapidas que entradas
Dismiss e fechamento devem liberar o caminho rapidamente.
Entradas podem ser um pouco mais lentas para ajudar na compreensao.

### 4. Continuidade espacial importa
Novo conteudo deve surgir de um lugar logico.
Listas devem se conectar ao detalhe.
Drawers devem vir de uma borda real.
Paineis devem parecer anexados ao layout ao qual pertencem.

### 5. Calma antes de espetaculo
Evite bounce, overshoot elastico, zoom dramatico, parallax e delays cinematograficos.
Decorafit e experiencia de produto, nao demo de motion.

### 6. Motion nao pode bloquear conteudo
Nunca condicione navegacao, visibilidade de dados ou preenchimento de formulario a intros longas ou sequencias decorativas.

### 7. Acessibilidade e obrigatoria
Respeite `prefers-reduced-motion`.
Nao use motion como unico sinal de sucesso, erro, selecao ou hierarquia.

### 8. Performance e parte da qualidade de design
Motion travado e pior do que nenhum motion.
A meta e manter uma taxa de quadros alta e estavel, idealmente 60fps em hardware comum.

## Guardrails de performance

### Regra padrao
Prefira animar:
- `transform`
- `opacity`

Use cautela extra com:
- `filter`
- `backdrop-filter`
- animacao de sombra grande

Evite animar propriedades pesadas de layout na UI normal do produto:
- `width`
- `height`
- `top`
- `left`
- `right`
- `bottom`
- `margin`
- `padding`
- `border-width`

Notas:
- Excecoes pequenas e isoladas podem existir, mas so quando forem testadas e realmente compensarem.
- Se uma mudanca de layout for necessaria, anime a superficie filha ou a camada percebida ao redor dela, em vez do reflow da pagina inteira.
- Use `will-change` com parcimonia e remova quando a interacao terminar.
- Prefira transicoes CSS para microinteracoes simples.
- Use bibliotecas JS so quando precisar coordenar sequencias complexas ou shared-element style transitions.
- Nunca carregue uma biblioteca pesada de motion apenas para hover ou um painel pequeno.
- Lazy-load qualquer ferramental de motion mais pesado se ele nao for necessario na primeira tela.
- Nao use autoplay de Lottie, MP4 ou efeitos pesados em canvas nos fluxos centrais de navegacao.
- Evite animacao continua de fundo.

## Primitivos de motion

Use os primitivos definidos em `brand.md`:

```css
--duration-fast:  100ms;
--duration-base:  200ms;
--duration-slow:  300ms;
--duration-exit:  150ms;
--ease-default:   cubic-bezier(0.4, 0, 0.2, 1);
--ease-enter:     cubic-bezier(0, 0, 0.2, 1);
--ease-exit:      cubic-bezier(0.4, 0, 1, 1);
```

Mapeamento semantico recomendado:
- hover, focus, pressed: `--duration-fast` + `--ease-default`
- troca pequena de estado: 120ms a 160ms
- reveal de conteudo: `--duration-base` + `--ease-enter`
- dismiss: `--duration-exit` + `--ease-exit`
- superficies grandes como drawer ou modal: 200ms a 240ms para entrar, 140ms a 180ms para sair

Limites duros:
- evite qualquer coisa mais lenta que 300ms na navegacao central do produto
- evite cadeias longas de stagger
- evite loops continuos na UI do produto, exceto quando servirem loading ou atencao critica

## Ritmo por ator

### Cliente
Objetivo:
Fazer progresso e aprovacoes parecerem calmos e confiaveis.

Ritmo:
- um pouco mais suave do que os outros atores
- fade + pequeno translate e o padrao preferido
- movimento tipico: 8px a 16px
- entrada tipica: 180ms a 240ms
- saida tipica: 120ms a 180ms

Usar motion para:
- progressao da timeline
- reveal da ultima atualizacao
- confirmacao de aprovacao
- transicao entre resumo e detalhe

Evitar:
- mudancas grandes de escala
- cards quicando
- staggers longos em galerias ou fluxos financeiros

### Executor
Objetivo:
Ajudar a concluir a tarefa com o menor atraso possivel.

Ritmo:
- o mais rapido dos tres atores
- movimento curto e direto
- movimento tipico: 4px a 8px
- entrada tipica: 120ms a 180ms
- saida tipica: 100ms a 150ms

Usar motion para:
- troca de estado de botao
- upload e confirmacao de envio
- conclusao de checklist
- acoes em drawer ou bottom sheet

Evitar:
- motion ornamental
- transicoes lentas entre etapas
- animacoes que concorram com digitacao ou preenchimento

### Backoffice
Objetivo:
Manter throughput alto em interfaces densas.

Ritmo:
- sutil e quase invisivel
- motion deve apoiar a leitura, nao interromper
- movimento tipico: 2px a 6px
- entrada tipica: 120ms a 180ms
- saida tipica: 100ms a 150ms

Usar motion para:
- reveal de painel de detalhe
- feedback de filtro e ordenacao
- highlight de linha apos atualizacao
- toast e feedback de sucesso ou erro

Evitar:
- transicoes de pagina inteira em views densas
- comportamento de card flutuante em telas operacionais
- cascata linha a linha em tabelas grandes

## Motion de navegacao

### Transicoes de rota e pagina
- Mantenha o shell estavel sempre que possivel.
- Anime a regiao que mudou, nao o app inteiro.
- Prefira fade + translate em vez de escala complexa ou blur.
- O movimento de entrada deve ser pequeno e direcional.
- A saida deve ser mais curta e mais rapida que a entrada.

Padrao recomendado:
- enter: opacity `0 -> 1`, translateY `8px -> 0`
- exit: opacity `1 -> 0`, translateY `0 -> 4px`

Use distancia menor no Backoffice e um pouco maior no Cliente.

### Lista para detalhe
- Preserve uma relacao visivel entre o item selecionado e o detalhe aberto.
- Se houver painel lateral, abra o painel mantendo a lista estavel.
- Se houver troca de rota, mantenha uma ancora visual como titulo, thumbnail ou estado selecionado da linha.
- Shared-element style transitions sao aceitas apenas quando forem simples e confiaveis.
- Nao coreografe dezenas de elementos ao mesmo tempo.

### Tabs e controles segmentados
- Anime primeiro o indicador ativo, underline ou pill.
- Se o conteudo for parecido, use crossfade rapido ou slide direcional curto na regiao de conteudo.
- Nao anime a pagina inteira para trocar de tab.

## Superficies e overlays

### Drawer e bottom sheet
- Devem vir de uma borda real.
- Use transform na superficie e opacity no overlay.
- Mantenha o fundo estavel.
- Evite blur pesado atras da sheet, a menos que tenha sido testado no hardware alvo.

Padrao recomendado:
- drawer enter: translateX ou translateY de `16px` para `0`, em 200ms a 240ms
- drawer exit: 140ms a 180ms
- overlay fade: 120ms a 160ms

### Modal
- Prefira opacity + pequeno translate ou opacity + leve scale de `0.98 -> 1`.
- O fundo nao deve dar zoom dramatico.
- Em superficies densas de backoffice, translate costuma funcionar melhor do que scale.

### Tooltip e dropdown
- Motion extremamente leve.
- 80ms a 140ms basta.
- Nunca adicione bounce ou cascatas com atraso.

## Componentes e microinteracoes

### Botoes
- hover: cor, borda, sombra ou background em `100ms`
- active: `scale(0.98)` sutil e aceitavel
- loading: manter area do label estavel e mostrar progresso inline
- sucesso: manter o estado visivel por cerca de `800ms` a `1200ms`

Nunca:
- deslizar o layout inteiro porque um botao foi pressionado
- usar ripple dramatico
- fazer o feedback de sucesso demorar mais do que a propria acao

### Inputs e formularios
- focus deve ser imediato e limpo
- validacao deve aparecer rapido, sem flicker durante digitacao
- evite shake animation para erro
- prefira mensagem inline clara + borda ou icone

### Cards
- hover deve ser sutil
- use pequeno translate ou pequeno ajuste de sombra, nao os dois de forma agressiva
- cards no Cliente podem ser um pouco mais suaves do que no Backoffice

### Toasts
- entrar com pequeno offset vertical e fade
- sair rapido
- nunca bloquear a proxima acao

### Empty, loading e sucesso
- empty state pode entrar com fade
- loading deve preferir skeleton a spinner
- sucesso deve ser claro, breve e sem celebracao exagerada

## Views de dados

### Tabelas
- Nao anime toda linha no carregamento inicial.
- Nao use stagger em tabelas grandes.
- Se os dados mudarem, anime apenas o que mudou:
  - highlight de background da linha
  - fade de valor inline
  - reveal de painel de detalhe
- Ordenacao e filtro devem mostrar feedback rapido no controle e refresh contido no conteudo.

### Charts e KPIs
- Use animacao de chart com parcimonia.
- Anime apenas no primeiro render significativo ou em mudanca grande de contexto.
- Mantenha a animacao curta, normalmente abaixo de `300ms` a `400ms`.
- Nao atrase a leitura do dashboard com barras entrando uma a uma por muito tempo.
- Em KPI numerico, anime apenas os poucos valores que realmente importam.

### Timeline
- O fill do progresso pode animar rapidamente.
- Reveal de etapa deve ser pequeno e ordenado.
- A ultima atualizacao precisa continuar sendo o foco principal.

## Comportamento de loading

### Skeletons
- Prefira skeletons que imitem a estrutura real.
- Mantenha o shimmer sutil.
- Em telas densas ou dispositivos mais fracos, skeleton estatico ou pulse leve costuma ser melhor do que shimmer largo.
- Nunca combine shimmer com varias entrance animations nao relacionadas na mesma tela.

### Refresh de dados
- Preserve layout sempre que possivel.
- Prefira refresh localizado em vez de limpar a pagina inteira e reexecutar todas as animacoes.
- Se houver refresh em background, use feedback pequeno de status em vez de reanimar a view toda.

## Reduced motion

Quando `prefers-reduced-motion: reduce` estiver ativo:
- remova movimentos grandes
- remova shared-element transitions
- remova shimmer ou troque por skeleton estatico
- mantenha mudancas de opacity apenas quando necessario
- use transicoes instantaneas ou quase instantaneas para o que nao for essencial

Reduced motion deve preservar clareza, nao eliminar feedback por completo.

## Faca e nao faca

Faca:
- animar mudancas de estado que ajudam orientacao
- manter motion curto e consistente
- conectar o movimento a uma origem logica
- mostrar sucesso e progresso no proprio lugar da acao
- testar mobile e desktop denso

Nao faca:
- intros de pagina em full-screen
- animacao continua de sombra, blur ou gradiente pesado
- usar motion para esconder loading lento
- animar todo elemento no primeiro render
- colocar bounce em fluxos operacionais de Backoffice
- criar transicoes de rota que parecam slideshow

## Checklist de entrega

- [ ] Motion usa `transform` e `opacity` por padrao
- [ ] A navegacao continua responsiva durante a transicao
- [ ] Reduced motion foi implementado
- [ ] Nenhuma intro longa bloqueia conteudo
- [ ] Views densas evitam animacao em cascata
- [ ] Motion foi ajustado por ator
- [ ] Bibliotecas pesadas foram justificadas ou lazy-loaded
- [ ] A interacao foi testada em mobile e desktop
- [ ] Motion nao cria layout shift nem jank visivel

## Padroes de implementacao

### Transicao base para elementos interativos
```css
transition:
  transform var(--duration-fast) var(--ease-default),
  opacity var(--duration-fast) var(--ease-default),
  background-color var(--duration-fast) var(--ease-default),
  border-color var(--duration-fast) var(--ease-default),
  box-shadow var(--duration-fast) var(--ease-default);
```

### Reveal de superficie
```css
transition:
  transform var(--duration-base) var(--ease-enter),
  opacity var(--duration-base) var(--ease-enter);
```

### Dismiss de superficie
```css
transition:
  transform var(--duration-exit) var(--ease-exit),
  opacity var(--duration-exit) var(--ease-exit);
```

### Fallback de reduced motion
```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

## Resumo

O motion da Decorafit deve parecer premium porque e claro, rapido e bem controlado.
O melhor resultado nao e o mais animado.
O melhor resultado e o que faz a navegacao parecer fluida, moderna e confiavel sem machucar performance.
