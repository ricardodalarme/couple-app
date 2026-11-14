-- Hoje needs the days of the week that already have a slip, not the rows themselves.
-- The view gains `slip_days` (appended, so `create or replace` stays valid) and `today()` fills it for the caller's
-- time zone, which removes the client's `slipsCollection(first: 50)` read.

create or replace view public.today_state with (security_invoker = true) as
  select p.id as profile_id, false as is_paired, null::text as partner_name, null::date as local_date,
         null::uuid as card_id, null::text as card_status, 0 as unopened_cards, 0 as slips_this_week,
         0 as slips_total, false as has_pending_invite, null::text as suggestion_key,
         null::date as together_since, null::uuid as pause_id, false as pause_is_mine, null::timestamptz as pause_return_at,
         null::text as pause_message, null::text as temperature, null::uuid as next_date_id, null::text as next_date_title,
         null::date as next_date_on, 0 as unseen_signals, false as has_plus, false as deletion_pending,
         null::text as relationship_status, null::date[] as slip_days
  from public.profiles p where false;

create or replace function public.today() returns public.today_state
language plpgsql stable security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_s public.profile_settings; v_week date; v_partner uuid; v_pause public.pauses; r public.today_state;
begin
  select * into v_s from public.profile_settings where profile_id = v_uid;
  v_s.time_zone := coalesce(v_s.time_zone, 'America/Sao_Paulo');
  v_week := date_trunc('week', now() at time zone v_s.time_zone)::date;
  v_partner := private.partner_id();
  r.profile_id := v_uid;
  r.local_date := (now() at time zone v_s.time_zone)::date;
  r.is_paired := v_partner is not null;
  r.partner_name := coalesce((select display_name from public.profiles where id = v_partner), v_s.partner_name);
  r.together_since := v_s.together_since;
  r.relationship_status := v_s.relationship_status::text;
  select c.id, c.status::text into r.card_id, r.card_status
  from public.cards c where c.author_id = v_uid and c.week_start = v_week and c.kind = 'weekly' and c.deleted_at is null;
  r.unopened_cards := (select count(*) from public.cards c
                       where c.recipient_id = v_uid and c.status = 'sent' and c.deleted_at is null
                         and not exists (select 1 from public.card_opens o where o.card_id = c.id));
  select count(*) filter (where (s.created_at at time zone v_s.time_zone)::date >= v_week), count(*)
  into r.slips_this_week, r.slips_total
  from public.slips s where s.author_id = v_uid and s.deleted_at is null;
  r.slip_days := (select array_agg(distinct (s.created_at at time zone v_s.time_zone)::date)
                  from public.slips s
                  where s.author_id = v_uid and s.deleted_at is null
                    and (s.created_at at time zone v_s.time_zone)::date >= v_week);
  r.has_pending_invite := exists (select 1 from public.invites i
    where i.created_by = v_uid and i.used_at is null and i.cancelled_at is null and i.expires_at > now());
  select * into v_pause from public.active_pause();
  r.pause_id := v_pause.id; r.pause_is_mine := coalesce(v_pause.started_by = v_uid, false);
  r.pause_return_at := v_pause.return_at; r.pause_message := v_pause.message;
  r.temperature := (select level from public.current_temperature());
  select d.id, d.title, private.next_occurrence(d.month, d.day, r.local_date)
  into r.next_date_id, r.next_date_title, r.next_date_on
  from public.important_dates d
  where not d.hidden and (d.author_id = v_uid or d.couple_id = private.current_couple_id())
  order by private.next_occurrence(d.month, d.day, r.local_date) limit 1;
  r.unseen_signals := (select count(*) from public.signals g where g.recipient_id = v_uid and g.seen_at is null);
  r.has_plus := private.has_plus(v_uid);
  r.deletion_pending := exists (select 1 from public.deletion_requests where profile_id = v_uid);
  r.suggestion_key := case
    when r.pause_id is not null then 'pause'
    when r.slips_total = 0 then 'first_slip'
    when r.unopened_cards > 0 then 'open_card'
    when r.temperature = 'fight' then 'repair'
    when r.card_status = 'draft' then 'review_card'
    when not r.is_paired and not r.has_pending_invite then 'invite_partner'
    else 'write_slip' end;
  return r;
end $$;
