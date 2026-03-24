---
name: decorafit-design-system
description: Design system da plataforma Decorafit. Use sempre que for criar, modificar ou revisar qualquer tela, componente, página ou interface visual da Decorafit. A plataforma tem três atores com experiências distintas - Cliente (baixa densidade, mobile-first, máx 1 CTA, reduz ansiedade), Executor (densidade média, task-oriented, mobile-first) e Backoffice (alta densidade, desktop-first com responsividade, eficiência máxima). Use quando mencionar tela, componente, página, interface, design, frontend, layout, dashboard, ou qualquer ator da plataforma. SEMPRE mobile-first e responsivo.
---

# Decorafit Design System

## Primeira pergunta obrigatória

Antes de criar qualquer interface, identifique o ator.
Se não estiver explícito, pergunte: **"Esta tela é para Cliente, Executor ou Backoffice?"**

## Direção de design

A Decorafit é **contemporânea e minimalista**. Quase monocromática na maior parte do tempo.
Cor aparece apenas onde exige atenção — não como decoração.
Referências: Linear, Stripe, Nubank, Quinto Andar.

## Mobile-first obrigatório

**Todo componente começa pelo mobile e expande.** Nunca o contrário.
Escreva o CSS base para 320px. Adicione `min-width` para expandir. Nunca use `max-width` para reduzir.

```css
/* CORRETO — mobile-first */
.layout { display: flex; flex-direction: column; }
@media (min-width: 768px)  { .layout { flex-direction: row; } }
@media (min-width: 1024px) { .layout { gap: 32px; } }

/* ERRADO — desktop-first */
.layout { display: flex; flex-direction: row; }
@media (max-width: 768px)  { .layout { flex-direction: column; } }
```

Breakpoints:
- `@media (min-width: 480px)` — mobile grande
- `@media (min-width: 768px)` — tablet
- `@media (min-width: 1024px)` — desktop
- `@media (min-width: 1280px)` — desktop grande
- `@media (min-width: 1440px)` — desktop XL
- `@media (min-width: 1920px)` — 2K / monitores wide

## Layouts em telas grandes (1440px+)

**Nunca deixe espaço em branco lateral.** A tela deve ser ocupada — não centralizada numa coluna estreita com margem vazia ao redor.

Estratégia por ator:
- **Cliente:** padding lateral aumenta com `clamp()`, conteúdo expande proporcionalmente. Em 1440px+, pode usar 2 colunas simétricas para aproveitar o espaço sem aumentar densidade.
- **Executor:** grid de 2–3 colunas expande com `auto-fill`/`minmax()` para preencher a área.
- **Backoffice:** sidebar 240px + área de conteúdo fluida que ocupa o restante — sem cap de largura.

```css
/* CORRETO — fluido, aproveita a tela toda */
.page-container {
  padding: clamp(16px, 4vw, 80px);
  width: 100%;
}

/* Para textos corridos: limite de linha por legibilidade, não de container */
.body-text { max-width: 65ch; }

/* Grid de cards que preenche o espaço automaticamente */
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
}

/* ERRADO — cria espaço em branco em monitores grandes */
.page-container { max-width: 1200px; margin: 0 auto; }
```

**Regra:** `max-width` em containers de página é anti-pattern. Use `clamp()` no padding e `minmax()` em grids para que a tela seja sempre aproveitada.

## Checklist obrigatório antes de entregar qualquer tela

Antes de considerar uma tela pronta, verificar todos os pontos:

**Responsividade:**
- [ ] Funciona em 320px sem scroll horizontal
- [ ] Funciona em 768px (tablet)
- [ ] Funciona em 1280px (desktop padrão)
- [ ] Nenhum elemento com largura fixa em px que quebre em mobile
- [ ] Imagens e containers usam `width: 100%` ou larguras proporcionais — sem `max-width` fixo em px que crie espaço em branco em monitores grandes
- [ ] Em 1440px+: colunas extras ou espaçamento generoso aproveitam o espaço disponível
- [ ] Textos usam `clamp()` ou tamanhos relativos para títulos

