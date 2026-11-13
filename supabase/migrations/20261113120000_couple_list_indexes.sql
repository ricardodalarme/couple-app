-- Shared lists are read by couple and ordered by newest first; the single-column
-- couple indexes left the sort to the planner.
do $$
declare t text;
begin
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas',
    'important_dates', 'memories', 'story_events', 'lists', 'agreements', 'decisions'] loop
    execute format('create index if not exists %I on public.%I (couple_id, created_at desc)', t || '_couple_created_idx', t);
  end loop;
end $$;

create index if not exists gift_ideas_couple_created_idx on public.gift_ideas (couple_id, created_at desc);

-- Unread signals are counted per recipient on every Today load.
create index if not exists signals_recipient_unseen_idx on public.signals (recipient_id) where seen_at is null;

-- The daily cap counts only delivered notifications in the last 24 hours.
create index if not exists notification_outbox_sent_idx
  on private.notification_outbox (profile_id, sent_at) where outcome = 'sent';
