# Decorafit — Brand Design Document
> Fonte única de verdade para design e comunicação visual da plataforma

---

## 1. Identidade da Marca

### O que é a Decorafit
Plataforma completa de reforma de apartamentos urbanos. O cliente compra a reforma inteira — do design à execução, passando por marcenaria, compra de móveis e financiamento próprio — sem precisar gerenciar nada.

### Posicionamento
**"A reforma completa, do design ao financiamento, sem dor de cabeça."**

### Direção de design
A Decorafit é uma plataforma **contemporânea e minimalista**. O design deve comunicar competência e confiança — não através de abundância visual, mas através de **precisão, contenção e hierarquia clara**.

Referência de maturidade visual: Linear, Stripe, Notion, Quinto Andar.
O que eles têm em comum: quase monocromáticos na maior parte do tempo. Cor aparece apenas onde exige atenção.

---

## 2. Os Três Atores

### ATOR 1 — Cliente
**Princípio:** Reduzir ansiedade é mais importante do que mostrar funcionalidade.
- Densidade: **Baixa.** Poucos elementos. Espaço em branco generoso.
- Tom: Caloroso, aspiracional. "Sua reforma está indo muito bem."
- CTAs: **Máximo 1 por tela.**
- Plataforma: **Mobile-first + responsivo.** Layout em coluna única até 768px. Máximo 2 colunas em desktop.
- Cores por tela: máximo 2 (escuro + laranja).

**Telas prioritárias:**
1. Dashboard da obra — progresso, status atual, próxima etapa
2. Timeline — cronograma visual com fotos e etapas
3. Showroom / Loja — escolha de materiais, móveis, acabamentos
4. Financiamento — simulador, planos, aprovação
5. Área de aprovações
6. Onboarding
7. Perfil e documentos

---

### ATOR 2 — Executor
**Princípio:** Clareza operacional. O que preciso fazer agora?
- Densidade: **Média.**
- Tom: Direto. "3 tarefas pendentes."
- CTAs: **1–2 por tela.**
- Plataforma: **Mobile-first + responsivo.** Pensado para uso com uma mão, sol direto, canteiro de obras. Em desktop, layout de 2 colunas máximo.
- Cores por tela: máximo 2 (escuro + laranja). Status apenas por texto ou ponto, não badge cheio.

**Telas prioritárias:**
1. Home operacional — tarefas do dia
2. Ordem de serviço — detalhes, prazo
3. Registro de progresso — foto, checklist
4. Comunicação
5. Histórico

---

### ATOR 3 — Backoffice
**Princípio:** Eficiência máxima. O design serve à produtividade.
- Densidade: **Alta.** Tabelas densas são bem-vindas.
- Tom: Funcional. Termos internos aceitos.
- CTAs: Múltiplos quando necessário.
- Plataforma: **Mobile-first + responsivo.** Desktop é o uso primário (sidebar completa, tabelas), mas em mobile a sidebar colapsa para bottom nav ou drawer, e tabelas viram cards empilhados.
- Cores por tela: máximo 3. Status colors aparecem com parcimônia — apenas onde exige ação.

**Telas prioritárias:**
1. Dashboard gerencial
2. Gestão de projetos
3. CRM / Comercial
4. Gestão de executores
5. Financeiro
6. Relatórios
7. Configurações

---

## 3. Tabela Comparativa

| Dimensão | Cliente | Executor | Backoffice |
|---|---|---|---|
| Densidade | Baixa | Média | Alta |
| Tom | Caloroso | Direto | Funcional |
| Missão | Reduzir ansiedade | Clareza operacional | Eficiência |
| Mobile layout | 1 coluna | 1 coluna | Cards empilhados |
| Desktop layout | Máx. 2 colunas | Máx. 2 colunas | Sidebar + conteúdo |
| Cores simultâneas | 2 | 2 | 3 |
| Status colors | Raramente | Texto/ponto | Com parcimônia |
| Tabelas densas | Nunca | Raramente | Frequente |

---

## 4. Filosofia de Cor — A Regra mais Importante

### Economia cromática
**Cor é informação, não decoração.**

A maioria das telas deve ser quase monocromática: fundos brancos/off-white, textos em `#262D3B` e suas variações, bordas em `#E5E5E4`. O laranja `#FF6633` aparece em CTAs e destaques pontuais.

As cores de status (verde, vermelho, âmbar) são **reservadas para exceções** — não para colorir todas as linhas de uma tabela ao mesmo tempo.

