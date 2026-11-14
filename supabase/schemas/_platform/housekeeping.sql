-- Platform: daily pruning of expired rate-limit windows, notifications and job history.

-- An unsent notification that is still unsent 30 days after it was queued (for example because delivery kept failing) is dropped with the sent ones.
-- cron.job_run_details is never cleaned up by pg_cron, so keep a week of it.
create function private.prune_expired_rows() returns void
language plpgsql security definer set search_path = '' as $$
begin
  delete from private.rate_limits where window_start < now() - interval '2 days';
  delete from private.notification_outbox where coalesce(sent_at, created_at) < now() - interval '30 days';
  delete from cron.job_run_details where end_time < now() - interval '7 days';
end $$;
