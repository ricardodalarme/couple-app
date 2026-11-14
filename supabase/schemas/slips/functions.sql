-- Slips: functions.

-- Idempotent create-or-update keyed by the client-generated id (offline-first).
create function public.save_slip(
  id uuid, body text, kind text default 'quick', feeling text default null, plan_note text default null,
  tags text[] default '{}', for_card boolean default true, occurred_on date default null,
  photo_path text default null, created_at timestamptz default null
) returns public.slips
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_kind public.slip_kind;
  v_row public.slips;
begin
  begin
    v_kind := kind::public.slip_kind;
  exception when invalid_text_representation then
    raise exception 'INVALID_SLIP_KIND' using errcode = 'P0001';
  end;
  insert into public.slips as s (id, author_id, kind, body, feeling, plan_note, tags, for_card, occurred_on, photo_path, created_at)
  values (save_slip.id, v_uid, v_kind, btrim(save_slip.body), nullif(btrim(save_slip.feeling), ''),
          nullif(btrim(save_slip.plan_note), ''), coalesce(save_slip.tags, '{}'),
          coalesce(save_slip.for_card, true) and v_kind <> 'invisible', save_slip.occurred_on, save_slip.photo_path,
          least(coalesce(save_slip.created_at, now()), now()))
  on conflict on constraint slips_pkey do update
    set kind = excluded.kind, body = excluded.body, feeling = excluded.feeling, plan_note = excluded.plan_note,
        tags = excluded.tags, for_card = excluded.for_card, occurred_on = excluded.occurred_on,
        photo_path = excluded.photo_path
    where s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then
    raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001';
  end if;
  return v_row;
end $$;

create function public.archive_slip(id uuid, archived boolean default true) returns public.slips
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.slips;
begin
  update public.slips s set archived_at = case when archived then coalesce(s.archived_at, now()) end
  where s.id = archive_slip.id and s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then
    raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001';
  end if;
  return v_row;
end $$;

-- Soft delete (tombstone so other devices of the author can sync). Idempotent.
create function public.delete_slip(id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  update public.slips s set deleted_at = coalesce(s.deleted_at, now()), body = '[deleted]', feeling = null,
    plan_note = null, tags = '{}', photo_path = null
  where s.id = delete_slip.id and s.author_id = v_uid;
  return found;
end $$;
grant execute on function public.save_slip(uuid, text, text, text, text, text[], boolean, date, text, timestamptz),
  public.archive_slip(uuid, boolean), public.delete_slip(uuid) to authenticated;

create function public.set_slip_details(id uuid, category text default null, work_area text default null, in_jar boolean default null)
returns public.slips language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.slips;
begin
  update public.slips s
  set category = coalesce(set_slip_details.category::public.slip_category, s.category),
      work_area = coalesce(set_slip_details.work_area::public.work_area, s.work_area),
      in_jar = coalesce(set_slip_details.in_jar, s.in_jar)
  where s.id = set_slip_details.id and s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $$;

-- "Potinho do dia ruim": one random saved slip, only ever the author's own.
create function public.draw_from_jar() returns public.slips
language sql volatile security definer set search_path = '' as $$
  select s.* from public.slips s
  where s.author_id = auth.uid() and s.in_jar and s.deleted_at is null
  order by random() limit 1;
$$;
grant execute on function public.set_slip_details(uuid, text, text, boolean), public.draw_from_jar() to authenticated;
