# Supabase

The starter uses a schema-first Supabase project with `pg_graphql` serving the
app's GraphQL reads.

- Project ref: `rqrntvjatuwbmostkpao` (`sa-east-1`)
- GraphQL endpoint: `https://rqrntvjatuwbmostkpao.supabase.co/graphql/v1`
- Schema source of truth: `supabase/schemas/`
- Migrations: `supabase/migrations/`
- Seed data: `supabase/seed.sql` (development only)
- pgTAP tests: `supabase/tests/`

## Setup

```bash
# One-time: install Docker, then link this checkout to the project.
supabase link --project-ref rqrntvjatuwbmostkpao

# Start the local stack and replay migrations + seed.
supabase start
supabase db reset --local

# Run the database tests.
supabase test db
```

## Change the schema

1. Edit `supabase/schemas/` (for example `public/posts.sql`).
2. Generate and review a migration:
   ```bash
   supabase db schema declarative sync -f <change-name> --no-apply
   ```
3. Apply locally:
   ```bash
   supabase db reset --local
   ```
4. Push to the linked project:
   ```bash
   supabase db push --remote --include-all
   ```
5. Refresh the GraphQL snapshot and regenerate the Dart types:
   ```bash
   npm install -g get-graphql-schema@2.1.2   # one-time
   melos graphql:schema
   melos gen
   ```

`melos graphql:schema` runs an inline shell command in the root `pubspec.yaml`.
It reads `SERVER_URL` and `SERVER_API_KEY` from `.env.development` and invokes
`get-graphql-schema` with the publishable key. For authenticated-only tables,
also set `SCHEMA_AUTH_TOKEN` to a service-role token; the command sends it as a
Bearer header. Edit the inline command to add another header if needed.

`supabase db schema declarative sync` is local-only and requires Docker. When
Docker is unavailable, edit the schema and migration together, apply the
migration through the Supabase MCP/CLI, and keep them in sync.

## Local ports

This checkout uses `553xx` ports (`55321` API, `55322` database, `55323` Studio,
`55324` SMTP, `55327` analytics) so it can run beside another local Supabase
project. Local GraphQL is `http://127.0.0.1:55321/graphql/v1`.

## Notifications

`public.notifications` is a private inbox:

- `authenticated` can select its own rows and update only `read_at`.
- `anon` has no access; clients never insert notifications.
- Producers insert with the service role (or a security-definer function).
- `supabase/tests/notifications_test.sql` covers the table, policies, and indexes.

`public.device_tokens` is backend-only. The app registers an FCM installation
through `register_device_token`; it never reads or writes the token table.
`supabase/tests/device_tokens_test.sql` covers the table and functions.

Push delivery still requires a server sender. Configure the FCM sender and an
APNs key in the Firebase console; the iOS app must have the Push Notifications
capability enabled in Xcode.

To create a local test notification for an existing auth user:

```bash
supabase db query --local "
insert into public.notifications (recipient_id, kind, title, body)
select id, 'system', 'Test notification', 'Created from the local database'
from auth.users
limit 1;
"
```

## Client configuration

`.env.development` needs:

```dotenv
SERVER_URL=https://<project-ref>.supabase.co/graphql/v1
SERVER_API_KEY=<publishable-key>
SUPABASE_URL=https://<project-ref>.supabase.co
SUPABASE_ANON_KEY=<publishable-key>
```

`SERVER_API_KEY` is the `apikey` header for GraphQL; `SUPABASE_ANON_KEY` is used
by `Supabase.initialize` for Auth. Both can use the project's publishable key.
Never put a `service_role` or secret key in the app.