### Regra prática para tabelas (Backoffice)
Em uma tabela com 10 linhas, **no máximo 2–3 linhas devem ter cor de status visível**. Se todas as linhas têm uma cor, nenhuma se destaca — o sistema falha.

Hierarquia de visibilidade de status:
1. **Bloqueado / Erro** → badge com fundo colorido (visibilidade máxima)
2. **Pendente / Atenção** → apenas texto colorido, sem fundo
3. **Em andamento** → texto na cor primária, sem fundo
4. **Concluído** → ícone de check verde, texto neutro
5. **Não iniciado** → texto cinza, sem cor

### Barras de progresso
Todas as barras usam o **mesmo design**: trilha `#E5E5E4`, fill `#FF6633`. Nunca mudar a cor do fill por status — a porcentagem e o badge de status já informam o estado.

---

## 5. Sistema de Cores

### Paleta principal
```
--color-primary:        #FF6633   /* ações, destaques, CTAs */
--color-dark:           #262D3B   /* textos, estrutura */
--color-neutral:        #B8B9B8   /* textos secundários, bordas */
```

### Paleta expandida
```
--color-bg:             #FFFFFF
--color-bg-subtle:      #F7F7F6   /* fundo de seções, inputs */
--color-bg-dark:        #1A2030   /* sidebar, nav dark */

--color-primary-hover:  #E5572B
--color-primary-subtle: #FFF0EB   /* hover ghost, badge bg leve */
--color-primary-text:   #CC4422   /* laranja em texto */

--color-dark-muted:     #3D4863   /* textos terciários */
--color-dark-subtle:    #6B7591   /* placeholders, labels desabilitados */

--color-border:         #E5E5E4
--color-border-dark:    #2E3649

--color-success:        #2D7D5A
--color-success-bg:     #EDFAF3
--color-warning:        #D97706
--color-warning-bg:     #FEF9EB
--color-error:          #DC2626
--color-error-bg:       #FEF2F2
--color-info:           #2563EB
--color-info-bg:        #EFF6FF
```

### Regras
- Laranja `#FF6633`: CTAs e destaques pontuais. Nunca como fundo de seção.
- Textos: `#262D3B`. Nunca `#000000`.
- Hierarquia: `#262D3B` → `#3D4863` → `#6B7591` → `#B8B9B8`
- Status colors: usar com parcimônia conforme hierarquia de visibilidade (seção 4)

---

## 6. Tipografia

### Família: Montserrat (Google Fonts)
```css
font-family: 'Montserrat', sans-serif;
```

### Escala
| Token | Tamanho | Peso | Line-height | Uso |
|---|---|---|---|---|
| display | clamp(40px, 5vw, 64px) | 700 | 1.1 | Hero, landing |
| h1 | clamp(28px, 4vw, 36px) | 700 | 1.2 | Títulos principais |
| h2 | clamp(22px, 3vw, 28px) | 600 | 1.25 | Subtítulos |
| h3 | clamp(18px, 2.5vw, 22px) | 600 | 1.3 | Card titles |
| h4 | 16px | 600 | 1.4 | Labels de grupo |
| body-lg | 16px | 400 | 1.6 | Corpo principal |
| body | 14px | 400 | 1.6 | Interface padrão |
| small | 12px | 400 | 1.5 | Legendas, meta |
| label | 11px | 600 | 1 | Labels uppercase |
| button | 14px | 600 | 1 | Botões (ls: 0.01em) |

### Regras
- Máximo 2 pesos por tela
- Labels de categoria: uppercase + `font-size: 11px` + `letter-spacing: 0.08em` + `color: #B8B9B8`
- Destaques inline: `font-weight: 700` + `color: #FF6633`. Nunca itálico.
- Títulos: usar clamp() para responsividade automática

---

## 7. Espaçamento, Grid e Responsividade

### Base 4px
```
--space-1: 4px    --space-2: 8px    --space-3: 12px
--space-4: 16px   --space-5: 20px   --space-6: 24px
--space-8: 32px   --space-10: 40px  --space-12: 48px
--space-16: 64px  --space-20: 80px
```

### Breakpoints
```
--bp-sm:  480px   /* mobile grande */
--bp-md:  768px   /* tablet / mobile landscape */
--bp-lg:  1024px  /* desktop pequeno */
--bp-xl:  1280px  /* desktop padrão */
--bp-2xl: 1536px  /* desktop grande */
```

### Mobile-first obrigatório
**Todo componente começa pelo mobile e expande.** Nunca o contrário.

