-- Home: views.

-- Hoje ----------------------------------------------------------------------------------------------
create view public.today_state with (security_invoker = true) as
  select p.id as profile_id, false as is_paired, null::text as partner_name, null::date as local_date,
         null::uuid as card_id, null::text as card_status, 0 as unopened_cards, 0 as slips_this_week,
         0 as slips_total, false as has_pending_invite, null::text as suggestion_key
  from public.profiles p where false;
comment on view public.today_state is e'@graphql({"primary_key_columns": ["profile_id"], "description": "Everything Hoje needs in one call. suggestion_key: pause, first_slip, open_card, repair, review_card, invite_partner, write_slip."})';
grant select on public.today_state to authenticated;

-- Hoje v2 and the widget summary -----------------------------------------------------------------------
create or replace view public.today_state with (security_invoker = true) as
  select p.id as profile_id, false as is_paired, null::text as partner_name, null::date as local_date,
         null::uuid as card_id, null::text as card_status, 0 as unopened_cards, 0 as slips_this_week,
         0 as slips_total, false as has_pending_invite, null::text as suggestion_key,
         null::date as together_since, null::uuid as pause_id, false as pause_is_mine, null::timestamptz as pause_return_at,
         null::text as pause_message, null::text as temperature, null::uuid as next_date_id, null::text as next_date_title,
         null::date as next_date_on, 0 as unseen_signals, false as has_plus, false as deletion_pending,
         null::text as relationship_status, null::date[] as slip_days
  from public.profiles p where false;

-- Widgets: counters and dates only. In discreet mode (unless the person opted in) nothing with names or text.
create view public.widget_state with (security_invoker = true) as
  select p.id as profile_id, false as discreet, false as is_paired, null::date as together_since, null::text as partner_name,
         null::text as next_date_title, null::date as next_date_on, 0 as unopened_cards, null::timestamptz as pause_return_at,
         null::text as partner_note, null::text as partner_note_media, null::timestamptz as partner_note_at, null::text as partner_mood
  from public.profiles p where false;
grant select on public.widget_state to authenticated;

-- Year in review: counts only, never scores or comparisons.
create view public.year_recap with (security_invoker = true) as
  select p.id as profile_id, 0 as year, 0 as slips, 0 as cards_sent, 0 as cards_received, 0 as memories, 0 as firsts, 0 as rituals_done
  from public.profiles p where false;
grant select on public.year_recap to authenticated;

-- Timeline: one list for Memórias, each row already respecting who may see it ------------------------
create view public.timeline_items with (security_invoker = true) as
  select m.id, 'memory'::text as kind, m.title, m.happened_on as day, m.author_id, m.couple_id is not null as shared, m.photo_path
  from public.memories m
  union all
  select s.id, 'slip', s.body, (s.created_at)::date, s.author_id, false, s.photo_path
  from public.slips s where s.deleted_at is null and s.archived_at is null
  union all
  select c.id, case when c.author_id = auth.uid() then 'card_sent' else 'card_received' end, c.note, (c.sent_at)::date, c.author_id, true, null
  from public.cards c where c.status = 'sent'
  union all
  select e.id, 'story', coalesce(e.title, e.kind::text), e.happened_on, e.author_id, e.couple_id is not null, null
  from public.story_events e
  union all
  select d.id, 'first', d.title, make_date(d.year, d.month, least(d.day, 28)), d.author_id, d.couple_id is not null, null
  from public.important_dates d where d.kind = 'first' and d.year is not null and not d.hidden;
grant select on public.timeline_items to authenticated;
