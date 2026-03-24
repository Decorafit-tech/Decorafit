# Decorafit Brand Foundations

Use este arquivo para fundamentos visuais.
Nao use este arquivo para escolher ator, fluxo de negocio, governanca de componentes ou motion detalhado.

Para isso, consultar:
- `actors.md`
- `components.md`
- `patterns.md`
- `motion.md`

## Sumario

- Identidade e direcao visual
- Filosofia de cor
- Tokens de cor
- Tokens semanticos
- Tipografia
- Espacamento e breakpoints
- Layouts em telas grandes
- Container e layout base
- Radius, sombras e iconografia
- Assets
- Acessibilidade visual
- CSS tokens base

## 1. Identidade e direcao visual

### O que e a Decorafit
Plataforma completa de reforma de apartamentos urbanos.
O cliente compra a reforma inteira - do design a execucao, passando por marcenaria, compra de moveis e financiamento proprio - sem precisar gerenciar tudo sozinho.

### Posicionamento
"A reforma completa, do design ao financiamento, sem dor de cabeca."

### Direcao visual
A Decorafit e contemporanea e minimalista.
O design deve comunicar competencia e confianca por precisao, contencao e hierarquia clara.

Referencias de maturidade visual:
- Linear
- Stripe
- Notion
- Quinto Andar

Fio condutor:
- quase monocromatico na maior parte do tempo
- cor aparece quando existe acao, risco ou progresso
- espaco em branco e parte da hierarquia

## 2. Filosofia de cor

Cor e informacao, nao decoracao.

Regras:
- a maioria das telas deve ser quase monocromatica
- o laranja principal aparece em CTAs e destaques pontuais
- cores de status devem ser usadas com parcimonia
- em tabelas, poucas linhas devem carregar destaque visivel
- barras de progresso mantem um desenho consistente

Hierarquia de visibilidade de status:
1. bloqueado ou erro
2. pendente ou atencao
3. em andamento
4. concluido
5. nao iniciado

## 3. Tokens de cor

```css
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
```

## 4. Tokens semanticos

Use tokens semanticos no codigo sempre que possivel.

```css
--color-action:          var(--color-primary);
--color-action-text:     var(--color-primary-text);
--color-surface:         var(--color-bg);
--color-surface-raised:  var(--color-bg-subtle);
--color-border-default:  var(--color-border);
--color-text-primary:    var(--color-dark);
--color-text-secondary:  var(--color-dark-muted);
--color-text-tertiary:   var(--color-dark-subtle);
--color-text-disabled:   var(--color-neutral);
```

## 5. Tipografia

### Familia
```css
font-family: 'Montserrat', sans-serif;
```

### Escala
| Token | Tamanho | Peso | Line-height | Uso |
|---|---|---|---|---|
| display | clamp(40px, 5vw, 64px) | 700 | 1.1 | hero, landing |
| h1 | clamp(28px, 4vw, 36px) | 700 | 1.2 | titulos principais |
| h2 | clamp(22px, 3vw, 28px) | 600 | 1.25 | subtitulos |
| h3 | clamp(18px, 2.5vw, 22px) | 600 | 1.3 | titulos de card |
| h4 | 16px | 600 | 1.4 | labels de grupo |
| body-lg | 16px | 400 | 1.6 | corpo principal |
| body | 14px | 400 | 1.6 | interface padrao |
| small | 12px | 400 | 1.5 | legenda, meta |
| label | 11px | 600 | 1 | labels uppercase |
| button | 14px | 600 | 1 | botoes |

### Regras
- no maximo 2 pesos por tela
- titulos usam `clamp()` para responder bem em telas diferentes
- paragrafos usam `max-width: 65ch`
- descricoes curtas em cards usam `max-width: 55ch`
- destaque inline usa peso forte, nao italico

## 6. Espacamento e breakpoints

### Base 4px
```css
--space-1: 4px;
--space-2: 8px;
--space-3: 12px;
--space-4: 16px;
--space-5: 20px;
--space-6: 24px;
--space-8: 32px;
--space-10: 40px;
--space-12: 48px;
--space-16: 64px;
--space-20: 80px;
```

### Breakpoints
```css
--bp-sm:  480px;
--bp-md:  768px;
--bp-lg:  1024px;
--bp-xl:  1280px;
--bp-2xl: 1536px;
--bp-3xl: 1920px;
```

### Regra de responsividade
Todo componente comeca pelo mobile e expande com `min-width`.
Nunca desenhar desktop primeiro e reduzir depois.

## 7. Layouts em telas grandes

Em telas 1440px+, nao deixar a aplicacao inteira presa em um container estreito.
O sistema deve aproveitar o espaco disponivel sem sacrificar legibilidade.

