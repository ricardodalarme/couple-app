-- Declarative source of truth. Mirrors migration 20261110000200_identity.sql; edit both together when Docker/pg-delta is unavailable.
-- Identity: profiles, settings, couples, membership, invites and pairing. (BE-002, BE-003, BE-005, BE-006)
create type public.app_theme as enum ('rosa', 'azul', 'neutro');
create type public.relationship_goal as enum ('keep', 'reconnect', 'after_fight');
create type public.relationship_phase as enum ('beginning', 'dating', 'living_together', 'married', 'with_kids', 'long_distance');
create type public.member_role as enum ('inviter', 'invitee');

-- What a partner may see about a person.
create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text check (char_length(btrim(display_name)) between 1 and 60),
  avatar_path text check (char_length(avatar_path) <= 300),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.profiles is e'@graphql({"description": "Public part of a person: visible to the person and to the current partner."})';

-- What only the person sees.
create table public.profile_settings (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  theme public.app_theme not null default 'neutro',
  locale text not null default 'pt-BR' check (locale in ('pt-BR', 'en')),
  time_zone text not null default 'America/Sao_Paulo' check (private.is_valid_time_zone(time_zone)),
  goal public.relationship_goal,
  phase public.relationship_phase,
  partner_name text check (char_length(btrim(partner_name)) between 1 and 60),
  onboarded_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  share_read_receipts boolean not null default false
);
comment on table public.profile_settings is e'@graphql({"description": "Private settings of a person. Never visible to the partner."})';

create table public.couples (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  archived_at timestamptz,
  touch_topics_enabled boolean not null default true
);

create table public.couple_members (
  couple_id uuid not null references public.couples (id) on delete cascade,
  profile_id uuid not null references public.profiles (id) on delete cascade,
  role public.member_role not null,
  joined_at timestamptz not null default now(),
  left_at timestamptz,
  primary key (couple_id, profile_id)
);
create unique index couple_members_one_active_couple on public.couple_members (profile_id) where left_at is null;
create index couple_members_profile_id_idx on public.couple_members (profile_id);
comment on constraint couple_members_profile_id_fkey on public.couple_members is e'@graphql({"foreign_name": "profile", "local_name": "memberships"})';
comment on constraint couple_members_couple_id_fkey on public.couple_members is e'@graphql({"foreign_name": "couple", "local_name": "members"})';

create function private.enforce_couple_size() returns trigger
language plpgsql set search_path = '' as $$
begin
  perform 1 from public.couples where id = new.couple_id for update;
  if (select count(*) from public.couple_members where couple_id = new.couple_id and left_at is null) >= 2 then
    raise exception 'COUPLE_FULL' using errcode = '23514';
  end if;
  return new;
end $$;
create trigger couple_members_max_two before insert on public.couple_members
  for each row execute function private.enforce_couple_size();

create trigger profiles_set_updated_at before update on public.profiles
  for each row execute function private.set_updated_at();
create trigger profile_settings_set_updated_at before update on public.profile_settings
  for each row execute function private.set_updated_at();

-- Membership helpers used by every policy. Security definer so policies do not recurse into RLS.
create function private.current_couple_id() returns uuid
language sql stable security definer set search_path = '' as $$
  select couple_id from public.couple_members where profile_id = auth.uid() and left_at is null;
$$;
create function private.is_couple_member(p_couple_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.couple_members
    where couple_id = p_couple_id and profile_id = auth.uid() and left_at is null);
$$;
create function private.partner_id() returns uuid
language sql stable security definer set search_path = '' as $$
  select other.profile_id
  from public.couple_members me
  join public.couple_members other on other.couple_id = me.couple_id and other.profile_id <> me.profile_id
  where me.profile_id = auth.uid() and me.left_at is null and other.left_at is null;
$$;
grant execute on function private.current_couple_id(), private.is_couple_member(uuid), private.partner_id() to authenticated;

alter table public.profiles enable row level security;
alter table public.profile_settings enable row level security;
alter table public.couples enable row level security;
alter table public.couple_members enable row level security;

grant select on public.profiles, public.profile_settings, public.couples, public.couple_members to authenticated;
grant update (display_name, avatar_path) on public.profiles to authenticated;
grant update (theme, locale, time_zone, goal, phase, partner_name, onboarded_at, share_read_receipts) on public.profile_settings to authenticated;

create policy profiles_select_self_or_partner on public.profiles for select to authenticated
  using (id = (select auth.uid()) or id = (select private.partner_id()));
create policy profiles_update_self on public.profiles for update to authenticated
  using (id = (select auth.uid())) with check (id = (select auth.uid()));
create policy profile_settings_select_self on public.profile_settings for select to authenticated
  using (profile_id = (select auth.uid()));
create policy profile_settings_update_self on public.profile_settings for update to authenticated
  using (profile_id = (select auth.uid())) with check (profile_id = (select auth.uid()));
create policy couples_select_member on public.couples for select to authenticated
  using (id = (select private.current_couple_id()));
create policy couple_members_select_member on public.couple_members for select to authenticated
  using (left_at is null and couple_id = (select private.current_couple_id()));

