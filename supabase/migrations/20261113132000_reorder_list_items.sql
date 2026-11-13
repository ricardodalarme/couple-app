-- Reorders a list in one request: position follows the order of item_ids. Runs as the caller, so RLS decides
-- which items can be moved. Returns the whole list in its new order.
create function public.reorder_list_items(list_id uuid, item_ids uuid[]) returns setof public.list_items
language plpgsql volatile security invoker set search_path = '' as $$
begin
  update public.list_items li
  set position = o.ord::integer - 1
  from unnest(reorder_list_items.item_ids) with ordinality as o(id, ord)
  where li.id = o.id and li.list_id = reorder_list_items.list_id and li.position is distinct from o.ord::integer - 1;

  return query
  select li.* from public.list_items li
  where li.list_id = reorder_list_items.list_id
  order by li.position, li.created_at;
end $$;
grant execute on function public.reorder_list_items(uuid, uuid[]) to authenticated;
comment on function public.reorder_list_items(uuid, uuid[]) is e'@graphql({"description": "Sets each item''s position to its index in itemIds and returns the whole list in order. Items not in itemIds keep their position."})';
