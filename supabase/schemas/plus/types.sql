-- Plus: enum types.

create type public.entitlement_plan as enum ('plus_monthly', 'plus_annual', 'plus_gift');
create type public.entitlement_status as enum ('trialing', 'active', 'grace', 'billing_issue', 'expired', 'refunded');
create type public.entitlement_store as enum ('app_store', 'play_store', 'promo');
