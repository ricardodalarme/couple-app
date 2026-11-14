-- Account: row level security, grants and policies.

alter table public.consents enable row level security;
grant select, insert on public.consents to authenticated;
create policy consents_select_own on public.consents for select to authenticated using (profile_id = (select auth.uid()));
create policy consents_insert_own on public.consents for insert to authenticated with check (profile_id = (select auth.uid()));

alter table public.deletion_requests enable row level security;
grant select on public.deletion_requests to authenticated;
create policy deletion_requests_select_own on public.deletion_requests for select to authenticated using (profile_id = (select auth.uid()));

alter table private.storage_deletions enable row level security;

alter table private.support_requests enable row level security;
