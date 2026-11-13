-- Erasing a profile cascades through this column, and the baseline test requires
-- an index starting with every foreign key.
create index if not exists couple_photos_uploaded_by_idx on public.couple_photos (uploaded_by);
