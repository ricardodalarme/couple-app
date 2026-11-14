SET local check_function_bodies = off;

CREATE OR REPLACE FUNCTION private.prune_expired_rows()
  RETURNS void
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
begin
  delete from private.rate_limits where window_start < now() - interval '2 days';
  delete from private.notification_outbox where coalesce(sent_at, created_at) < now() - interval '30 days';
  delete from cron.job_run_details where end_time < now() - interval '7 days';
end $function$;
