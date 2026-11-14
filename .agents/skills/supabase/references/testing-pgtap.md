# pgTAP tests

Read this when adding or changing anything under `supabase/schemas/`. A schema change without a test is incomplete.

## Contents

- Layout and running
- Helpers
- What to cover
- Assertion conventions

## Layout and running

- Tests live in `supabase/tests/database/<domain>/<name>_test.sql`, with the same domain names as the schemas. A test that walks
  several domains with shared fixtures lives in `cross_cutting/`. `00_setup/` installs pgTAP in schema `tap` and the helpers in
  schema `tests`; it sorts first and is not rolled back.
- `supabase db reset --local`, then `supabase test db`. Run it only against the local stack: the setup leaves `tap` and `tests`
  behind, and on the linked project they were once visible in the production GraphQL schema.
- A test file is one transaction: `begin; set local search_path = tap, public, extensions; select plan(n); ...; select * from
  finish(); rollback;`, so it leaves no data.

## Helpers

`tests.create_user('ana')` creates an auth user (the profile bootstrap trigger runs), `tests.uid('ana')` is its stable id,
`tests.pair('ana', 'bia')` makes a couple, and `tests.as('ana')`, `tests.as_anon()` and `tests.as_admin()` switch the acting role for
the rest of the transaction. Give explicit ids to rows whose table has a sequence the test role cannot use.

## What to cover

For every new table or function, assert as each actor:

1. **The author** can do what the product allows, and sees only their own rows.
2. **The partner** cannot read a private row, can read a shared one, and cannot overwrite the author's row by reusing its id.
3. **A stranger** (a user from another couple) sees nothing.
4. **Anonymous** is denied (`42501`) or sees only public config.
5. **Direct writes** fail with `42501` when writes go through a function.
6. **Validation:** empty, over-limit and unknown values are rejected with the documented code (`23514`, or `P0001` plus the message).
7. **Idempotency:** the same client id twice updates, not duplicates.
8. **Every enum-casting function** is called with a valid and an invalid value, because a missing cast only fails at runtime.
9. **Invariants the database owns:** limits, retention, dedupe keys, rate limits, cascade behavior.

## Assertion conventions

- `is`, `ok`, `isnt`, `throws_ok(sql, code, message, description)`, `lives_ok`, `results_eq`. Pass the SQLSTATE and, for domain
  errors, the stable message (`'P0001', 'SLIP_NOT_FOUND'`).
- Each assertion has a plain-English description that says the rule (`'partner cannot read my slips'`).
- Keep `plan(n)` accurate; a miscount fails the file.
