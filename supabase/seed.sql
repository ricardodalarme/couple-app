-- Development-only starter feed. These posts exist so a fresh local database
-- and Widgetbook/Storybook runs have something to render. They are not real
-- user activity.
insert into public.posts (id, title, content, author_image_url)
values
  (
    '11111111-1111-4111-8111-111111111111',
    'Welcome to Flutter Bloc Starter',
    'This is the starter feed. Replace it with your own posts once the app is wired to your backend.',
    null
  ),
  (
    '22222222-2222-4222-8222-222222222222',
    'A schema-first Supabase project',
    'The posts table, policies, and GraphQL surface live in supabase/schemas and are applied through migrations.',
    null
  ),
  (
    '33333333-3333-4333-8333-333333333333',
    'Resources and skeletons',
    'Read slots use Resource and SkeletonizerResourceWidget so loading, success, failure, and empty states stay consistent.',
    null
  )
on conflict (id) do nothing;
