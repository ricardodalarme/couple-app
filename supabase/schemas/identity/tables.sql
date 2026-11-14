-- Identity: tables, indexes and constraints.

-- What a partner may see about a person.
create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text check (char_length(btrim(display_name)) between 1 and 60),
  avatar_path text check (char_length(avatar_path) <= 300),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

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

create trigger profiles_set_updated_at before update on public.profiles
  for each row execute function private.set_updated_at();
create trigger profile_settings_set_updated_at before update on public.profile_settings
  for each row execute function private.set_updated_at();

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

-- Profile extras ------------------------------------------------------------------------------------

alter table public.profiles add column avatar_kind public.avatar_kind not null default 'initials';
alter table public.profiles add column pronouns text check (char_length(pronouns) <= 30);
grant update (avatar_kind, pronouns) on public.profiles to authenticated;

alter table public.profile_settings
  add column goals text[] not null default '{}' check (goals <@ array['reconnect', 'fight_less', 'keep_romance', 'remember_dates', 'organize_routine', 'just_record']),
  add column together_since date,
  add column relationship_status public.relationship_status not null default 'together',
  add column app_paused_until timestamptz,
  add column holiday_countries text[] not null default '{BR}' check (cardinality(holiday_countries) <= 10),
  add column card_channel public.card_channel not null default 'link',
  add column card_theme text not null default 'paper' check (char_length(card_theme) <= 30),
  add column slips_default_for_card boolean not null default false,
  add column widget_allow_partner_notes boolean not null default false,
  add column widget_on_lock_screen boolean not null default false,
  add column widget_in_discreet boolean not null default false,
  add column widget_show_names boolean not null default false,
  add column spice_enabled boolean not null default false,
  add column low_stimulation boolean not null default false,
  add column chat_enabled boolean not null default false,
  add column chat_store_facts boolean not null default false,
  add column heavy_day_sharing public.heavy_day_sharing not null default 'off';
grant update (goals, together_since, relationship_status, app_paused_until, holiday_countries, card_channel, card_theme,
  slips_default_for_card, widget_allow_partner_notes, widget_on_lock_screen, widget_in_discreet, widget_show_names,
  spice_enabled, low_stimulation, chat_enabled, chat_store_facts, heavy_day_sharing) on public.profile_settings to authenticated;

-- Long distance (X-87): an optional city, and the partner's time zone for the two clocks. No location, ever.
alter table public.profiles add column city text check (char_length(city) <= 80);
grant update (city) on public.profiles to authenticated;
