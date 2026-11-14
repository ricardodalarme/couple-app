-- Content: tables, indexes and constraints.

-- Small key/value configuration, readable by the app (limits, minimum app version).
create table public.app_config (
  key text primary key check (char_length(key) <= 60),
  value text not null
);

-- Content catalog: every piece of editorial content, one row per language -----------------------------
create table public.content_items (
  id uuid primary key default gen_random_uuid(),
  kind public.content_kind not null,
  slug text not null check (char_length(slug) between 1 and 80),
  locale text not null check (locale in ('pt-BR', 'en')),
  title text not null check (char_length(title) <= 300),
  body text,
  parent_slug text,
  position integer not null default 0,
  tags text[] not null default '{}',
  month smallint check (month between 1 and 12),
  day smallint check (day between 1 and 31),
  country text check (char_length(country) = 2),
  plus_only boolean not null default false,
  sensitive boolean not null default false,
  published boolean not null default true,
  constraint content_items_unique unique (kind, slug, locale)
);
create index content_items_kind_idx on public.content_items (kind, locale, position);
create index content_items_parent_idx on public.content_items (parent_slug);
