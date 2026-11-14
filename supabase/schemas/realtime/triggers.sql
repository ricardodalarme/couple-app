-- Realtime: broadcast triggers on shared tables.

do $$
declare t text; r record;
begin
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'decisions', 'gift_ideas', 'capsules',
    'question_answers', 'checkin_answers', 'couple_photos'] loop
    execute format('create trigger %I after insert or update or delete on public.%I for each row execute function private.broadcast_shared_change()', t || '_broadcast', t);
  end loop;
  for r in select * from (values ('ritual_logs', 'rituals', 'ritual_id'), ('list_items', 'lists', 'list_id'), ('decision_options', 'decisions', 'decision_id')) v (child, parent, fk) loop
    execute format('create trigger %I after insert or update or delete on public.%I for each row execute function private.broadcast_child_change(%L, %L)', r.child || '_broadcast', r.child, r.parent, r.fk);
  end loop;
end $$;

create trigger moods_broadcast after insert or update on public.moods
  for each row execute function private.broadcast_mood_change();
create trigger game_answers_broadcast after insert or update on public.game_answers
  for each row execute function private.broadcast_game_answer();
