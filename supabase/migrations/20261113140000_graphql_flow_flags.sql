-- Computed `isMine` / `isShared` on the flow tables that still made the client derive them from ids.
-- Mirrors supabase/schemas/public/graphql_computed_fields.sql; both run as the caller.

do $$
declare t text;
begin
  foreach t in array array['cards', 'checkin_answers', 'question_answers'] loop
    execute format($f$
      create function public.is_shared(rec public.%1$I) returns boolean
      stable language sql set search_path = '' as
      $b$ select coalesce(rec.couple_id = private.current_couple_id(), false) $b$
    $f$, t);
    execute format('grant execute on function public.is_shared(public.%I) to authenticated', t);
    execute format($f$comment on function public.is_shared(public.%1$I) is e'@graphql({"description": "Whether the row is shared with the caller''s current partner. A row from a past couple is not shared."})'$f$, t);
  end loop;

  foreach t in array array['cards', 'checkin_answers', 'game_answers', 'question_answers'] loop
    execute format($f$
      create function public.is_mine(rec public.%1$I) returns boolean
      stable language sql set search_path = '' as
      $b$ select rec.author_id = auth.uid() $b$
    $f$, t);
    execute format('grant execute on function public.is_mine(public.%I) to authenticated', t);
    execute format($f$comment on function public.is_mine(public.%1$I) is e'@graphql({"description": "Whether the caller wrote the row."})'$f$, t);
  end loop;
end $$;
