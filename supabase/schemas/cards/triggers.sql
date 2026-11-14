-- Cards: trigger functions and triggers.

-- A deleted slip leaves unsent cards; sent cards keep their frozen copy.
create function private.drop_deleted_slip_from_drafts() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  delete from public.card_items i using public.cards c
  where i.slip_id = new.id and c.id = i.card_id and c.status <> 'sent';
  return new;
end $$;
create trigger slips_deleted_leave_drafts after update of deleted_at on public.slips
  for each row when (new.deleted_at is not null and old.deleted_at is null)
  execute function private.drop_deleted_slip_from_drafts();
