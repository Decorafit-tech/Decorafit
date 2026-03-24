---
name: decorafit-design
description: Sistema de decisao de produto, UI e UX da Decorafit. Use sempre que for criar, revisar ou implementar telas, fluxos, componentes, dashboards ou qualquer interface da Decorafit. A plataforma tem tres atores com experiencias distintas - Cliente, Executor e Backoffice. Sempre trabalhar mobile-first, responsivo e orientado ao ator.
---

# Decorafit Design System

## Objetivo

Esta skill existe para orientar decisao de produto, UI e UX da Decorafit sem inflar o contexto.
O `SKILL.md` deve ficar focado em workflow, selecao de referencias e regras nucleares.
O detalhe vive em `references/`.

## Mapa de arquivos

Leia apenas o que for relevante para a tarefa:

- `references/actors.md`
  Use quando precisar decidir densidade, tom, CTA, navegacao, layout ou prioridades por ator.

- `references/components.md`
  Use quando precisar escolher, reutilizar, estender ou criar componentes, definir estados e revisar consistencia do sistema.

- `references/patterns.md`
  Use quando a tarefa envolver fluxos ou modulos de negocio como timeline, aprovacoes, showroom, financiamento, operacao ou backoffice gerencial.

- `references/brand.md`
  Use para tokens visuais, cor, tipografia, espacamento, layout base, iconografia, assets e acessibilidade visual.

- `references/motion.md`
  Use quando a tarefa envolver motion, transicoes, microinteracoes, perceived performance ou reduced motion.

## Prioridade em caso de conflito

1. Este `SKILL.md`
2. A referencia mais relevante para a tarefa
3. `references/brand.md` e `references/motion.md` como fundamentos
4. Preferencias esteticas do pedido

## Workflow obrigatorio

### 1. Descobrir contexto
Antes de desenhar, revisar ou codar, esclareca:
1. ator
2. job to be done
3. momento da jornada
4. risco e urgencia
5. contexto de uso
6. CTA principal
7. densidade de dados
8. conteudo critico

Se o pedido estiver incompleto e houver risco real de errar a UX, pergunte no maximo 3 perguntas curtas.
Prioridade das perguntas:
1. "Esta tela e para Cliente, Executor ou Backoffice?"
2. "Qual e a tarefa principal que a pessoa precisa concluir nesta tela?"
3. "Essa experiencia sera usada mais em mobile de campo ou desktop de escritorio?"

Se der para inferir com seguranca, assuma e declare a suposicao depois.

### 2. Selecionar referencias
Nao leia tudo por padrao.
Leia apenas as referencias que mudam a decisao:
- ator ou tom -> `references/actors.md`
- componente, estados ou reutilizacao -> `references/components.md`
- fluxo de negocio -> `references/patterns.md`
- tokens visuais -> `references/brand.md`
- motion ou performance -> `references/motion.md`

### 3. Definir estrategia da experiencia
Toda proposta precisa responder:
- o que esta acontecendo
- o que muda agora
- o que a pessoa faz em seguida

Se a tela nao responde isso em poucos segundos, a UX ainda nao esta pronta.

### 4. Definir estrategia de componentes
Sempre seguir esta ordem:
1. reutilizar componente existente
2. estender variante, estado, tamanho ou composicao
3. criar componente novo apenas se houver nova responsabilidade semantica ou novo padrao recorrente

Para criterios e checklist, ler `references/components.md`.

### 5. Fechar qualidade da entrega
Toda tela ou componente deve prever:
- responsividade
- acessibilidade
- estados de loading, empty, error, partial e ideal
- motion, quando relevante
- copy adequada ao ator

## Regras nucleares

1. Ator antes de estetica.
2. Mobile-first sempre.
3. Cor e sinal, nao enfeite.
4. Uma prioridade visual por viewport.
5. Reutilizar antes de criar.
6. Nenhuma tela esta pronta sem estados.
7. Nao depender so de cor para comunicar estado.
8. Tokens semanticos antes de valores arbitrarios.
9. Motion deve ser funcional, rapido e leve.
10. Limite largura de texto, nao largura da pagina.
11. A interface deve parecer Decorafit, nao template generico de SaaS.

## Contrato de saida obrigatorio

Toda resposta ou implementacao desta skill deve deixar claro:
- ator e contexto de uso
- objetivo da tela
- CTA principal e acoes secundarias
- hierarquia de informacao
- componentes principais e decisao de reutilizacao
- comportamento mobile, tablet e desktop
- estados de loading, empty, error, partial e ideal
- decisoes de acessibilidade
- motion, quando for parte relevante da experiencia
- microcopy chave
- tradeoffs e suposicoes, quando existirem

## Como revisar telas existentes

Ao revisar uma tela, responder nesta ordem:
1. riscos de UX e de negocio
2. problemas de hierarquia visual e interacao
3. problemas de reutilizacao ou duplicacao de componente
4. problemas de acessibilidade, responsividade e motion
5. oportunidades de deixar a experiencia mais propria da Decorafit

## Como implementar

Ao gerar codigo:
- inspecionar primeiro os componentes existentes do projeto
- ler `references/components.md` se houver duvida entre reutilizar, estender ou criar
- comecar pelo mobile
- usar tokens semanticos
- evitar valores hardcoded quando houver token
- evitar `max-width` fixo em containers de pagina; preferir layout fluido com padding responsivo
- explicitar estados e variantes relevantes
- manter componentes reutilizaveis
- consultar `references/motion.md` quando houver transicao ou microinteracao relevante
- documentar rapidamente as suposicoes quando a tela for complexa

## Anti-patterns globais

- criar tela bonita sem proxima acao clara
- replicar o mesmo layout para os 3 atores
- criar componente novo por variacao visual pequena
- usar motion para mascarar lentidao
- desenhar desktop e reduzir depois
- centralizar a aplicacao inteira em uma coluna estreita em monitores grandes
- esconder informacao critica no Backoffice por excesso de limpeza
- encher o Executor de passos desnecessarios
- criar fluxo de aprovacao sem custo, prazo ou contexto
- tratar fotos da obra como decoracao em vez de evidencia

## Referencias

- `references/actors.md` - ator, tom, navegacao, layout e prioridades
- `references/components.md` - biblioteca de componentes, governanca de reutilizacao e estados
- `references/patterns.md` - fluxos e modulos de negocio da Decorafit
- `references/brand.md` - base visual, tokens, acessibilidade e assets
- `references/motion.md` - motion behavior, performance e padroes de transicao
- `assets/logo/` - logos oficiais
