-- My manual and partner facts: row level security, grants and policies.

-- My manual: the partner reads only entries I marked as shared.
create policy manual_entries_select_shared_by_partner on public.manual_entries for select to authenticated
  using (shared and author_id = (select private.partner_id()));