### Regra principal
- limitar largura de texto e blocos de leitura
- nao limitar largura da pagina inteira com `max-width` fixo em px
- usar `clamp()` no padding lateral
- usar `minmax()` e grids fluidos para preencher a area disponivel

### Estrategia por ator
- Cliente: pode continuar leve, mas em telas grandes deve usar 1 a 2 colunas fluidas e contexto secundario quando fizer sentido
- Executor: pode expandir para 2 ou 3 zonas funcionais, mantendo a tarefa principal dominante
- Backoffice: sidebar fixa + area de conteudo fluida, sem cap artificial de largura da pagina

### Exemplo recomendado
```css
.page-shell {
  width: 100%;
  padding-inline: clamp(16px, 4vw, 80px);
}

.content-grid {
  display: grid;
  gap: var(--space-6);
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
}

.text-measure {
  max-width: 65ch;
}
```

### Anti-pattern
```css
.page-shell {
  max-width: 1200px;
  margin: 0 auto;
}
```

Use `max-width` para texto, formularios especificos e blocos de leitura, nao para a pagina inteira.

## 8. Container e layout base

```css
.page-shell {
  width: 100%;
  padding-inline: clamp(16px, 4vw, 80px);
}

@media (min-width: 768px) {
  .page-shell { padding-inline: clamp(20px, 4vw, 96px); }
}

@media (min-width: 1024px) {
  .page-shell { padding-inline: clamp(24px, 5vw, 120px); }
}
```

Para blocos com leitura longa:

```css
.text-measure { max-width: 65ch; }
.card-description { max-width: 55ch; }
```

## 9. Radius, sombras e iconografia

### Radius
```css
--radius-sm:   4px;
--radius-md:   8px;
--radius-lg:   12px;
--radius-xl:   16px;
--radius-full: 9999px;
```

### Sombras
```css
--shadow-xs:     0 1px 2px rgba(0,0,0,0.04);
--shadow-sm:     0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
--shadow-md:     0 4px 8px rgba(0,0,0,0.08), 0 2px 4px rgba(0,0,0,0.04);
--shadow-lg:     0 10px 24px rgba(0,0,0,0.10), 0 4px 8px rgba(0,0,0,0.06);
--shadow-xl:     0 20px 40px rgba(0,0,0,0.12);
--shadow-orange: 0 4px 12px rgba(255,102,51,0.30);
```

### Iconografia
- biblioteca: Lucide React
- stroke, nao fill
- strokeWidth 1.5
- tamanhos comuns: 16px, 20px, 24px
- touch target de 44x44px em mobile

## 10. Assets

Logos oficiais em `assets/logo/`:
- `logo-full-dark-bg.png`
- `logo-full-light-bg.png`
- `logo-icon-only.png`
- `logo-text-only-dark.png`
- `logo-text-only-light.png`

Uso recomendado:
- fundo escuro: variantes dark-bg
- fundo claro: variantes light-bg
- favicon ou avatar: icon-only

## 11. Acessibilidade visual

### Contraste

Regras praticas:
- `#FF6633` nao deve ser usado como texto pequeno em fundo claro
- para texto laranja em fundo claro, usar `--color-primary-text`
- `#B8B9B8` nao deve ser usado como texto de corpo
- status nao devem depender so de cor
- texto base usa `#262D3B` ou equivalente semantico

### Focus
```css
:focus-visible {
  outline: 2px solid #FF6633;
  outline-offset: 2px;
  border-radius: var(--radius-sm);
}
```

### Outros minimos
- touch target minimo de 44x44px em mobile
- reduced motion deve ser respeitado
- evitar contraste insuficiente em labels e estados

## 12. CSS tokens base

```css
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

:root {
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

  --font-family: 'Montserrat', sans-serif;

  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 20px;
  --space-6: 24px;
  --space-8: 32px;
  --space-10: 40px;
  --space-12: 48px;
  --space-16: 64px;
  --space-20: 80px;

  --radius-sm:   4px;
  --radius-md:   8px;
  --radius-lg:   12px;
  --radius-xl:   16px;
  --radius-full: 9999px;

  --shadow-xs:     0 1px 2px rgba(0,0,0,0.04);
  --shadow-sm:     0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
  --shadow-md:     0 4px 8px rgba(0,0,0,0.08), 0 2px 4px rgba(0,0,0,0.04);
  --shadow-lg:     0 10px 24px rgba(0,0,0,0.10), 0 4px 8px rgba(0,0,0,0.06);
  --shadow-xl:     0 20px 40px rgba(0,0,0,0.12);
  --shadow-orange: 0 4px 12px rgba(255,102,51,0.30);
}
```