**Navegação:**
- [ ] Em mobile: bottom nav ou menu hamburger — nunca sidebar fixa
- [ ] Em desktop Backoffice: sidebar 240px com colapso em tablet
- [ ] Touch targets mínimo 44×44px em todos os elementos clicáveis

**Tipografia e cor:**
- [ ] Fonte é Montserrat — nenhuma outra
- [ ] Máximo de cores simultâneas respeitado (2 para Cliente/Executor, 3 para Backoffice)
- [ ] "Aprovação pendente" / estados de atenção usam `#D97706` (âmbar), não `#FF6633` (laranja primário)
- [ ] Status "Em andamento" usa `#FF6633` apenas como texto, sem fundo colorido
- [ ] Barras de progresso: fill sempre `#FF6633`, independente do status

**Espaço e layout:**
- [ ] Padding mobile: mínimo 16px nas laterais
- [ ] Padding desktop: mínimo 24–32px
- [ ] Nenhum valor de espaçamento arbitrário (13px, 17px, 23px)
- [ ] Desktop não deixa colunas inteiras vazias — usa o espaço disponível

## Os três atores

| Ator | Princípio | Densid. | Layout mobile | Layout desktop | CTAs |
|---|---|---|---|---|---|
| **Cliente** | Reduzir ansiedade | Baixa | 1 coluna | 1–2 col. fluidas, padding generoso | Máx. 1 |
| **Executor** | Clareza operacional | Média | 1 coluna | 2 colunas | 1–2 |
| **Backoffice** | Eficiência máxima | Alta | Cards empilhados | Sidebar + conteúdo | Múltiplos |

Detalhes completos: `references/brand.md` — Seção 2

## Regra de cor mais importante

**Status colors são informação, não decoração.**

Em uma tabela com 10 linhas, no máximo 2–3 devem ter cor de status visível.

Hierarquia de visibilidade:
1. **Bloqueado/Erro** → badge com fundo colorido `bg: #FEF2F2, color: #DC2626`
2. **Aprovação pendente / Atenção** → apenas texto `color: #D97706` (âmbar) sem fundo — nunca laranja primário
3. **Em andamento** → texto `color: #FF6633` (laranja primário) sem fundo — exclusivo para estado ativo
4. **Concluído** → ícone check verde + texto neutro `#3D4863`
5. **Não iniciado** → texto cinza `#B8B9B8`

## Barras de progresso

Trilha `#E5E5E4` + fill **sempre `#FF6633`** — independente do status.
Nunca mudar a cor do fill. O badge já informa o estado.

## Tokens obrigatórios

```css
--color-primary:        #FF6633;
--color-primary-hover:  #E5572B;
--color-primary-subtle: #FFF0EB;
--color-dark:           #262D3B;
--color-dark-muted:     #3D4863;
--color-dark-subtle:    #6B7591;
--color-neutral:        #B8B9B8;
--color-bg:             #FFFFFF;
--color-bg-subtle:      #F7F7F6;
--color-bg-dark:        #1A2030;
--color-border:         #E5E5E4;
--color-success:        #2D7D5A;
--color-warning:        #D97706;
--color-error:          #DC2626;
--font-family:          'Montserrat', sans-serif;
```

## Regras invioláveis

1. **Fonte:** Montserrat. Nunca Inter, Arial, Roboto, system-ui.
2. **Cor:** máx. 3 simultâneas por tela. Máx. 2 para Cliente e Executor.
3. **Status simultâneos coloridos:** máx. 2–3 por tela inteira.
4. **Ícones:** Lucide, stroke, strokeWidth 1.5, nunca fill. Touch target mínimo 44×44px em mobile.
5. **Espaçamento:** sistema de 4px. Nunca valores arbitrários.
6. **Botão primário:** 1 por seção. Full-width em mobile.
7. **Inputs mobile:** height 48px, font-size 16px (evita zoom iOS).
8. **Textos:** sempre `#262D3B`. Nunca `#000000`.

