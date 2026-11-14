# SQL functions, errors and idempotency

Read this when adding or changing a function, trigger or RPC the app calls. The app reaches mutations through pg_graphql, so a
function is the public contract and an error code is its failure vocabulary.

## Contents

- Shape of a client-callable function
- Stable error codes
- Idempotency and offline writes
- Time and local dates
- Limits, triggers and housekeeping

## Shape of a client-callable function

- Lives in `public`, in the domain that owns its table (`<domain>/functions.sql`, or a concern file such as `cards/drafting.sql`).
- Parameters are `text` when a closed set is involved, cast inside (`p_kind::public.slip_kind`), because pg_graphql does not expose
  functions with enum parameters. Returns a composite type or a table row type so GraphQL can select fields.
- Readers are `stable` (GraphQL queries); writers are `volatile` (mutations). A multi-step client write is one volatile function so
  it is atomic.
- A computed field is a `stable` function over the row type that runs as the caller and returns `false`, not `null`, when the caller
  has no couple (`graphql/computed_fields.sql`).
- Every public function has a description in `graphql/function_docs.sql`.

## Stable error codes

Raise a stable code, not prose: `raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001';`. The code is the contract with the app:
the data layer maps it to a `LocalizedException(l10nKey:)` and the UI shows the localized message (see `data-layer`,
`localization`). Existing codes include `UNAUTHENTICATED`, `NOT_PAIRED`, `ALREADY_PAIRED`, `RATE_LIMITED`, `NOT_FOUND`,
`FREE_LIMIT_REACHED`, `INVALID_*` and `*_NOT_FOUND`; reuse one before inventing another.

Use SQLSTATE `23514` for check-constraint failures and `42501` for permission failures, and make sure each has a pgTAP assertion.

## Idempotency and offline writes

A write the app may retry takes a client-generated id and upserts on it, so a retry or an offline replay does not duplicate:
`save_slip(p_id uuid, ...)` updates when the id exists and the row is the caller's, and raises `SLIP_NOT_FOUND` when the id belongs
to someone else (the caller cannot learn that it exists). A client timestamp for an offline write is clamped so it is never in the
future. The Dart side keeps one id per draft (`_savedId ??= uuid`).

## Time and local dates

"Today" for daily rows is the author's local date, not the database's UTC date. `private.set_local_date()` (a trigger that
takes the column name as its argument) fills that date column from `profile_settings.time_zone` when the client sends none. Use it for daily rows, validate time zones with
`private.is_valid_time_zone`, and never use `current_date` for something a person experiences as "today".

## Limits, triggers and housekeeping

- Plan limits (the free tier) are enforced in triggers that raise `FREE_LIMIT_REACHED` (`plus/triggers.sql`), not in the client.
- Every table with `updated_at` uses `private.set_updated_at()`; the pattern generator attaches it.
- Rate-limit anything a client can spam or that reveals existence (`private.hit_rate_limit`).
- Retention lives in `private.prune_expired_rows()`, run daily by cron. A new table that grows without bound needs a rule there.
- Erased accounts are purged by `private.purge_deleted_accounts()` (cron), and their storage files are removed by the `storage-cleanup` function.
