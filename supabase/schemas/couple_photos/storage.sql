-- Couple photos: private bucket and its storage policy.

-- Private bucket; the first path folder is the couple id, so a foreign couple cannot read or write the file.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types) values
  ('couple_photos', 'couple_photos', false, 8388608, array['image/jpeg', 'image/png', 'image/webp', 'image/heic'])
on conflict (id) do nothing;

create policy couple_photos_storage_member_all on storage.objects for all to authenticated
  using (bucket_id = 'couple_photos' and (storage.foldername(name))[1] = (select private.current_couple_id())::text)
  with check (bucket_id = 'couple_photos' and (storage.foldername(name))[1] = (select private.current_couple_id())::text);
