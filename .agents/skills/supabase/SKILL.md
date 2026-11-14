---
name: supabase
description: Changes the schema-first Supabase backend of this app. Covers the declarative schema and generated migrations, tables with explicit grants and RLS, SECURITY DEFINER rules, pgTAP tests, the pg_graphql surface (enums, function parameters, page caps, table settings), Edge Functions, cron jobs, the local stack and refreshing the GraphQL snapshot. Use when changing the database schema, adding a table, query, mutation, function, cron job or Edge Function, fixing RLS or permissions, running the local stack, or refreshing the GraphQL schema.
---

# Supabase backend

`supabase/README.md` is the reference for the project ref, the schema folder layout, where a new object goes and the rules that keep
a sync clean; read it before adding or moving a file under `supabase/schemas/`. This skill holds the workflow and the rules that
are easy to get wrong.

## Workflow

1. Edit the desired state under `supabase/schemas/<domain>/`.
2. Generate the migration with `supabase db schema declarative sync -f <change-name> --no-apply`, and read it. The generator can emit
   privilege noise lines (trim them) and can place `create type` after its first use (move types to the top). Do not hand-write a
   migration the sync can produce, and never edit an applied migration; add a new one.
3. Replay locally with `supabase db reset --local`, then run `supabase test db`. A schema change needs a pgTAP test.
4. Drift check: `supabase db schema declarative sync --no-apply` must print "No schema changes found".
5. Refresh the GraphQL snapshot against the local stack, then `melos gen`. `melos graphql:schema` reads `SERVER_URL` and
   `SERVER_API_KEY` from `.env.development` and needs the npm `get-graphql-schema` CLI and `SCHEMA_AUTH_TOKEN` for tables that only
   `authenticated` can read. Never hand-edit the snapshot or any generated file.
6. Applying to the linked project (`supabase db push`, function deploys, secrets) happens only when the owner asks, and the
   summary says exactly what changed.

The local stack needs Docker, with ports `563xx` (`supabase/config.toml`). `supabase db reset` replays migrations, not the
declarative files. Never run `supabase test db` against the linked project: its setup leaves the `tap` and `tests` schemas behind.

## Tables, grants and RLS

Default privileges revoke everything from `anon` and `authenticated` on new tables and functions
(`supabase/schemas/_platform/privileges.sql`), so nothing is reachable until it is granted. Every exposed table enables RLS and
carries explicit grants and policies:

```sql
alter table public.app_config enable row level security;
grant select on public.app_config to anon, authenticated;
create policy app_config_read_all on public.app_config
  for select to anon, authenticated using (true);
```

- Policies name their role (`to authenticated`); do not use `auth.role()`.
- A signed-in role is not authorization: scope owned rows with `(select auth.uid()) = user_id`, or through `private.partner_id()`.
- `update` policies need both `using` and `with check`.
- `security definer` bypasses RLS: set `search_path = ''`, start with `private.require_user()` and scope every row by `auth.uid()` or
  `private.partner_id()`. Prefer `security invoker` when RLS already filters.
- Whoever produces data decides who sees it (see `AGENTS.md`); a table that holds private data has no policy that lets the partner
  read it before it is shared.
- Clients never read notification tokens or the outbox: triggers and definer functions queue rows with
  `private.enqueue_notification`, the `push-sender` function claims them, and the app only uses `register_device`,
  `unregister_device`, `revoke_device` and its own `notification_settings`.
- Never put a `service_role` or secret key in the app.

## GraphQL surface

`pg_graphql` exposes what the caller can select in `public`.

- **Closed value sets are Postgres enums**, not `text` plus a `check`. A label that is not a valid GraphQL name is mapped with
  `comment on type ... is '@graphql({"mappings": {...}})'`. Open or server-written sets (locale, editorial kinds, subscription state)
  stay `text`.
- **Functions keep `text` parameters**, because pg_graphql does not expose a function that takes or returns an enum. Cast inside
  (`p_kind::public.signal_kind`). A missing cast fails only at runtime, so a test must call each function with a valid and an invalid
  value.
- **Page size.** pg_graphql silently caps a page at `max_rows`; every collection the app reads in one page needs a limit that covers it.
- **Table settings** (`max_rows`, `totalCount`, `aggregate`, descriptions) live in `supabase/schemas/graphql/table_comments.sql` only,
  because a table has one comment and the last statement wins. Function descriptions are in `graphql/function_docs.sql`, computed fields in `graphql/computed_fields.sql`.
- **Caller-relative flags** (`is_mine`, `is_shared`) are computed fields: a `stable` function over the row type that returns `false`,
  not `null`, when the caller has no couple.
- **Readers are `stable` (queries), writers are `volatile` (mutations).** A multi-step client write belongs in one volatile function
  so it is atomic.
- After changing enums or table settings, validate every `.graphql` document against the refreshed snapshot.

## Edge Functions and cron

- Functions live in `supabase/functions/<name>/` with `_shared/` for common code. They set `verify_jwt = false` in `config.toml` and
  authenticate themselves with `_shared/auth.ts` (`isServiceCaller`, `safeEqual`). Deno tests:
  `deno test --allow-env supabase/functions/_shared`.
- Scheduled work is declared in `supabase/schemas/_cluster/jobs.sql` and calls a function through `private.invoke_edge_function`,
  which reads its URL and secret from Vault.
- Secrets live in Vault or function secrets, never in the repo or the app.

## Seed and tests

- `supabase/seed.sql` is development-only and idempotent. Declarative files hold no data statements; storage buckets are created by
  migrations.
- pgTAP tests live in `supabase/tests/database/<domain>/<name>_test.sql` and cover RLS, grants, constraints, definer functions and any
  database-owned invariant. When a test inserts into a table with a sequence, give explicit ids instead of relying on sequence
  privileges.