```css
/* Padrão: mobile */
.component { padding: var(--space-4); }

/* Tablet */
@media (min-width: 768px) {
  .component { padding: var(--space-6); }
}

/* Desktop */
@media (min-width: 1024px) {
  .component { padding: var(--space-8); }
}
```

### Layouts responsivos por ator

**Cliente:**
- Mobile (<768px): 1 coluna, padding 16px
- Tablet (768px+): 1 coluna centralizada, max-width 600px
- Desktop (1024px+): 1 coluna centralizada, max-width 720px

**Executor:**
- Mobile (<768px): 1 coluna, padding 16px
- Tablet (768px+): 1 coluna, max-width 560px
- Desktop (1024px+): 2 colunas (lista + detalhe)

**Backoffice:**
- Mobile (<768px): sidebar colapsada como drawer, tabelas viram cards empilhados
- Tablet (768px–1024px): sidebar como bottom nav ou ícones apenas
- Desktop (1024px+): sidebar 240px + conteúdo fluido

### Container
```css
.container {
  width: 100%;
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 var(--space-4);         /* mobile */
}
@media (min-width: 768px) {
  .container { padding: 0 var(--space-6); }
}
@media (min-width: 1024px) {
  .container { padding: 0 var(--space-8); }
}
```

---

## 8. Border Radius
```
--radius-sm:   4px    /* inputs, badges */
--radius-md:   8px    /* botões, chips */
--radius-lg:   12px   /* cards */
--radius-xl:   16px   /* modais, painéis */
--radius-full: 9999px /* pills, avatars */
```

---

## 9. Componentes

### Botões
**Primário:** bg `#FF6633` → hover `#E5572B` | texto branco | `12px 24px` | radius `8px` | shadow-orange no hover
**Secundário:** border `1.5px #262D3B` | hover: bg `#262D3B` texto branco
**Ghost:** sem border | texto `#FF6633` | hover: bg `#FFF0EB`

Nunca mais de 1 primário por seção. Em mobile, botões de ação principal são full-width.

### Cards
```
background: #FFFFFF
border: 1px solid #E5E5E4
border-radius: 12px
padding: 20px        /* mobile */
padding: 24px        /* desktop */
box-shadow: var(--shadow-sm)
hover: box-shadow: var(--shadow-md)
```

### Inputs
```
height: 48px         /* mobile — área de toque mínima */
height: 44px         /* desktop */
border: 1.5px solid #E5E5E4
border-radius: 4px
background: #F7F7F6
font-size: 16px      /* mobile — evita zoom no iOS */
font-size: 14px      /* desktop */
focus: border #FF6633 + ring rgba(255,102,51,0.15)
```

### Status — hierarquia de visibilidade

**Bloqueado** (máxima visibilidade — badge cheio):
```
color: #DC2626 | background: #FEF2F2 | border-radius: 4px | padding: 2px 8px
```

**Aprovação pendente / Atenção** (warning — apenas texto):
```
color: #D97706 (âmbar) | no background
```
⚠️ Nunca usar #FF6633 para estados de atenção — laranja primário é cor da marca, não de warning.

**Em andamento** (ativo — texto primário):
```
color: #FF6633 (laranja primário) | no background
```

**Concluído** (positivo — ícone + texto neutro):
```
ícone check #2D7D5A | texto: #3D4863
```

**Não iniciado** (neutro):
```
color: #B8B9B8 | no background
```

### Barras de progresso
```
trilha: #E5E5E4, height: 4px, border-radius: 9999px
fill: #FF6633 (sempre — independente do status)
```
Nunca mudar a cor do fill. O badge de status já informa o estado.

### Navegação por ator

**Cliente (mobile):** bottom nav, 4 itens, ícone + label, ativo em laranja
**Cliente (desktop):** topbar simples, max-width 720px centralizado

**Executor (mobile):** bottom nav, 3–4 itens, ícone + label, ativo em laranja
**Executor (desktop):** sidebar reduzida (ícones) ou topbar

**Backoffice (mobile):** sidebar como drawer deslizante, ou bottom nav com ícones
**Backoffice (tablet):** sidebar colapsada — apenas ícones, 64px de largura
**Backoffice (desktop):** sidebar expandida 240px, fundo `#262D3B`, item ativo: `border-left: 3px solid #FF6633` + bg `rgba(255,102,51,0.08)`

---

