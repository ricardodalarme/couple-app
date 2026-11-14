-- Account: tables, indexes and constraints.

-- Consents (versioned history; the newest row per kind is the current answer) -------------------------
create table public.consents (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  kind public.consent_kind not null,
  granted boolean not null,
  version text not null check (char_length(version) between 1 and 20),
  created_at timestamptz not null default now()
);
create index consents_profile_idx on public.consents (profile_id, kind, created_at desc);

-- Account deletion: 14 days to change your mind, then everything goes --------------------------------
create table public.deletion_requests (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  requested_at timestamptz not null default now(),
  purge_after timestamptz not null
);

-- Files to remove from Storage after their owner is gone (drained by the storage-cleanup Edge Function).
create table private.storage_deletions (
  id bigint generated always as identity primary key,
  bucket text not null, path text not null, queued_at timestamptz not null default now(), done_at timestamptz
);

-- Safety: nothing is stored. Safe mode and the safety triage live only on the device (a test enforces it),
-- Safety content lives only on the device; there is no table or content kind for it.

-- Support ---------------------------------------------------------------------------------------------
create table private.support_requests (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid references public.profiles (id) on delete set null,
  topic public.support_topic not null,
  message text not null check (char_length(message) between 1 and 2000),
  reply_email text check (char_length(reply_email) <= 254),
  app_version text, created_at timestamptz not null default now()
);
create index support_requests_profile_idx on private.support_requests (profile_id);
