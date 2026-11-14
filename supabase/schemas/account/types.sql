-- Account: enum types.

create type public.consent_kind as enum ('sensitive_data', 'analytics', 'marketing', 'ai', 'terms', 'sensitive_tracks');
create type public.support_topic as enum ('account', 'billing', 'bug', 'other');
