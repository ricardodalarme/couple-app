-- Wellbeing: functions.

-- Temperature "fight" expires after 24 hours (product rule): the current state for the caller.
create function public.current_temperature() returns public.temperature_checks
language sql stable security definer set search_path = '' as $$
  select t.* from public.temperature_checks t
  where t.author_id = auth.uid() and (t.level <> 'fight' or t.created_at > now() - interval '24 hours')
  order by t.created_at desc limit 1;
$$;

create function public.partner_mood_today() returns public.partner_mood
language sql stable security definer set search_path = '' as $$
  select m.id, m.day, m.mood, case when m.share = 'mood_need' then m.need end
  from public.moods m join public.profile_settings s on s.profile_id = m.author_id
  where m.author_id = private.partner_id() and m.share <> 'none' and m.day = (now() at time zone s.time_zone)::date;
$$;
