---
name: supabase
description: Work on the starter's schema-first Supabase backend — declarative schemas, generated migrations, RLS policies, explicit grants, pgTAP tests, the pg_graphql surface, local ports, and the GraphQL SDL snapshot. Use when changing the database schema, adding a table/query/mutation, fixing RLS or permissions, refreshing the GraphQL schema, or running the local Supabase stack.
---

# Supabase backend

The starter has its own schema-first Supabase project. It is no longer backed by
the external `quickstart-gql` server.

- Project ref: `rqrntvjatuwbmostkpao` (`sa-east-1`)
- Project URL: `https://rqrntvjatuwbmostkpao.supabase.co`
- GraphQL endpoint: `https://rqrntvjatuwbmostkpao.supabase.co/graphql/v1`
- Schema source of truth: `supabase/schemas/`
- Migrations: `supabase/migrations/`
- Dev seed: `supabase/seed.sql`
- pgTAP tests: `supabase/tests/`
- Local ports: `55321` API, `55322` database, `55323` Studio, `55324` SMTP,
  `55327` analytics

## Commands

```bash
supabase link --project-ref rqrntvjatuwbmostkpao   # one-time
supabase start                                    # local stack
supabase db reset --local                         # migrations + seed
supabase test db                                  # pgTAP
supabase db push --remote --include-all           # apply migrations remotely
melos graphql:schema                               # refresh SDL snapshot
melos gen                                         # regenerate Dart GraphQL types
```

`supabase db schema declarative sync` is local-only and needs Docker. If Docker
is unavailable, edit the declarative schema and the migration together, apply
the migration through the CLI/MCP, and keep both files consistent.

## Schema-first workflow

1. Edit the desired state under `supabase/schemas/`.
2. Generate a migration:
   ```bash
   supabase db schema declarative sync -f <change-name> --no-apply
   ```
   Review it before applying. Do not hand-write a migration when sync can
   produce it.
3. Apply locally with `supabase db reset --local`, then `supabase test db`.
4. Push with `supabase db push --remote --include-all`.
5. Refresh the GraphQL snapshot: `melos graphql:schema`, then `melos gen`.

Applied migrations are immutable. Add a new migration for the next change.

## Tables, grants, and RLS

Every exposed table has RLS enabled and explicit grants. The starter's `posts`
table is public-read only:

```sql
alter table public.posts enable row level security;
revoke all on table public.posts from anon, authenticated;
grant select on table public.posts to anon, authenticated;

create policy posts_select_all
on public.posts
for select
to anon, authenticated
using (true);
```

- Use `to anon` / `to authenticated` on policies; do not use `auth.role()`.
- An authenticated role is not authorization. Scope rows with
  `(select auth.uid()) = user_id` when a table has an owner.
- UPDATE policies need both `USING` and `WITH CHECK`.
- Public reads go through explicit grants/policies, never a base table with
  broad write grants.
- `SECURITY DEFINER` bypasses RLS. Keep it out of `public`; prefer
  `SECURITY INVOKER`.
- The local config sets `auto_expose_new_tables = false`, but hosted projects may
  still auto-expose new tables. Revoke broad grants explicitly.

The starter also has a private notification inbox and push-token backend:
- `authenticated` can select its own notifications and update only `read_at`.
- `device_tokens` is backend-only; clients never read or write the table.
- `register_device_token` / `unregister_device_token` are security-definer RPCs
  keyed to `auth.uid()`. Push tokens are registered from the app after auth.
- `anon` has no access; clients never insert notifications or tokens.
- Notifications are created server-side with the service role or a
  security-definer function, never from the app.

Do not put a `service_role` or secret key in the app. `SERVER_API_KEY` and
`SUPABASE_ANON_KEY` use the project's publishable key.

## GraphQL

`pg_graphql` is installed in the `graphql` schema. Tables in `public` that the
caller can select are exposed automatically; the starter's query is
`postsCollection`.

- The committed snapshot is
  `app/lib/features/_shared/data/data_sources/remote/schema.graphql`.
- It is downloaded by the inline `melos graphql:schema` script, which reads
  `SERVER_URL`/`SERVER_API_KEY` from `.env.development` and calls the npm
  `get-graphql-schema` CLI. Install it with
  `npm install -g get-graphql-schema@2.1.2`.
  It uses the publishable/anon role by default; set `SCHEMA_AUTH_TOKEN` to a
  service-role token when the schema includes authenticated-only tables such as
  notifications.
- Never hand-edit the snapshot or `*.graphql.dart` generated files.
- After a schema change: `melos graphql:schema` then `melos gen`.
- Feature queries/fragments belong in
  `app/lib/features/<feature>/data/data_sources/remote/`; only `_shared` owns the
  schema snapshot.

### GraphQL surface

- **Closed value sets are Postgres enums, not `text` plus a `check`.** pg_graphql
  turns them into GraphQL enums, and codegen into Dart enums. Add a value with
  `alter type public.<type> add value '<label>'`. A label that is not a valid
  GraphQL name is mapped with `comment on type ... is '@graphql({"mappings": {...}})'`.
  Open or server-written sets (locale, editorial content kinds, subscription
  state) stay `text`.
- **Functions keep `text` parameters.** pg_graphql does not expose a function that
  takes or returns an enum, so cast inside the function
  (`insert ... values (p_kind::public.signal_kind)`). Passing text to an enum
  column without a cast fails at runtime, and pgTAP only catches it if a test calls
  the function, so add a test that calls each function with a valid and an invalid
  value.
- **Page size.** pg_graphql silently caps a page at `max_rows` even when the
  query asks for more (`first: 100` returned 50 with the schema at 50). Every
  collection the app reads in one page needs a limit that covers it.
- **Table settings live in one file**, `supabase/schemas/graphql/table_comments.sql`:
  `max_rows`, `totalCount`, `aggregate` and a description for every table and
  view. Do not scatter `comment on table ... @graphql(...)` across files, because a
  table has one comment and the last statement wins.
- **Describe every public function** (`graphql/function_docs.sql`), and give caller
  relative flags as computed fields (`is_mine`, `is_shared`) instead of making the
  client fetch the user and couple ids. A computed field is a `stable` function
  taking the row type, runs as the caller, and must return `false`, not `null`,
  when the caller has no couple.
- **Read-only functions are `stable` (queries); writers are `volatile`
  (mutations).** Multi-step client writes belong in one `volatile` function so
  they are atomic; aliased mutations in one request are atomic too, but a client
  cannot build them dynamically.
- After changing enums or table settings: `supabase db schema declarative sync -f
  <name> --no-apply`, review the migration (it can emit `create type` after its
  first use, so move the types to the top), `supabase migration up --local`,
  `supabase test db`, refresh the snapshot against the **local** stack (never the
  remote), then validate every document against it.

## Seed and tests

- `supabase/seed.sql` is development-only. It is idempotent and clearly labeled.
- pgTAP tests live in `supabase/tests/` and run with `supabase test db` after
  `supabase db reset --local`.
- Cover RLS, grants, constraints, and any database-owned invariant. A schema
  change needs a test there.

## Gotchas

- Docker is required for the local stack and declarative sync.
- `supabase db reset` replays migrations, not the declarative files.
- `supabase db push` requires the project to be linked and may need a moment
  after a project restore before the login role is ready.
- `project_id` in `config.toml` is the project ref; local container names use it.
- The hosted project may have Data API auto-expose enabled even though local
  config disables it. Explicit `revoke`/`grant` is the portable rule.
- Do not add product/domain tables without a real feature requirement.
