# CLAUDE.md — Decorafit Platform

## Produto

Plataforma de gestão de reformas rem apartamentos. Orquestra o ciclo completo da reforma: do projeto à entrega.

## Atores
 
- **Backoffice** (Decorafit): orquestra operação, fornece ferramentas, controla qualidade
- **Executor**: parceiro externo que lidera a obra no campo
- **Cliente**: dono do apartamento, aprova projetos e valida entregas
 
Entidade central: **REFORMA**. Todo módulo se conecta via `reform_id`.

## Tech Stack
 
- **Monorepo**: pnpm + Turborepo
- **Frontend**: Next.js 14+ (App Router) com TypeScript strict
- **Backend**: NestJS com TypeScript strict
- **Banco**: Supabase PostgreSQL self-hosted
- **Auth**: Supabase Auth self-hosted (Google OAuth, magic link, credentials)
- **ORM**: Prisma
- **Fila**: Redis + BullMQ
- **Storage**: Supabase Storage self-hosted (nunca disco local)
- **UI**: Decorafit Design System (Tailwind + componentes próprios)
- **Testes**: Vitest (unitários) + Playwright (E2E)
- **Observabilidade**: Sentry + PostHog
- **CI/CD**: GitHub Actions → Coolify (containers) → 1 VPS Hostinger

## Estrutura do Monorepo
 
```
apps/web/          → Next.js — portais (backoffice, executor, cliente)
apps/api/          → NestJS — API backend
apps/worker/       → BullMQ consumer — jobs assíncronos
packages/ui/       → Design system Decorafit
packages/config/   → Configs compartilhadas (eslint, tsconfig, vitest)
packages/shared/   → Utilidades compartilhadas (formatters, validators)
packages/domain/   → Tipos de domínio, enums, interfaces
packages/contracts/→ Tipos compartilhados API ↔ Frontend
packages/testing/  → Helpers de teste (factories, fixtures)
```
 
## Comandos essenciais
 
```bash
pnpm install                  # instalar dependências
pnpm dev                      # rodar todos os apps em dev
pnpm build                    # build de produção
pnpm lint                     # eslint + prettier
pnpm typecheck                # tsc --noEmit em todos os packages
pnpm test                     # vitest (unitários)
pnpm test:e2e                 # playwright (E2E)
pnpm exec prisma migrate dev  # rodar migrations
pnpm exec prisma generate     # gerar Prisma Client
```
 
IMPORTANTE: sempre rode `pnpm lint` e `pnpm typecheck` após fazer alterações. Rode `pnpm test` para verificar que nada quebrou.

## Regras de arquitetura
 
- Monólito modular: nenhum módulo acessa persistência de outro
- Integração entre módulos: serviço de aplicação ou evento interno
- Todo código nasce com teste (TDD)
- Toda entrega em vertical slice
- Tudo que mexe com dinheiro: trilha de auditoria
- Soft-delete padrão (`deleted_at` nullable)
- Implementar apenas o que a spec atual exige — não antecipar features
 
Para regras detalhadas, state machine da reforma e diagramas: ver `docs/architecture/`
 
## Linguagem
 
- **Código**: inglês (variáveis, funções, classes, commits, PRs)
- **Interface do usuário**: português brasileiro
- **Documentação técnica**: português brasileiro
- **Specs e tasks**: português brasileiro

## Spec-Driven Development
- Toda feature nasce por spec
- Specs em /specs/<NNN-feature>/
- Constitution em .specify/memory/constitution.md
- Design entre clarify e plan
- TDD: testes antes da implementação

## Skills disponíveis
 
Consultar `.claude/skills/` para workflows específicos. Skills são carregados sob demanda — não tente reproduzir o conteúdo deles aqui.
 
- **/decorafit-design-system** — gerar UI/UX seguindo o Decorafit Design System
- **/speckit.specify** — criar spec de feature
- **/speckit.clarify** — refinar spec
- **/speckit.plan** — criar plano técnico
- **/speckit.tasks** — criar breakdown de tasks
- **/speckit.implement** — implementar
- **/speckit.analyze** — validar consistência
 
## Documentação de referência
 
Ler o arquivo relevante antes de começar uma tarefa:
 
- **Arquitetura geral**: `docs/architecture/`
- **Decisões (ADR)**: `docs/adr/`
- **Runbooks**: `docs/runbooks/`
- **Spec da feature atual**: verificar branch e ler `specs/<NNN>/`
- **Constitution**: `.specify/memory/constitution.md`
- **Design System**: `packages/ui/`