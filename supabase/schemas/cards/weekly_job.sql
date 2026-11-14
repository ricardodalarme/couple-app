-- Cards: the hourly job that creates weekly drafts.

-- Honours each person's chosen day and hour, and announces the draft.
create function private.generate_weekly_cards() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_profile uuid; v_card uuid; v_count integer := 0;
begin
  for v_profile in
    select s.profile_id
    from public.profile_settings s join public.notification_settings n on n.profile_id = s.profile_id
    where extract(dow from now() at time zone s.time_zone) = n.card_day
      and extract(hour from now() at time zone s.time_zone) >= n.card_hour
      and not exists (select 1 from public.cards c
                      where c.author_id = s.profile_id and c.kind = 'weekly'
                        and c.week_start = date_trunc('week', now() at time zone s.time_zone)::date)
  loop
    v_card := private.build_card_draft(v_profile);
    if v_card is not null then
      v_count := v_count + 1;
      perform private.enqueue_notification(v_profile, 'card_ready', v_card, 'card_ready:' || v_card);
    end if;
  end loop;
  return v_count;
end $$;
