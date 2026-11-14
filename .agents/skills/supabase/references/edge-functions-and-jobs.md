# Edge Functions, cron and notifications

Read this when adding or changing an Edge Function, a cron job, a Vault secret or anything that sends a notification.

## Contents

- The functions
- Writing a function
- Authentication per function
- Cron jobs and Vault
- Notifications and push
- Deploying

## The functions

| Function | Purpose | `verify_jwt` | Caller |
| --- | --- | --- | --- |
| `chat` | calm chat with the mascot, streamed as server-sent events | true | signed-in app user (role checked in code) |
| `places` | place suggestions for dates | true | signed-in app user |
| `guest` | public endpoints for the guest partner | false | link token |
| `purchases-webhook` | RevenueCat events to entitlements | false | RevenueCat, shared-secret header |
| `push-sender` | drains the notification outbox | false | pg_cron only |
| `storage-cleanup` | removes files of erased accounts | false | pg_cron only |

`config.toml` sets `verify_jwt` per function.

## Writing a function

- Folder `supabase/functions/<name>/index.ts` using `Deno.serve`. Shared code is in `_shared/`: `db.ts` (`sql`, `json`, `cors`,
  `clientIp`, `log`) and `auth.ts` (`isServiceCaller`, `safeEqual`).
- Database access uses the built-in `SUPABASE_DB_URL` through `sql` from `_shared/db.ts`, because functions call into the
  `private` schema, which the REST API does not expose. Keep the SQL in the schema as a function and call it; avoid ad hoc queries
  in TypeScript.
- Start the file with a comment describing the endpoint, its request and response shapes, its error codes and its required secrets.
- Log with `log(event, fields)`: structured lines, never tokens, message bodies or names. A function that handles private text (chat)
  stores and logs none of it.
- Compare secrets with `safeEqual` (constant time) and put a timeout on outbound calls.
- Answer unknown or unauthorized callers uniformly (one 404 or 401 body) so a response cannot be used to enumerate.
- Tests: Deno tests next to the code (`relay_test.ts`, `auth_test.ts`), run with `deno test --allow-env supabase/functions/_shared`
  or the function's folder. CI type-checks the functions.

## Authentication per function

`verify_jwt = true` only proves the token is valid, and the public anon key is a valid JWT, so a function that must be signed-in
only also reads the token's claims and checks `role` (see `chat/index.ts`). A function with `verify_jwt = false` must authenticate
itself: `isServiceCaller(req)` for cron-invoked functions, a `safeEqual` shared secret for a webhook, a link token for `guest`.

## Cron jobs and Vault

- Jobs are declared in `schemas/_cluster/jobs.sql` with `cron.schedule(name, cron, command)`. A job that calls a function uses
  `select private.invoke_edge_function('<name>')`, which posts to `/functions/v1/<name>` with the project secret key in the `apikey`
  header. The URL and key come from Vault secrets `project_url` and `secret_key`; until both exist it does nothing, so jobs are safe
  before setup.
- Current jobs: weekly card drafts, pause expiry, daily reminders, account purge, row pruning, `push-sender` (every minute) and
  `storage-cleanup` (daily).
- Function secrets (`FCM_SERVICE_ACCOUNT`, `REVENUECAT_WEBHOOK_AUTH`, `CHAT_API_*`, ...) are set on the project, never committed.
  Say exactly which secret you set when you set one, and only when the owner asked.

## Notifications and push

- The backend creates every notification. A trigger or a definer function calls `private.enqueue_notification(profile, type,
  ref_id, dedupe_key)`, which inserts into `private.notification_outbox` and ignores a repeated `dedupe_key`.
- Clients read and change only their own `notification_settings`, register a token with `register_device`, and remove it with
  `unregister_device` or `revoke_device`. They never read tokens or the outbox.
- `private.claim_notifications(n)` leases jobs for the sender and retries a failed one after five minutes, up to five attempts.
  Payloads are generic (type plus reference id), never content.
- Delivery rules live in SQL: a person's settings, quiet hours, a daily cap and pauses decide `send` or `drop`.
  `private.is_partner_initiated(type)` marks the types a pause or the cap never silences; add a new partner-initiated type there.
- Push needs the FCM service-account secret; without it, nothing is claimed.

## Deploying

Deploys, secrets and pushing migrations to the linked project happen only when the owner asks. State what changed. The
`supabase` GitHub workflow checks drift and type-checks functions on every relevant change.
