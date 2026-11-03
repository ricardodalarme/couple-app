create table public.posts (
  id uuid primary key default gen_random_uuid(),
  content text not null,
  title text not null,
  author_image_url text
);

alter table public.posts enable row level security;

revoke all on table public.posts from anon, authenticated;
grant select on table public.posts to anon, authenticated;
grant all on table public.posts to service_role;

create policy posts_select_all
on public.posts
for select
to anon, authenticated
using (true);
