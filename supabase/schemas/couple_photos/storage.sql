-- Couple photos: storage policy of the private couple_photos bucket.

-- The first path folder is the couple id, so a foreign couple cannot read or write the file.
create policy couple_photos_storage_member_all on storage.objects for all to authenticated
  using (bucket_id = 'couple_photos' and (storage.foldername(name))[1] = (select private.current_couple_id())::text)
  with check (bucket_id = 'couple_photos' and (storage.foldername(name))[1] = (select private.current_couple_id())::text);
