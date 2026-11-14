-- GraphQL surface: schema-level page limit and introspection.

-- GraphQL surface: one place for page limits and descriptions. Counts (totalCount, aggregate) are off until a screen needs one.
-- A `first` above `max_rows` is silently capped by pg_graphql, so every collection the app reads in one page gets a limit that covers it.

comment on schema public is e'@graphql({"inflect_names": true, "max_rows": 100, "introspection": true})';
