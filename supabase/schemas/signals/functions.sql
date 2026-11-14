-- Signals: functions.

create function public.send_signal(kind text, value text default null, body text default null) returns public.signals
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_row public.signals;
begin
  if v_partner is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if not private.hit_rate_limit('signal:' || v_uid, 30, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.signals (sender_id, recipient_id, kind, value, body)
  values (v_uid, v_partner, send_signal.kind::public.signal_kind, send_signal.value, nullif(btrim(send_signal.body), '')) returning * into v_row;
  perform private.enqueue_notification(v_partner, 'signal_' || v_row.kind, v_row.id, 'signal:' || v_row.id);
  perform private.signal('user:' || v_partner, 'signal');
  return v_row;
end $$;

-- Responses are never counted or scored; either answer is fine.
create function public.respond_to_signal(signal_id uuid, response text default null) returns public.signals
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.signals;
begin
  update public.signals s
  set seen_at = coalesce(s.seen_at, now()),
      response = coalesce(respond_to_signal.response::public.signal_response, s.response),
      responded_at = case when respond_to_signal.response is null then s.responded_at else now() end
  where s.id = signal_id and s.recipient_id = v_uid returning s.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if response is not null then perform private.signal('user:' || v_row.sender_id, 'signal_response'); end if;
  return v_row;
end $$;
