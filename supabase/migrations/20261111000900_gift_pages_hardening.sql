-- Gift pages: separate wishes from dates ideas, keep writes inside the current couple,
-- and normalize shared wishes when the couple unpairs. (APP-062)
alter table public.gift_ideas
  add column kind text not null default 'idea' check (kind in ('idea', 'wish'));

drop policy gift_ideas_insert_own on public.gift_ideas;
create policy gift_ideas_insert_own on public.gift_ideas for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));

drop policy gift_ideas_update_own on public.gift_ideas;
create policy gift_ideas_update_own on public.gift_ideas for update to authenticated
  using (author_id = (select auth.uid()))
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));

create or replace function public.resolve_shared_items(keep boolean) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); t text;
begin
  if private.current_couple_id() is not null then raise exception 'STILL_PAIRED' using errcode = 'P0001'; end if;
  for t in select unnest(array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas',
    'important_dates', 'memories', 'story_events', 'lists', 'agreements', 'capsules', 'decisions', 'gift_ideas']) loop
    if keep then
      execute format('update public.%I set couple_id = null where author_id = $1 and couple_id is not null', t) using v_uid;
    else
      execute format('delete from public.%I where author_id = $1 and couple_id is not null', t) using v_uid;
    end if;
  end loop;
  return true;
end $$;
