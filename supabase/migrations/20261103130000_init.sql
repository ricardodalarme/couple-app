-- Initial Flutter Bloc Starter schema.
create extension if not exists pg_graphql with schema graphql;

create schema if not exists graphql_public;

create table if not exists public.posts (
  id uuid primary key default gen_random_uuid(),
  content text not null,
  title text not null,
  author_image_url text
);

alter table public.posts enable row level security;

revoke all on table public.posts from anon, authenticated;
grant select on table public.posts to anon, authenticated;

drop policy if exists posts_select_all on public.posts;
create policy posts_select_all
on public.posts
for select
to anon, authenticated
using (true);
