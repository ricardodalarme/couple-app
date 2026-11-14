-- Slips: row level security, grants and policies.

alter table public.slips enable row level security;
grant select on public.slips to authenticated;
create policy slips_select_author on public.slips for select to authenticated
  using (author_id = (select auth.uid()));
