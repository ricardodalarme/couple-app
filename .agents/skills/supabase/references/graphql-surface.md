# The GraphQL surface (pg_graphql)

Read this when adding a table, view or function the app will query, or when changing an enum or a table's GraphQL settings.

## Contents

- What is exposed
- Enums
- Functions
- Table and view settings
- After a change

## What is exposed

`pg_graphql` is installed in the `graphql` schema and exposes what the caller may select in `public`, in camelCase
(`inflect_names`). The endpoint is `https://<ref>.supabase.co/graphql/v1`. The committed snapshot is
`app/lib/features/_shared/data/data_sources/remote/schema.graphql`; never hand-edit it or any generated file.

## Enums

- A closed value set is a Postgres enum, not `text` plus a `check`, so GraphQL and codegen expose it as an enum. Add a value with
  `alter type public.<type> add value '<label>'`, in the type's original definition in its domain.
- A label that is not a valid GraphQL name is mapped with `comment on type ... is '@graphql({"mappings": {...}})'`.
- Open or server-written sets (locale, editorial kinds, subscription state) stay `text`.
- The Dart side models each as a plain camelCase enum with `toModel()`/`toRemote()` mappers (see `data-layer`).

## Functions

- Parameters stay `text`, cast inside the function; pg_graphql does not expose a function with an enum parameter or return value.
- Readers are `stable` (queries), writers `volatile` (mutations). Aliased mutations in one request are atomic, but a client cannot
  build them dynamically, so a multi-step write belongs in one function.
- Every public function has a description in `graphql/function_docs.sql`.
- Caller-relative flags (`is_mine`, `is_shared`) are computed fields in `graphql/computed_fields.sql`, so the client never fetches
  the user and couple ids to compare.

## Table and view settings

All in `schemas/graphql/table_comments.sql`: `max_rows`, `totalCount`, `aggregate` and a description for every table and view. Do
not scatter `comment on table ... @graphql(...)` across files, because a table has one comment and the last statement wins.
GraphQL directives on a constraint stay beside the constraint. pg_graphql silently caps a page at `max_rows` (a `first: 100`
returned 50 when the setting was 50), so every collection read in one page needs a limit that covers it.

## After a change

1. `supabase db schema declarative sync -f <name> --no-apply`, read the migration (types may be emitted after first use; move them
   to the top), `supabase migration up --local`, `supabase test db`.
2. Refresh the snapshot against the local stack, never the remote (`melos graphql:schema`), then `melos gen`.
3. Validate every `.graphql` document in `app/lib` against the new snapshot; typed variables use the enum (`$kind: ListKind!`), never `String`.
