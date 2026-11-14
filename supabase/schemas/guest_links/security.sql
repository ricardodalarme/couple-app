-- Guest links: row level security, grants and policies.

alter table public.guest_links enable row level security;
grant select (id, card_id, expires_at, revoked_at, created_at) on public.guest_links to authenticated;
create policy guest_links_select_author on public.guest_links for select to authenticated
  using (exists (select 1 from public.cards c where c.id = card_id and c.author_id = (select auth.uid())));

alter table private.guest_stops enable row level security;

alter table private.abuse_reports enable row level security;
