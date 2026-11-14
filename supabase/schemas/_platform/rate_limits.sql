-- Platform: fixed-window rate limiter.

-- Fixed-window rate limiter. Returns true while the caller is within the limit.
create table private.rate_limits (
  key text not null,
  window_start timestamptz not null,
  hits integer not null default 1,
  primary key (key, window_start)
);
alter table private.rate_limits enable row level security;

create function private.hit_rate_limit(p_key text, p_max integer, p_window interval) returns boolean
language plpgsql set search_path = '' as $$
declare
  v_secs double precision := extract(epoch from p_window);
  v_start timestamptz := to_timestamp(floor(extract(epoch from now()) / v_secs) * v_secs);
  v_hits integer;
begin
  insert into private.rate_limits as r (key, window_start) values (p_key, v_start)
  on conflict (key, window_start) do update set hits = r.hits + 1
  returning r.hits into v_hits;
  return v_hits <= p_max;
end $$;
