-- Declarative source of truth. Mirrors migration 20261110000600_guest_links.sql; edit both together when Docker/pg-delta is unavailable.
-- Guest partner: read a card from a link without an account, react, stop receiving, report. (BE-011, BE-012, BE-024 minimal)
create table public.guest_links (
  id uuid primary key default gen_random_uuid(),
  card_id uuid not null references public.cards (id) on delete cascade,
  token_hash bytea not null unique,
  expires_at timestamptz not null,
  revoked_at timestamptz,
  opened_at timestamptz,
  created_at timestamptz not null default now()
);
create index guest_links_card_id_idx on public.guest_links (card_id);
comment on constraint guest_links_card_id_fkey on public.guest_links is e'@graphql({"foreign_name": "card", "local_name": "guestLinks"})';
alter table public.guest_links enable row level security;
grant select (id, card_id, expires_at, revoked_at, created_at) on public.guest_links to authenticated;
create policy guest_links_select_author on public.guest_links for select to authenticated
  using (exists (select 1 from public.cards c where c.id = card_id and c.author_id = (select auth.uid())));

-- A guest who pressed "stop receiving" for this sender. The sender is never told.
create table private.guest_stops (
  sender_id uuid primary key references public.profiles (id) on delete cascade,
  stopped_at timestamptz not null default now()
);
alter table private.guest_stops enable row level security;

create table private.abuse_reports (
  id uuid primary key default gen_random_uuid(),
  reported_profile_id uuid references public.profiles (id) on delete set null,
  card_id uuid references public.cards (id) on delete set null,
  source text not null check (source in ('guest', 'app')),
  reason text not null check (char_length(reason) between 1 and 60),
  details text check (char_length(details) <= 2000),
  card_snapshot jsonb,
  created_at timestamptz not null default now()
);
create index abuse_reports_reported_idx on private.abuse_reports (reported_profile_id);
create index abuse_reports_card_idx on private.abuse_reports (card_id);
alter table private.abuse_reports enable row level security;

create view public.guest_link_created with (security_invoker = true) as
  select id, null::text as token, expires_at from public.guest_links where false;
comment on view public.guest_link_created is e'@graphql({"primary_key_columns": ["id"], "description": "Result of createGuestLink. The token is shown once; the page URL is <site>/c/<token>."})';
grant select on public.guest_link_created to authenticated;

create function private.hash_token(p_token text) returns bytea
language sql immutable set search_path = '' as $$
  select extensions.digest(coalesce(p_token, ''), 'sha256');
$$;

-- Link for a card the caller already sent. Expires in 30 days (product doc 01, flow 4).
create function public.create_guest_link(card_id uuid) returns public.guest_link_created
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_token text := encode(extensions.gen_random_bytes(24), 'hex');
  v_row public.guest_link_created;
