-- Couple questions and weekly check-in: row level security, grants and policies.

alter table public.question_answers enable row level security;
grant select, insert, delete on public.question_answers to authenticated;

create policy question_answers_select_own_or_revealed on public.question_answers for select to authenticated
  using (author_id = (select auth.uid())
         or (author_id = (select private.partner_id()) and couple_id = (select private.current_couple_id())
             and private.answered_question(question_slug)));
create policy question_answers_insert_own on public.question_answers for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy question_answers_delete_own on public.question_answers for delete to authenticated
  using (author_id = (select auth.uid()));

alter table public.checkin_answers enable row level security;
grant select, insert, update, delete on public.checkin_answers to authenticated;

create policy checkin_answers_select_own_or_both_done on public.checkin_answers for select to authenticated
  using (author_id = (select auth.uid())
         or (couple_id = (select private.current_couple_id())
             and private.checkin_done(couple_id, week_start, (select auth.uid()))
             and private.checkin_done(couple_id, week_start, author_id)));
create policy checkin_answers_insert_own on public.checkin_answers for insert to authenticated
  with check (author_id = (select auth.uid()) and couple_id = (select private.current_couple_id()));
create policy checkin_answers_update_own on public.checkin_answers for update to authenticated
  using (author_id = (select auth.uid())) with check (author_id = (select auth.uid()) and couple_id = (select private.current_couple_id()));
create policy checkin_answers_delete_own on public.checkin_answers for delete to authenticated
  using (author_id = (select auth.uid()));