## 10. Elevação e Sombras
```
--shadow-xs:     0 1px 2px rgba(0,0,0,0.04)
--shadow-sm:     0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)
--shadow-md:     0 4px 8px rgba(0,0,0,0.08), 0 2px 4px rgba(0,0,0,0.04)
--shadow-lg:     0 10px 24px rgba(0,0,0,0.10), 0 4px 8px rgba(0,0,0,0.06)
--shadow-xl:     0 20px 40px rgba(0,0,0,0.12)
--shadow-orange: 0 4px 12px rgba(255,102,51,0.30)
```

Sistema único de elevação: **borda + sombra suave**. Nunca misturar borda, sombra e fundo colorido no mesmo card.

---

## 11. Iconografia
- Biblioteca: **Lucide React** — stroke, strokeWidth 1.5, nunca fill
- Tamanhos: 16px inline / 20px padrão / 24px destaque
- Touch targets em mobile: mínimo 44×44px (padding ao redor do ícone)
- Cor: `#262D3B` padrão | `#FFFFFF` 70% em sidebar | `#FF6633` ativo

---

## 12. Assets da Marca

### Estrutura de logos
```
assets/
├── logo/
│   ├── logo-full-dark-bg.png      /* logo completa (ícone + texto) para fundos escuros */
│   ├── logo-full-light-bg.png     /* logo completa para fundos claros */
│   ├── logo-icon-only.png         /* apenas o ícone D — para favicons, avatars */
│   ├── logo-text-only-dark.png    /* apenas "DECORAFIT" para fundos escuros */
│   └── logo-text-only-light.png   /* apenas "DECORAFIT" para fundos claros */
└── [outros assets futuros]
```

### Quando usar cada logo
| Contexto | Arquivo |
|---|---|
| Sidebar do backoffice (fundo escuro) | `logo-full-dark-bg.png` |
| Header do cliente / executor (fundo branco) | `logo-full-light-bg.png` |
| Favicon, app icon | `logo-icon-only.png` |
| Loading screen, splash | `logo-full-dark-bg.png` |
| Email, documentos | `logo-full-light-bg.png` |

---

## 13. Microcopy
- Estado vazio: "Ainda não há nada aqui" — nunca "Nenhum resultado encontrado"
- Erros: sem código técnico, nunca culpar o usuário
- Loading: "Carregando…" com contexto — nunca spinner sem texto
- Sucesso: "Salvo", "Enviado", "Concluído"

---

## 14. Referências
| Marca | Ator | O que aprender |
|---|---|---|
| Block Renovation | Cliente | Timeline visual de obra |
| Quinto Andar | Cliente | Experiência imobiliária brasileira |
| Nubank | Cliente + Exec. | Microcopy humano, redução de ansiedade |
| Linear | Backoffice | Densidade elegante, status com parcimônia |
| Stripe | Backoffice | Hierarquia forte, cor como exceção |
| Notion | Exec. + BO | Clareza operacional |

> **Fio condutor:** Quase monocromático na maior parte do tempo. Cor aparece apenas onde exige atenção. Hierarquia tipográfica clara. Espaço em branco como elemento de design.

---

## 15. Anti-patterns

**Todos os atores:**
- Mais de 3 status coloridos visíveis simultaneamente na mesma tela
- Barras de progresso com cores diferentes por status
- Inter, Arial, Roboto, system-ui — sempre Montserrat
- Ícones fill misturados com stroke
- Gradientes genéricos
- Layout fixo não-responsivo

**Cliente:**
- Mais de 1 CTA por tela
- Tabelas densas
- Linguagem técnica de obra

**Executor:**
- Mais de 2 toques para completar uma tarefa
- Onboarding longo forçado

**Backoffice:**
- Esconder informação em prol de limpeza
- Tom infantilizado

---

## 16. CSS Tokens Completos

