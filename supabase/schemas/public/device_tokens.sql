create table public.device_tokens (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  token text not null unique check (char_length(token) between 8 and 512),
  platform text not null check (platform in ('android', 'ios', 'web')),
  app_version text check (app_version is null or char_length(app_version) <= 60),
  last_seen_at timestamptz not null default now(),
  invalidated_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index device_tokens_user_idx
on public.device_tokens (user_id)
where invalidated_at is null;

create index device_tokens_seen_idx
on public.device_tokens (last_seen_at);

alter table public.device_tokens enable row level security;

revoke all on table public.device_tokens from anon, authenticated;
grant all on table public.device_tokens to service_role;

create or replace function public.register_device_token(
  p_token text,
  p_platform text,
  p_app_version text default null
)
returns public.device_tokens
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid uuid := auth.uid();
  v_platform text := lower(coalesce(p_platform, ''));
  v_row public.device_tokens;
begin
  if v_uid is null then
    raise exception 'not_authenticated' using errcode = 'P0001';
  end if;
  if p_token is null or char_length(p_token) < 8 or char_length(p_token) > 512 then
    raise exception 'invalid_token' using errcode = 'P0001';
  end if;
  if v_platform not in ('android', 'ios', 'web') then
    raise exception 'invalid_platform' using errcode = 'P0001';
  end if;

  insert into public.device_tokens (user_id, token, platform, app_version)
  values (v_uid, p_token, v_platform, p_app_version)
  on conflict (token) do update
    set user_id = excluded.user_id,
        platform = excluded.platform,
        app_version = excluded.app_version,
        last_seen_at = now(),
        invalidated_at = null,
        updated_at = now()
  returning * into v_row;

  return v_row;
end;
$$;

create or replace function public.unregister_device_token(p_token text)
returns public.device_tokens
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid uuid := auth.uid();
  v_row public.device_tokens;
begin
  if v_uid is null then
    raise exception 'not_authenticated' using errcode = 'P0001';
  end if;

  update public.device_tokens
  set invalidated_at = now(),
      updated_at = now()
  where user_id = v_uid
    and token = p_token
    and invalidated_at is null
  returning * into v_row;

  return v_row;
end;
$$;

revoke all on function public.register_device_token(text, text, text) from public, anon;
grant execute on function public.register_device_token(text, text, text) to authenticated, service_role;

revoke all on function public.unregister_device_token(text) from public, anon;
grant execute on function public.unregister_device_token(text) to authenticated, service_role;
