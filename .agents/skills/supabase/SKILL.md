---
name: supabase
description: Changes the schema-first Supabase backend of this app, which holds the privacy model of the product. Covers the declarative schema and generated migrations, tables with explicit grants and RLS, who-can-see-what patterns, SECURITY DEFINER functions and stable error codes, the pg_graphql surface, Edge Functions, cron jobs, Vault secrets, notifications and push, pgTAP tests, the local stack and the GraphQL snapshot. Use when changing the database schema, adding a table, view, query, mutation or function, fixing RLS or permissions, adding a cron job, Edge Function or notification type, writing database tests, running the local stack, or refreshing the GraphQL schema.
---

# Supabase backend

The backend is a large part of the product: it enforces who sees what. Backend changes come first, before the app code that
needs them, and a change is not done until it has a test.

`supabase/README.md` holds the project ref, the schema folder layout, where a new object goes and the rules that keep a sync clean;
read it before adding or moving a file under `supabase/schemas/`. This skill holds the workflow and points to a reference for each
area. Open the reference that matches the task before writing SQL:

| Task | Read |
| --- | --- |
| New table, view, policy, grant, anything that decides who can read or write | [references/privacy-and-rls.md](references/privacy-and-rls.md) |
| New or changed function, trigger, RPC, error code, limit or retention rule | [references/functions-and-errors.md](references/functions-and-errors.md) |
| Something the app will query: enum, computed field, table setting, snapshot | [references/graphql-surface.md](references/graphql-surface.md) |
| Edge Function, cron job, Vault secret, notification type, push | [references/edge-functions-and-jobs.md](references/edge-functions-and-jobs.md) |
| Any schema change (every one needs a test) | [references/testing-pgtap.md](references/testing-pgtap.md) |

## Workflow

1. Edit the desired state under `supabase/schemas/<domain>/`. Declare each object once, in its final form.
2. Generate the migration: `supabase db schema declarative sync -f <change-name> --no-apply`, and read it. The generator can emit
   privilege noise lines (trim them) and can place `create type` after its first use (move types to the top). Do not hand-write a
   migration the sync can produce, and never edit an applied migration; add a new one.
3. Replay locally with `supabase db reset --local`, then `supabase test db`.
4. Drift check: `supabase db schema declarative sync --no-apply` must print "No schema changes found".
5. If the app will read it, refresh the GraphQL snapshot against the local stack, then `melos gen`. Never hand-edit the snapshot or
   a generated file.
6. Applying to the linked project (`supabase db push`, function deploys, secrets) happens only when the owner asks, and the summary
   says exactly what changed.

The local stack needs Docker, with ports `563xx` (`supabase/config.toml`). `supabase db reset` replays migrations, not the
declarative files. Never run `supabase test db` against the linked project.

## Rules that always apply

- Everything is default-deny: new tables and functions in `public` are unreachable until granted. Every exposed table enables RLS
  with explicit grants and policies; `anon` has no table access.
- Whoever produces data decides who sees it. Private rows (`couple_id` null) are never readable by the partner, and a table with a
  stricter rule than "the owner may write" has no direct write grant; its writes go through a `security definer` function.
- A `security definer` function sets `search_path = ''`, starts with `private.require_user()` and scopes every row to the caller.
- Errors are stable codes (`raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001'`) that the app maps to localized messages.
- Closed value sets are Postgres enums; function parameters stay `text` and are cast inside.
- The backend creates every notification. Clients never read tokens or the outbox, and never get a `service_role` or secret key.
- No scoring of the relationship, no partner activity history and no safety-triage data on the server, in any table, view or function.
- A table that can grow without bound gets a retention rule in `private.prune_expired_rows()`.

## Gotchas

- Folder order matters for sync: `_cluster` and `_platform` sort before every domain because default privileges apply only to tables
  created after them. Keep it that way.
- `pg_graphql` silently caps a page at `max_rows`, and does not expose functions with enum parameters.
- Table settings for GraphQL live only in `graphql/table_comments.sql`; a table has one comment and the last statement wins.
- A missing enum cast fails only at runtime, so a test must call each function with a valid and an invalid value.
- `with check` is as important as `using` on an update policy; without it a row can be moved to another couple.
- Seed data is development-only (`supabase/seed.sql`) and idempotent; declarative files hold no data statements, and storage buckets
  are created by migrations.
- The pgTAP setup file is not rolled back and leaves `tap` and `tests` schemas behind: local stack only.