begin
  if not exists (select 1 from public.cards c
                 where c.id = create_guest_link.card_id and c.author_id = v_uid and c.status = 'sent' and c.deleted_at is null) then
    raise exception 'CARD_NOT_FOUND' using errcode = 'P0001';
  end if;
  if not private.hit_rate_limit('guest_link:' || v_uid, 20, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.guest_links (card_id, token_hash, expires_at)
  values (create_guest_link.card_id, private.hash_token(v_token), now() + interval '30 days')
  returning id, v_token, expires_at into v_row;
  return v_row;
end $$;

create function public.revoke_guest_link(link_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  update public.guest_links l set revoked_at = now()
  from public.cards c
  where l.id = link_id and c.id = l.card_id and c.author_id = v_uid and l.revoked_at is null;
  return found;
end $$;
grant execute on function public.create_guest_link(uuid), public.revoke_guest_link(uuid) to authenticated;

-- Resolves a token to a live link, or nothing. Unknown, expired, revoked, deleted and stopped all look the same.
create function private.live_guest_link(p_token text) returns public.guest_links
language sql stable security definer set search_path = '' as $$
  select l.* from public.guest_links l join public.cards c on c.id = l.card_id
  where l.token_hash = private.hash_token(p_token) and l.revoked_at is null and l.expires_at > now()
    and c.status = 'sent' and c.deleted_at is null
    and not exists (select 1 from private.guest_stops s where s.sender_id = c.author_id);
$$;

-- Minimum needed to render the page. Fetching it never marks the card as opened (link preview bots).
create function private.guest_card(p_token text) returns jsonb
language sql stable security definer set search_path = '' as $$
  select jsonb_build_object(
    'senderName', p.display_name,
    'theme', (select theme from public.profile_settings where profile_id = c.author_id),
    'note', c.note,
    'sentAt', c.sent_at,
    'opened', l.opened_at is not null,
    'items', coalesce((select jsonb_agg(jsonb_build_object('body', i.body, 'feeling', i.feeling) order by i.position)
                       from public.card_items i where i.card_id = c.id), '[]'::jsonb),
    'reaction', (select jsonb_build_object('reaction', r.reaction, 'reply', r.reply)
                 from public.card_reactions r where r.card_id = c.id))
  from private.live_guest_link(p_token) l
  join public.cards c on c.id = l.card_id join public.profiles p on p.id = c.author_id;
$$;

-- A person tapped Open.
create function private.guest_open(p_token text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_link public.guest_links := private.live_guest_link(p_token);
begin
  if v_link.id is null then return false; end if;
  update public.guest_links set opened_at = coalesce(opened_at, now()) where id = v_link.id;
  insert into public.card_opens (card_id) values (v_link.card_id) on conflict do nothing;
  return true;
end $$;

create function private.guest_react(p_token text, p_reaction text, p_reply text default null) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_link public.guest_links := private.live_guest_link(p_token);
begin
  if v_link.id is null then return false; end if;
  insert into public.card_reactions as r (card_id, reaction, reply, from_guest)
  values (v_link.card_id, nullif(left(btrim(p_reaction), 16), ''), nullif(left(btrim(p_reply), 500), ''), true)
  on conflict on constraint card_reactions_pkey do update
    set reaction = excluded.reaction, reply = excluded.reply, reacted_at = now(), from_guest = true;
  return true;
end $$;

-- Stop receiving from this sender: all their links die and future ones never resolve. Idempotent.
create function private.guest_stop(p_token text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_sender uuid;
begin
  select c.author_id into v_sender from public.guest_links l join public.cards c on c.id = l.card_id
  where l.token_hash = private.hash_token(p_token);
  if v_sender is null then return false; end if;
  insert into private.guest_stops (sender_id) values (v_sender) on conflict do nothing;
  update public.guest_links l set revoked_at = coalesce(l.revoked_at, now())
  from public.cards c where c.id = l.card_id and c.author_id = v_sender;
  return true;
end $$;

create function private.guest_report(p_token text, p_reason text, p_details text default null, p_include_card boolean default false) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_card public.cards;
begin
  select c.* into v_card from public.guest_links l join public.cards c on c.id = l.card_id
  where l.token_hash = private.hash_token(p_token);
  if v_card.id is null then return false; end if;
  insert into private.abuse_reports (reported_profile_id, card_id, source, reason, details, card_snapshot)
  values (v_card.author_id, v_card.id, 'guest', left(coalesce(nullif(btrim(p_reason), ''), 'unspecified'), 60), left(p_details, 2000),
          case when p_include_card then
            (select jsonb_agg(jsonb_build_object('body', i.body) order by i.position) from public.card_items i where i.card_id = v_card.id)
          end);
  return true;
end $$;
grant execute on function private.guest_card(text), private.guest_open(text), private.guest_react(text, text, text),
  private.guest_stop(text), private.guest_report(text, text, text, boolean), private.hit_rate_limit(text, integer, interval) to service_role;
