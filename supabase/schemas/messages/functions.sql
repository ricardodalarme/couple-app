-- Partner messages: functions.

create function public.send_partner_message(kind text, body text default null, media_path text default null, for_widget boolean default false)
returns public.partner_messages language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_row public.partner_messages;
begin
  if v_partner is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if not private.hit_rate_limit('partner_message:' || v_uid, 30, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  -- The widget shows a note only if the receiver allowed it; otherwise it is delivered in the app only.
  insert into public.partner_messages (sender_id, recipient_id, kind, body, media_path, for_widget)
  values (v_uid, v_partner, send_partner_message.kind::public.partner_message_kind, nullif(btrim(send_partner_message.body), ''), send_partner_message.media_path,
          coalesce(send_partner_message.for_widget, false)
            and coalesce((select widget_allow_partner_notes from public.profile_settings where profile_id = v_partner), false))
  returning * into v_row;
  perform private.enqueue_notification(v_partner, 'partner_message', v_row.id, 'partner_message:' || v_row.id);
  perform private.signal('user:' || v_partner, 'partner_message');
  return v_row;
end $$;

create function public.mark_partner_message(message_id uuid, hearted boolean default false) returns public.partner_messages
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.partner_messages;
begin
  update public.partner_messages m
  set seen_at = coalesce(m.seen_at, now()), hearted_at = case when hearted then coalesce(m.hearted_at, now()) else m.hearted_at end
  where m.id = message_id and m.recipient_id = v_uid returning m.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $$;

-- The sender can take back a note or drawing.
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
