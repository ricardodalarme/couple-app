SET local check_function_bodies = off;

CREATE OR REPLACE FUNCTION private.prune_expired_rows()
  RETURNS void
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
begin
  delete from private.rate_limits where window_start < now() - interval '2 days';
  delete from private.notification_outbox where sent_at < now() - interval '30 days';
end $function$;

CREATE OR REPLACE FUNCTION private.purge_deleted_accounts()
  RETURNS integer
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_id uuid; v_n integer := 0;
begin
  for v_id in select profile_id from public.deletion_requests where purge_after <= now() loop
    perform private.erase_profile(v_id);
    v_n := v_n + 1;
  end loop;
  return v_n;
end $function$;

SELECT cron.schedule_in_database('prune-expired-rows', '27 3 * * *', 'select private.prune_expired_rows()', 'postgres', NULL, true);
