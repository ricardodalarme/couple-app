-- Plus: tables, indexes and constraints.

-- Entitlements --------------------------------------------------------------------------------------
create table public.entitlements (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  plan public.entitlement_plan not null,
  status public.entitlement_status not null,
  expires_at timestamptz,
  will_renew boolean not null default true,
  store public.entitlement_store,
  updated_at timestamptz not null default now()
);

create table private.purchase_events (
  event_id text primary key,
  profile_id uuid references public.profiles (id) on delete set null,
  type text not null,
  event_at timestamptz not null,
  received_at timestamptz not null default now()
);
create index purchase_events_profile_idx on private.purchase_events (profile_id);
