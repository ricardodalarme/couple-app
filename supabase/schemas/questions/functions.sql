-- Couple questions and weekly check-in: functions.

create function private.answered_question(p_slug text) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.question_answers
                 where author_id = auth.uid() and question_slug = p_slug
                   and couple_id is not distinct from private.current_couple_id());
$$;
grant execute on function private.answered_question(text) to authenticated;

-- Has my partner answered? (True/false only, so Hoje can say "Ricardo já respondeu. Responda para ver.")
create function public.partner_answered(question_slug text) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.question_answers a
                 where a.author_id = private.partner_id() and a.couple_id = private.current_couple_id()
                   and a.question_slug = partner_answered.question_slug);
$$;

create function private.checkin_done(p_couple_id uuid, p_week date, p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select count(*) = 4 from public.checkin_answers
  where couple_id = p_couple_id and week_start = p_week and author_id = p_profile_id;
$$;
grant execute on function private.checkin_done(uuid, date, uuid) to authenticated;
