# Privacy, RLS and access patterns

Read this before adding a table, a policy, a view or any function that reads or writes user data. The product rule is: whoever
produces data decides who sees it. Everything is default-deny, and a row becomes visible to the partner only when its author shares it.

## Contents

- The ownership model
- Choosing a policy pattern
- Reads and writes through functions
- Column-level and storage access
- Anonymous and guest access
- Anti-patterns

## The ownership model

- `public` is the client API surface (GraphQL); `private` holds internals and is never exposed (`_platform/privileges.sql`). Default
  privileges revoke everything from `anon` and `authenticated` on new tables, sequences and functions.
- An owned row has `author_id` (the creator). A row that can be shared also has a nullable `couple_id`: `null` means private to
  the author, set means visible to both partners.
- `private.current_couple_id()`, `private.partner_id()` and `private.is_couple_member(uuid)` (`identity/functions.sql`) are the
  only way policies and functions resolve the couple. Wrap them in a select so Postgres evaluates them once per statement:
  `(select private.current_couple_id())`, `(select auth.uid())`.

## Choosing a policy pattern

`supabase/schemas/cross_cutting/rls_patterns.sql` generates the policies, grants, indexes and `updated_at` triggers for three
patterns from lists of table names. Add a table to the list that matches; write a custom policy only when none fits.

| Pattern | Visible to | Use for | Examples |
| --- | --- | --- | --- |
| 1. Owner only | the author | private notes, moods, cycle data, journal | `moods`, `journal_entries`, `partner_facts` |
| 2. Owner plus couple | the author, and the partner when `couple_id` is set | things two people share | `memories`, `lists`, `agreements` |
| 3. Child of a visible parent | whoever can see the parent row | line items | `list_items`, `ritual_logs`, `decision_options` |

Rules every policy follows:

- Name the role (`to authenticated`); never `auth.role()`.
- `update` has both `using` and `with check`, and `with check` stops a row being moved to another couple.
- Index the columns the policy filters on (`author_id`, `couple_id`, the parent foreign key).
- Child tables gain access only through their parent; do not copy the couple id into children.

## Reads and writes through functions

A table with a rule stricter than "owner may write" (validation, idempotency, a limit, derived columns) has no direct write grant.
Slips are the model: `authenticated` can select its own rows, and every write goes through `public.save_slip`, a
`security definer` function. Tests assert direct `insert` and `update` fail with `42501`. Prefer this for any write that must enforce
an invariant, because a policy cannot validate content or count rows.

For a `security definer` function:

1. `language plpgsql security definer set search_path = ''`, and schema-qualify every object.
2. Start with `v_uid uuid := private.require_user();` (raises `UNAUTHENTICATED`).
3. Scope every row by `v_uid` or the couple resolved from it; never trust an id the client sends without checking it belongs to the caller.
4. `grant execute on function ... to authenticated` explicitly; execute is revoked from `public` by default.
5. Prefer `security invoker` when RLS already filters correctly (views and simple readers).

## Column-level and storage access

- Limit which columns a client may change with a column grant: `revoke update on public.agreements from authenticated; grant update
  (title, body, review_on, couple_id) on public.agreements to authenticated;`. Keep the revoke after the table-wide grant, in the
  same file, because statement order inside a file matters.
- A private storage bucket's policy keys on the first path folder: `(storage.foldername(name))[1] = (select
  private.current_couple_id())::text` (`couple_photos/storage.sql`). Buckets are rows created by a migration, not by a declarative file.
- Realtime channels carry an event name and a table name only, never row content (`realtime/`); a client refetches on the signal.
  `private.signal` swallows errors so a broadcast problem never breaks the write.

## Anonymous and guest access

- `anon` has no table access. The guest partner, who has no account, reaches data only through the `guest` Edge Function with a
  link token; the function answers every invalid, expired, revoked or stopped token with the same 404 body.
- Invite codes are stored hashed (`private.hash_invite_code`), expire, and are single-use. `accept_invite` returns `NULL` for any
  invalid code, so a caller cannot tell "unknown" from "expired" or "already used", and failed attempts are counted.
- Sensitive lookups call `private.hit_rate_limit(key, max, window)` and raise `RATE_LIMITED`.

## Anti-patterns

- A policy that exposes a private row to the partner "for convenience", or a view that joins private data without the same filter.
- `security definer` without `search_path = ''`, or a definer function that trusts a client-supplied id.
- A client-readable table of tokens, notifications or the outbox; those stay in `private`.
- `to public` policies, `using (true)` on a table with personal data, `grant ... to anon` on anything but public config.
- Computing "who did more", a relationship score or partner activity history anywhere in SQL; the product never exposes them.
