-- Storage: owner and partner access to private buckets.

-- Storage: private buckets, first folder = owner id. Files are read through short-lived signed URLs. ------
create policy storage_owner_all on storage.objects for all to authenticated
  using (bucket_id in ('avatars', 'memories', 'messages') and (storage.foldername(name))[1] = (select auth.uid())::text)
  with check (bucket_id in ('avatars', 'memories', 'messages') and (storage.foldername(name))[1] = (select auth.uid())::text);
-- The partner may read: my avatar, files of memories I shared, and files I sent them.
create policy storage_partner_read on storage.objects for select to authenticated
  using ((storage.foldername(name))[1] = (select private.partner_id())::text and (
       bucket_id = 'avatars'
    or (bucket_id = 'memories' and exists (select 1 from public.memories m where m.photo_path = name and m.couple_id = (select private.current_couple_id())))
    or (bucket_id = 'messages' and exists (select 1 from public.partner_messages pm where pm.media_path = name and pm.recipient_id = (select auth.uid())))));
