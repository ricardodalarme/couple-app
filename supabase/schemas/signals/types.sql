-- Signals: enum types.

create type public.signal_kind as enum ('need', 'miss_us', 'hug', 'distance', 'repair', 'heavy_day', 'good_news');
create type public.signal_response as enum ('here', 'talk', 'more_time', 'will_do', 'not_now', 'plan', 'later', 'heart');
