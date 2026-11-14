-- Notifications: tables, indexes and constraints.

-- Devices -------------------------------------------------------------------------------------------
create table public.devices (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.profiles (id) on delete cascade,
  token text not null unique check (char_length(token) between 10 and 4096),
  platform public.device_platform not null,
  label text check (char_length(label) <= 80),
  failure_count integer not null default 0,
  created_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now()
);
create index devices_profile_id_idx on public.devices (profile_id);

-- Preferences ---------------------------------------------------------------------------------------
create table public.notification_settings (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  enabled boolean not null default true,
  discreet boolean not null default false,
  card_day smallint not null default 0 check (card_day between 0 and 6),
  card_hour smallint not null default 9 check (card_hour between 0 and 23),
  muted_types text[] not null default '{}',
  updated_at timestamptz not null default now()
);
create trigger notification_settings_set_updated_at before update on public.notification_settings
  for each row execute function private.set_updated_at();

-- Outbox --------------------------------------------------------------------------------------------
-- type keys: card_ready, card_received, card_reaction, partner_joined, daily_reminder (more per slice).
create table private.notification_outbox (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.profiles (id) on delete cascade,
  type text not null,
  ref_id uuid,
  dedupe_key text unique,
  send_after timestamptz not null default now(),
  sent_at timestamptz,
  outcome text,
  attempts integer not null default 0,
  created_at timestamptz not null default now()
);
create index notification_outbox_due_idx on private.notification_outbox (send_after) where sent_at is null;
create index notification_outbox_profile_idx on private.notification_outbox (profile_id);
create index notification_outbox_sent_idx on private.notification_outbox (profile_id, sent_at) where outcome = 'sent';

alter table public.notification_settings add column daily_max smallint not null default 2 check (daily_max between 0 and 2);
grant update (daily_max) on public.notification_settings to authenticated;

-- The designs show the weekly card leaving on Sunday at 18:00.
alter table public.notification_settings alter column card_hour set default 18;
