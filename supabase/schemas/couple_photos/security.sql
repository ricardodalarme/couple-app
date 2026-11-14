-- Couple photos: row level security, grants and policies.

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
