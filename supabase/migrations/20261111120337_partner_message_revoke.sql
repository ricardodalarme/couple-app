grant delete on public.partner_messages to authenticated;

create policy partner_messages_delete_sender on public.partner_messages for delete to authenticated
  using (sender_id = (select auth.uid()));
