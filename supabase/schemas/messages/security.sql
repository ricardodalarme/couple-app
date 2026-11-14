-- Partner messages: row level security, grants and policies.

alter table public.partner_messages enable row level security;
grant select, delete on public.partner_messages to authenticated;
create policy partner_messages_select_sender_or_recipient on public.partner_messages for select to authenticated
  using (sender_id = (select auth.uid()) or recipient_id = (select auth.uid()));
create policy partner_messages_delete_sender on public.partner_messages for delete to authenticated
  using (sender_id = (select auth.uid()));
