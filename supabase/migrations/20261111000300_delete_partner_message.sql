-- The sender can take back a note or drawing: the row goes, so it leaves the partner's widget on its
-- next refresh. The app removes the drawing file through the Storage API (never by deleting
-- storage rows from SQL).

create function public.delete_partner_message(message_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_recipient uuid;
begin
  delete from public.partner_messages m
  where m.id = delete_partner_message.message_id and m.sender_id = v_uid
  returning m.recipient_id into v_recipient;
  if not found then return false; end if;
  perform private.signal('user:' || v_recipient, 'partner_message');
  return true;
end $$;
grant execute on function public.delete_partner_message(uuid) to authenticated;
