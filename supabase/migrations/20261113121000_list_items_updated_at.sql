-- list_items declared updated_at but never refreshed it.
create trigger list_items_set_updated_at before update on public.list_items
  for each row execute function private.set_updated_at();
