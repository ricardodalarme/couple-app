-- Content: row level security, grants and policies.

alter table public.app_config enable row level security;
grant select on public.app_config to anon, authenticated;
create policy app_config_read_all on public.app_config for select to anon, authenticated using (true);

alter table public.content_items enable row level security;
grant select on public.content_items to authenticated;

create policy content_items_read_published on public.content_items for select to authenticated
  using (published and (kind <> 'spice_card' or (select private.spice_allowed())));
