-- Guest links: views.

create view public.guest_link_created with (security_invoker = true) as
  select id, null::text as token, expires_at from public.guest_links where false;
comment on view public.guest_link_created is e'@graphql({"primary_key_columns": ["id"], "description": "Result of createGuestLink. The token is shown once; the page URL is <site>/c/<token>."})';
grant select on public.guest_link_created to authenticated;
