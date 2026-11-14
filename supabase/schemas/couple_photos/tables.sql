-- Couple photos: tables, indexes and constraints.

-- Couple photo for the couple-photos widget: one row per couple, file in the private couple_photos bucket.
create table public.couple_photos (
  couple_id uuid primary key references public.couples (id) on delete cascade,
  storage_path text not null check (char_length(storage_path) <= 300)
    constraint couple_photos_storage_path_couple check (storage_path like couple_id::text || '/%'),
  uploaded_by uuid not null references public.profiles (id) on delete cascade,
  updated_at timestamptz not null default now()
);

create index if not exists couple_photos_uploaded_by_idx on public.couple_photos (uploaded_by);

create trigger couple_photos_set_updated_at before update on public.couple_photos
  for each row execute function private.set_updated_at();