```css
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

:root {
  /* Colors */
  --color-primary:        #FF6633;
  --color-primary-hover:  #E5572B;
  --color-primary-subtle: #FFF0EB;
  --color-primary-text:   #CC4422;
  --color-dark:           #262D3B;
  --color-dark-muted:     #3D4863;
  --color-dark-subtle:    #6B7591;
  --color-neutral:        #B8B9B8;
  --color-bg:             #FFFFFF;
  --color-bg-subtle:      #F7F7F6;
  --color-bg-dark:        #1A2030;
  --color-border:         #E5E5E4;
  --color-border-dark:    #2E3649;
  --color-success:        #2D7D5A;
  --color-success-bg:     #EDFAF3;
  --color-warning:        #D97706;
  --color-warning-bg:     #FEF9EB;
  --color-error:          #DC2626;
  --color-error-bg:       #FEF2F2;
  --color-info:           #2563EB;
  --color-info-bg:        #EFF6FF;

  /* Typography */
  --font-family: 'Montserrat', sans-serif;

  /* Spacing */
  --space-1: 4px;   --space-2: 8px;   --space-3: 12px;
  --space-4: 16px;  --space-5: 20px;  --space-6: 24px;
  --space-8: 32px;  --space-10: 40px; --space-12: 48px;
  --space-16: 64px; --space-20: 80px;

  /* Breakpoints (use em media queries) */
  /* sm: 480px | md: 768px | lg: 1024px | xl: 1280px */

  /* Border Radius */
  --radius-sm:   4px;
  --radius-md:   8px;
  --radius-lg:   12px;
  --radius-xl:   16px;
  --radius-full: 9999px;

  /* Shadows */
  --shadow-xs:     0 1px 2px rgba(0,0,0,0.04);
  --shadow-sm:     0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
  --shadow-md:     0 4px 8px rgba(0,0,0,0.08), 0 2px 4px rgba(0,0,0,0.04);
  --shadow-lg:     0 10px 24px rgba(0,0,0,0.10), 0 4px 8px rgba(0,0,0,0.06);
  --shadow-xl:     0 20px 40px rgba(0,0,0,0.12);
  --shadow-orange: 0 4px 12px rgba(255,102,51,0.30);
}
```

---

## 17. Acessibilidade — WCAG AA

### Contraste obrigatório

| Combinação | Contraste | Status |
|---|---|---|
| `#262D3B` sobre `#FFFFFF` | 13.5:1 | ✅ AAA |
| `#3D4863` sobre `#FFFFFF` | 7.2:1 | ✅ AAA |
| `#6B7591` sobre `#FFFFFF` | 4.6:1 | ✅ AA |
| `#CC4422` sobre `#FFFFFF` | 4.5:1 | ✅ AA (texto laranja) |
| `#FF6633` sobre `#FFFFFF` | 2.9:1 | ❌ Falha — não usar como texto pequeno |
| `#D97706` sobre `#FFFFFF` | 3.2:1 | ⚠️ Só para texto 18px+ |
| `#B8B9B8` sobre `#FFFFFF` | 1.9:1 | ❌ Nunca como texto |
| Branco sobre `#262D3B` | 13.5:1 | ✅ AAA |
| Branco sobre `#FF6633` | 2.9:1 | ⚠️ Só para texto 18px+ (botões aceitável como non-text UI) |

### Regras práticas
- Texto "Em andamento" e outros status em laranja → usar `#CC4422`, nunca `#FF6633`
- `#FF6633` → fundos, barras de progresso, bordas, ícones (non-text). Nunca texto pequeno.
- Touch targets mobile: mínimo 44×44px (WCAG 2.5.8)
- Focus visible: `outline: 2px solid #FF6633; outline-offset: 2px`
- Não usar cor como único indicador — sempre combinar com ícone ou texto

---

## 18. Tokens Semânticos

```css
--color-action:          var(--color-primary);
--color-action-text:     var(--color-primary-text);  /* #CC4422 — texto laranja acessível */
--color-surface:         var(--color-bg);
--color-surface-raised:  var(--color-bg-subtle);
--color-border-default:  var(--color-border);
--color-text-primary:    var(--color-dark);
--color-text-secondary:  var(--color-dark-muted);
--color-text-tertiary:   var(--color-dark-subtle);
--color-text-disabled:   var(--color-neutral);
```

---

## 19. Motion

```css
--duration-fast:  100ms;
--duration-base:  200ms;
--duration-slow:  300ms;
--duration-exit:  150ms;
--ease-default:   cubic-bezier(0.4, 0, 0.2, 1);
--ease-enter:     cubic-bezier(0, 0, 0.2, 1);
--ease-exit:      cubic-bezier(0.4, 0, 1, 1);
```

Saídas sempre mais rápidas que entradas. Respeitar `prefers-reduced-motion`.

---

## 20. Os 5 Estados de UI

Todo componente que exibe dados deve ter os 5 estados definidos antes de ir para produção.

1. **Loading** — skeleton screens com shimmer. Nunca spinner isolado.
2. **Empty** — ícone + mensagem clara + 1 ação contextual
3. **Error** — mensagem humana + caminho de recuperação. Nunca código técnico.
4. **Partial** — mostrar o que existe com indicação do que falta ("—" com tooltip)
5. **Ideal** — o estado padrão de design com todos os dados

---

## 21. Legibilidade

- Parágrafos: `max-width: 65ch`
- Descrições em cards: `max-width: 55ch`
- Nunca permitir linha de texto que atravesse tela inteira em desktop
