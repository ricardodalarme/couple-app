-- Couple photo for the couple-photos widget: one row per couple, file in the private couple_photos bucket.
create table public.couple_photos (
  couple_id uuid primary key references public.couples (id) on delete cascade,
  storage_path text not null check (char_length(storage_path) <= 300)
    constraint couple_photos_storage_path_couple check (storage_path like couple_id::text || '/%'),
  uploaded_by uuid not null references public.profiles (id) on delete cascade,
  updated_at timestamptz not null default now()
);
comment on table public.couple_photos is e'@graphql({"description": "The photo a couple chose for their widget. Visible to the two members."})';

alter table public.couple_photos enable row level security;
grant select, insert, update, delete on public.couple_photos to authenticated;

create policy couple_photos_select_member on public.couple_photos for select to authenticated
  using (couple_id = (select private.current_couple_id()));
create policy couple_photos_insert_member on public.couple_photos for insert to authenticated
  with check (couple_id = (select private.current_couple_id()) and uploaded_by = (select auth.uid()));
create policy couple_photos_update_member on public.couple_photos for update to authenticated
  using (couple_id = (select private.current_couple_id()))
  with check (couple_id = (select private.current_couple_id()) and uploaded_by = (select auth.uid()));
create policy couple_photos_delete_member on public.couple_photos for delete to authenticated
  using (couple_id = (select private.current_couple_id()));

create trigger couple_photos_set_updated_at before update on public.couple_photos
  for each row execute function private.set_updated_at();

-- Private bucket; the first path folder is the couple id, so a foreign couple cannot read or write the file.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types) values
  ('couple_photos', 'couple_photos', false, 8388608, array['image/jpeg', 'image/png', 'image/webp', 'image/heic'])
on conflict (id) do nothing;

create policy couple_photos_storage_member_all on storage.objects for all to authenticated
  using (bucket_id = 'couple_photos' and (storage.foldername(name))[1] = (select private.current_couple_id())::text)
  with check (bucket_id = 'couple_photos' and (storage.foldername(name))[1] = (select private.current_couple_id())::text);
