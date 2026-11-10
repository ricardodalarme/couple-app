-- Fixes found by running the suite on the real local Supabase stack.

-- "Today" for daily rows is the author's local date, not the database's UTC date.
-- The column defaults used current_date (UTC), so a mood saved at 23:00 in Sao Paulo landed on tomorrow and the
-- partner could not see it. A trigger now fills the date from the author's time zone when the client sends none.
create function private.set_local_date() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_tz text; v_day date;
begin
  if to_jsonb(new) ->> tg_argv[0] is null then
    select s.time_zone into v_tz from public.profile_settings s where s.profile_id = new.author_id;
    v_day := (now() at time zone coalesce(v_tz, 'America/Sao_Paulo'))::date;
    new := jsonb_populate_record(new, jsonb_build_object(tg_argv[0], v_day));
  end if;
  return new;
end $$;

alter table public.moods alter column day drop default;
alter table public.idea_responses alter column day drop default;
alter table public.ritual_logs alter column done_on drop default;
alter table public.journal_entries alter column entry_date drop default;
alter table public.memories alter column happened_on drop default;

create trigger moods_local_date before insert on public.moods
  for each row execute function private.set_local_date('day');
create trigger idea_responses_local_date before insert on public.idea_responses
  for each row execute function private.set_local_date('day');
create trigger ritual_logs_local_date before insert on public.ritual_logs
  for each row execute function private.set_local_date('done_on');
create trigger journal_entries_local_date before insert on public.journal_entries
  for each row execute function private.set_local_date('entry_date');
create trigger memories_local_date before insert on public.memories
  for each row execute function private.set_local_date('happened_on');

-- Same behaviour, written so the plpgsql linter can resolve the table name.
create or replace function public.resolve_shared_items(keep boolean) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); t text;
begin
  if private.current_couple_id() is not null then raise exception 'STILL_PAIRED' using errcode = 'P0001'; end if;
  for t in select unnest(array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas',
    'important_dates', 'memories', 'story_events', 'lists', 'agreements', 'capsules', 'decisions']) loop
    if keep then
      execute format('update public.%I set couple_id = null where author_id = $1 and couple_id is not null', t) using v_uid;
    else
      execute format('delete from public.%I where author_id = $1 and couple_id is not null', t) using v_uid;
    end if;
  end loop;
  return true;
end $$;
