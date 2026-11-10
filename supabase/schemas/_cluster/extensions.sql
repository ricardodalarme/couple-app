-- Extensions required by the backend (not captured by the declarative diff of user schemas).
create extension if not exists pg_graphql with schema graphql;
create extension if not exists pg_cron with schema pg_catalog;
create extension if not exists pg_net with schema extensions;
