-- Extensions and shared schemas required by the starter's GraphQL surface.
create extension if not exists pg_graphql with schema graphql;

create schema if not exists graphql_public;
