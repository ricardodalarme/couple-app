alter table public.consents drop constraint if exists consents_kind_check;
alter table public.consents add constraint consents_kind_check
  check (kind in ('sensitive_data', 'analytics', 'marketing', 'ai', 'terms', 'sensitive_tracks'));
