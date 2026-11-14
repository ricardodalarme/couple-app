-- Decisions: functions.

-- Decide together: options ordered by the combined ranking, only once both partners have ranked every option.
create function public.decision_result(decision_id uuid) returns setof public.decision_options
language sql stable security definer set search_path = '' as $$
  select o.* from public.decision_options o
  join public.decisions d on d.id = o.decision_id
  where o.decision_id = decision_result.decision_id
    and (d.author_id = auth.uid() or d.couple_id = private.current_couple_id())
    and not exists (
      select 1 from public.decision_options o2 cross join (values (auth.uid()), (private.partner_id())) who (id)
      where o2.decision_id = d.id
        and not exists (select 1 from public.decision_ranks r where r.option_id = o2.id and r.author_id = who.id))
  order by (select sum(r.rank) from public.decision_ranks r where r.option_id = o.id), o.created_at;
$$;
