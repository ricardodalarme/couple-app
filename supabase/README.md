# Repara backend (Supabase)

- Remote project: `repara`, ref `esbhdlbhbeoiwaonsgdg`, region `sa-east-1`
- GraphQL: `https://esbhdlbhbeoiwaonsgdg.supabase.co/graphql/v1` (pg_graphql, camelCase via `inflect_names`)
- Source of truth: `supabase/schemas/` (declarative) + `supabase/migrations/` (applied in order)
- Tests: `supabase/tests/database/*.sql` (pgTAP; `000-setup-tests-hooks.sql` installs pgTAP in schema `tap` and helpers in `tests`)
- Client API lives in schema `public`; internals in `private` (never exposed). Everything is default-deny.

```bash
supabase link --project-ref esbhdlbhbeoiwaonsgdg   # one-time
scripts/test-backend.sh                            # local reset + pgTAP + lint + drift check
supabase db push                                   # apply new migrations to the remote
```

Docs: `backlog/backend/` (PROGRESS, DECISIONS, api-contract, remote, standards).