## Componentes

**Botão primário:** bg `#FF6633` hover `#E5572B` | branco | `12px 24px` | radius `8px`
**Botão secundário:** border `1.5px #262D3B` | hover bg `#262D3B`
**Ghost:** sem border | texto `#FF6633` | hover bg `#FFF0EB`
**Card:** branco | border `#E5E5E4` | radius `12px` | padding `20px` mobile / `24px` desktop
**Input:** height `48px` mobile / `44px` desktop | border `1.5px #E5E5E4` | bg `#F7F7F6`

## Navegação responsiva

**Cliente:** bottom nav mobile (4 itens) → topbar desktop, 1 coluna fluida com padding lateral generoso (`clamp(24px, 5vw, 80px)`)
**Executor:** bottom nav mobile (3–4 itens) → sidebar reduzida ou topbar desktop
**Backoffice mobile:** drawer deslizante ou bottom nav com ícones
**Backoffice tablet:** sidebar colapsada 64px (apenas ícones)
**Backoffice desktop:** sidebar 240px `#262D3B`, ativo: `border-left: 3px solid #FF6633`

## Assets disponíveis

Logo oficial: `assets/logo/`
- `logo-full-dark-bg.png` — sidebar, splash (fundo escuro)
- `logo-full-light-bg.png` — header, topbar (fundo claro)
- `logo-icon-only.png` — favicon, avatar, sidebar colapsada

## Anti-patterns — nunca fazer

- Mais de 3 status coloridos visíveis simultaneamente
- Barras de progresso com cores diferentes por status
- Inter/Arial/Roboto
- Ícones fill
- Gradientes genéricos
- Layout fixo sem responsividade
- Cor como decoração, não como informação
- `max-width` fixo em px em containers de página — cria espaço em branco em monitores grandes

---

## Acessibilidade de cor — WCAG AA obrigatório

**Regra crítica:** `#FF6633` sobre branco tem contraste 2.9:1 — reprova WCAG AA para texto normal.

| Uso | Cor correta | Contraste | Resultado |
|---|---|---|---|
| Texto laranja sobre branco | `#CC4422` | 4.5:1 | ✅ AA |
| Texto sobre fundo laranja | `#FFFFFF` apenas para 18px+ | 2.9:1 | ⚠️ só large text |
| Botão primário (texto branco) | Aceitável — botão é UI component | 2.9:1 | ✅ non-text (3:1) |
| "Em andamento" em tabela | `#CC4422`, não `#FF6633` | 4.5:1 | ✅ AA |
| Âmbar `#D97706` sobre branco | Só para 18px+ ou bold 14px+ | 3.2:1 | ⚠️ só large text |

**Resumo prático:**
- `#FF6633` → backgrounds, barras de progresso, bordas, ícones, CTAs. Nunca texto pequeno.
- `#CC4422` → qualquer texto de cor laranja em fundo branco/claro.
- `#D97706` → só em textos grandes (18px+) ou usar `#B45309` para texto pequeno.
- Texto corpo: sempre `#262D3B` mínimo. Nunca `#B8B9B8` como texto.

**Focus states (acessibilidade teclado):**
```css
:focus-visible {
  outline: 2px solid #FF6633;
  outline-offset: 2px;
  border-radius: var(--radius-sm);
}
```

---

## Tokens semânticos

Use tokens semânticos no código — não valores primitivos diretos.

```css
/* Semânticos — comunicam INTENÇÃO */
--color-action:           var(--color-primary);        /* botões, CTAs */
--color-action-text:      var(--color-primary-text);   /* texto laranja acessível */
--color-surface:          var(--color-bg);             /* fundo de página */
--color-surface-raised:   var(--color-bg-subtle);      /* fundo de cards */
--color-border-default:   var(--color-border);
--color-text-primary:     var(--color-dark);
--color-text-secondary:   var(--color-dark-muted);
--color-text-tertiary:    var(--color-dark-subtle);
--color-text-disabled:    var(--color-neutral);
```

