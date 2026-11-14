-- GraphQL surface: computed isMine and isShared fields.

-- Computed GraphQL fields `isMine` and `isShared` on the owner + optional couple tables, so clients stop
-- fetching the couple id and the user id just to derive them. Both run as the caller, so RLS and auth.uid() apply.

do $$
declare t text;
begin
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'decisions', 'gift_ideas', 'capsules',
    'cards', 'checkin_answers', 'question_answers'] loop
    execute format($f$
      create function public.is_shared(rec public.%1$I) returns boolean
      stable language sql set search_path = '' as
      $b$ select coalesce(rec.couple_id = private.current_couple_id(), false) $b$
    $f$, t);
    execute format('grant execute on function public.is_shared(public.%I) to authenticated', t);
    execute format($f$comment on function public.is_shared(public.%1$I) is e'@graphql({"description": "Whether the row is shared with the caller''s current partner. A row from a past couple is not shared."})'$f$, t);
  end loop;

  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'decisions', 'gift_ideas', 'capsules',
    'ritual_logs', 'list_items', 'decision_options',
    'cards', 'checkin_answers', 'game_answers', 'question_answers'] loop
    execute format($f$
      create function public.is_mine(rec public.%1$I) returns boolean
      stable language sql set search_path = '' as
      $b$ select rec.author_id = auth.uid() $b$
    $f$, t);
    execute format('grant execute on function public.is_mine(public.%I) to authenticated', t);
    execute format($f$comment on function public.is_mine(public.%1$I) is e'@graphql({"description": "Whether the caller wrote the row."})'$f$, t);
  end loop;
end $$;
