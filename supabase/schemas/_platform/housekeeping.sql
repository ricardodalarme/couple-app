-- Platform: daily pruning of expired rate-limit windows and sent notifications.

create function private.prune_expired_rows() returns void
language plpgsql security definer set search_path = '' as $$
begin
  delete from private.rate_limits where window_start < now() - interval '2 days';
  delete from private.notification_outbox where sent_at < now() - interval '30 days';
end $$;
