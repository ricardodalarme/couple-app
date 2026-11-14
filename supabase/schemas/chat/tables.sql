-- Mascot chat: tables, indexes and constraints.

-- Mascot conversation (never called "AI chat" in the app). The Edge Function writes mascot messages. ------
create table public.chat_messages (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  role text not null check (role in ('user', 'mascot')),
  body text check (char_length(body) <= 4000),
  component text check (component in ('slip', 'date', 'question', 'me_or_you', 'choices', 'next_step', 'pause', 'ritual', 'partner_fact')),
  component_data text,
  created_at timestamptz not null default now()
);
create index chat_messages_author_idx on public.chat_messages (author_id, created_at desc);
create table public.learned_items (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  target public.learned_item_target not null,
  text text not null check (char_length(text) between 1 and 500),
  excerpt text check (char_length(excerpt) <= 500),
  status public.learned_item_status not null default 'pending',
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create index learned_items_author_idx on public.learned_items (author_id, status);

create trigger learned_items_set_updated_at before update on public.learned_items for each row execute function private.set_updated_at();
