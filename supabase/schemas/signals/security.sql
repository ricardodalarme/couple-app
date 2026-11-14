-- Signals: row level security, grants and policies.

alter table public.signals enable row level security;
grant select on public.signals to authenticated;
create policy signals_select_sender_or_recipient on public.signals for select to authenticated
  using (sender_id = (select auth.uid()) or recipient_id = (select auth.uid()));