create function private.handle_new_user() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  perform private.bootstrap_profile(
    new.id, coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name'));
  return new;
end $$;
create trigger on_auth_user_created after insert on auth.users
  for each row execute function private.handle_new_user();

-- Self-healing: the app calls this once after sign-in; creates the rows if the trigger ever failed.
create function public.ensure_profile() returns public.profiles
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.profiles;
begin
  perform private.bootstrap_profile(v_uid, null);
  select * into v_row from public.profiles where id = v_uid;
  return v_row;
end $$;

create function public.my_profile() returns public.profiles
language sql stable set search_path = '' as $$
  select * from public.profiles where id = auth.uid();
$$;
create function public.my_settings() returns public.profile_settings
language sql stable set search_path = '' as $$
  select * from public.profile_settings where profile_id = auth.uid();
$$;
create function public.my_couple() returns public.couples
language sql stable set search_path = '' as $$
  select * from public.couples where id = private.current_couple_id();
$$;
create function public.my_partner() returns public.profiles
language sql stable set search_path = '' as $$
  select * from public.profiles where id = private.partner_id();
$$;
grant execute on function public.ensure_profile(), public.my_profile(), public.my_settings(), public.my_couple(), public.my_partner() to authenticated;

-- Invites. Only a hash of the code is stored.
create table public.invites (
  id uuid primary key default gen_random_uuid(),
  created_by uuid not null references public.profiles (id) on delete cascade,
  code_hash bytea not null unique,
  expires_at timestamptz not null,
  used_at timestamptz,
  used_by uuid references public.profiles (id) on delete set null,
  cancelled_at timestamptz,
  created_at timestamptz not null default now()
);
create index invites_created_by_idx on public.invites (created_by);
create index invites_used_by_idx on public.invites (used_by);
alter table public.invites enable row level security;
grant select (id, created_by, expires_at, used_at, cancelled_at, created_at) on public.invites to authenticated;
create policy invites_select_creator on public.invites for select to authenticated
  using (created_by = (select auth.uid()));

-- Return shape of create_invite: the plain code exists only in this response.
create view public.invite_created with (security_invoker = true) as
  select id, null::text as code, expires_at from public.invites where false;
comment on view public.invite_created is e'@graphql({"primary_key_columns": ["id"], "description": "Result of createInvite. The code is shown once and never stored."})';
grant select on public.invite_created to authenticated;

create function private.hash_invite_code(p_code text) returns bytea
language sql immutable set search_path = '' as $$
  select extensions.digest(upper(regexp_replace(coalesce(p_code, ''), '[^A-Za-z0-9]', '', 'g')), 'sha256');
$$;

create function public.create_invite() returns public.invite_created
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_alphabet constant text := 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
  v_code text := '';
  v_bytes bytea := extensions.gen_random_bytes(8);
  v_row public.invite_created;
begin
  if private.current_couple_id() is not null then
    raise exception 'ALREADY_PAIRED' using errcode = 'P0001';
  end if;
  if not private.hit_rate_limit('create_invite:' || v_uid, 10, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  for i in 0..7 loop
    v_code := v_code || substr(v_alphabet, 1 + get_byte(v_bytes, i) % length(v_alphabet), 1);
  end loop;
  update public.invites set cancelled_at = now()
  where created_by = v_uid and used_at is null and cancelled_at is null;
  insert into public.invites (created_by, code_hash, expires_at)
  values (v_uid, private.hash_invite_code(v_code), now() + interval '7 days')
  returning id, v_code, expires_at into v_row;
  return v_row;
end $$;

-- Returns the couple on success and NULL for any invalid code (expired, used, cancelled, own, unknown,
-- or either side already paired): one generic answer, no enumeration. Failed attempts are counted.
create function public.accept_invite(code text) returns public.couples
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_invite public.invites;
  v_couple public.couples;
begin
  if not private.hit_rate_limit('accept_invite:' || v_uid, 10, interval '1 hour') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  select * into v_invite from public.invites where code_hash = private.hash_invite_code(code) for update;
  if not found or v_invite.cancelled_at is not null or v_invite.created_by = v_uid then
    return null;
  end if;
  if v_invite.used_at is not null then
    -- Retry after a dropped response: same person, still paired with the inviter.
    if v_invite.used_by = v_uid then
      select c.* into v_couple from public.couples c
      where c.id = private.current_couple_id()
        and exists (select 1 from public.couple_members m
                    where m.couple_id = c.id and m.profile_id = v_invite.created_by and m.left_at is null);
      return v_couple;
    end if;
    return null;
  end if;
  if v_invite.expires_at <= now()
     or private.current_couple_id() is not null
     or exists (select 1 from public.couple_members where profile_id = v_invite.created_by and left_at is null) then
    return null;
  end if;
  insert into public.couples default values returning * into v_couple;
  insert into public.couple_members (couple_id, profile_id, role)
  values (v_couple.id, v_invite.created_by, 'inviter'), (v_couple.id, v_uid, 'invitee');
  update public.question_answers set couple_id = v_couple.id
  where author_id in (v_invite.created_by, v_uid) and couple_id is null;
  update public.invites set used_at = now(), used_by = v_uid where id = v_invite.id;
  return v_couple;
end $$;

create function public.cancel_invite(invite_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  update public.invites set cancelled_at = now()
  where id = invite_id and created_by = v_uid and used_at is null and cancelled_at is null;
  return found;
end $$;

-- Ends the shared space for both. Private data of each person is untouched; shared rows become unreachable.
create function public.unpair() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_couple_id uuid := private.current_couple_id();
begin
  if v_couple_id is null then
    return false;
  end if;
  insert into private.storage_deletions (bucket, path)
  select 'couple_photos', storage_path from public.couple_photos where couple_id = v_couple_id;
  delete from public.couple_photos where couple_id = v_couple_id;
  update public.couple_members set left_at = now() where couple_id = v_couple_id and left_at is null;
  update public.couples set archived_at = now() where id = v_couple_id;
  return true;
end $$;
grant execute on function public.create_invite(), public.accept_invite(text), public.cancel_invite(uuid), public.unpair() to authenticated;