---

## Motion tokens

```css
--duration-fast:   100ms;   /* hover, focus rings */
--duration-base:   200ms;   /* transições padrão */
--duration-slow:   300ms;   /* modais, drawers, expansões */
--duration-exit:   150ms;   /* saídas SEMPRE mais rápidas que entradas */

--ease-default:  cubic-bezier(0.4, 0, 0.2, 1);
--ease-enter:    cubic-bezier(0, 0, 0.2, 1);
--ease-exit:     cubic-bezier(0.4, 0, 1, 1);

/* Padrão para a maioria dos elementos */
transition: all var(--duration-base) var(--ease-default);
```

**Regra:** Respeitar `prefers-reduced-motion`. Todo componente com animação deve ter:
```css
@media (prefers-reduced-motion: reduce) {
  * { transition-duration: 0.01ms !important; animation-duration: 0.01ms !important; }
}
```

---

## Os 5 estados de UI — todos obrigatórios

Todo componente que exibe dados deve ter os 5 estados projetados.

### Estado: Loading
Usar **skeleton screens**, nunca spinner sozinho.
```
- Retângulos animados com shimmer (fundo #E5E5E4 → #F7F7F6)
- Mesma estrutura do conteúdo real (mesmo número de linhas, proporções)
- Nunca mostrar spinner sem texto de contexto
```

### Estado: Empty
Fórmula: ícone neutro + mensagem clara + 1 ação.
```
Cliente:   "Nenhuma foto registrada ainda — sua equipe atualizará em breve"
Executor:  "Nenhuma tarefa para hoje"  [+ botão "Ver próximos dias"]
Backoffice: "Nenhum projeto ativo"     [+ botão "Nova obra"]
```
Nunca: "Nenhum resultado encontrado" sem contexto ou ação.

### Estado: Error
Mensagem humana + caminho de recuperação. Nunca código técnico.
```
✅ "Não conseguimos carregar seus projetos. Tente novamente."  [Tentar novamente]
❌ "Error 500: Internal Server Error"
```

### Estado: Partial
Conteúdo carregado parcialmente — mostrar o que existe com indicação clara.
```
- KPI card sem dados: mostrar "—" com tooltip explicativo
- Tabela com coluna vazia: "Aguardando..." em texto cinza, nunca campo em branco
```

### Estado: Ideal
O estado projetado com todos os dados. Referência de design.

---

## Legibilidade de texto

**Comprimento de linha máximo:** `max-width: 65ch` para qualquer parágrafo ou texto corrido.
Linhas muito longas aumentam carga cognitiva — especialmente no Cliente.

```css
.body-text { max-width: 65ch; }
.card-description { max-width: 55ch; }
```

**Line-height:**
- Títulos: 1.2
- Corpo: 1.6
- Labels/capslock: 1.0

---

## Micro-interações mínimas obrigatórias

Cada elemento interativo precisa de feedback visual imediato.

**Botões:**
```css
button { transition: background var(--duration-fast) var(--ease-default),
                     box-shadow var(--duration-fast) var(--ease-default),
                     transform var(--duration-fast) var(--ease-default); }
button:hover  { /* cor hover + shadow-orange */ }
button:active { transform: scale(0.98); }
```

**Links e items de nav:**
```css
transition: color var(--duration-fast), background var(--duration-fast);
```

**Cards clicáveis:**
```css
transition: box-shadow var(--duration-base) var(--ease-default);
:hover { box-shadow: var(--shadow-md); }
```

**Inputs:**
```css
transition: border-color var(--duration-fast), box-shadow var(--duration-fast);
:focus { border-color: #FF6633; box-shadow: 0 0 0 3px rgba(255,102,51,0.15); }
```

**Feedback de ação** (salvar, enviar, concluir):
Mostrar estado de sucesso por 2 segundos antes de voltar ao estado normal.
```
Botão "Salvar" → loading (spinner inline) → "Salvo ✓" (2s) → volta ao normal
```
