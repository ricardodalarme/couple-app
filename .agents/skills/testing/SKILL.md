---
name: testing
description: Write and run tests for the app and packages — cubit tests with blocTest and mocktail for one-shot repository reads, Equatable state copyWith tests, widget tests with MockCubit and the pumpApp helper, and package tests with package:test. Use when adding or fixing tests, when the user says "write tests", "add coverage", "spec", or "test this cubit/widget", or when a code change needs verification.
---

# Testing

Tests mirror the source tree: `app/test/features/<feature>/...` mirrors
`app/lib/features/<feature>/...`. A cubit test sits next to its state test, and
page and widget tests live in the matching presentation folder.

The canonical feature is `post`; these are the reference tests:

```text
app/test/features/post/presentation/list/cubit/post_list_cubit_test.dart
app/test/features/post/presentation/list/cubit/post_list_state_test.dart
app/test/features/post/presentation/list/posts_list_page_test.dart
app/test/features/post/presentation/list/widgets/post_card_test.dart
packages/common_ui/test/src/widgets/skeletonizer_resource_widget_test.dart
```

## Commands

```bash
melos test                     # whole workspace
cd app && flutter test         # app only
cd app && flutter test test/features/post/presentation/list/cubit/post_list_cubit_test.dart
cd app && flutter test test/path/file_test.dart --plain-name "initial state is correct"
cd packages/core && dart test              # pure Dart package
cd packages/design_system && flutter test             # Flutter package
```

## Tools

- `flutter_test` + `bloc_test` + `mocktail` (no mockito, no golden tests).
- Mocks are primary-constructor classes:
  `class MockPostRepository() extends Mock implements PostRepository;` and
  `class MockPostsListCubit() extends MockCubit<PostsListState> implements PostsListCubit;`.
- Repositories, data sources, and SDK wrappers are mocked — never the network
  client or a real plugin.
- `app/test/test_helpers/pump_app.dart` provides `tester.pumpApp(widget)`, which
  wraps the widget in `TranslationProvider` + `AppThemeHost` + `MaterialApp`, so
  l10n and the theme work.

## Cubit test template

`PostsListCubit.getPosts()` is a one-shot read: it emits `Loading`, awaits
`PostRepository.getPosts()`, then emits `Success(posts)` or
`Failure.fromObject(exception)`.

```dart
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:flutter_bloc_starter/features/post/data/repositories/post_repository.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository() extends Mock implements PostRepository;

void main() {
  late PostRepository postRepository;
  late PostsListCubit postsListCubit;

  const posts = [Post.fake];
  const failure = LocalizedException(l10nKey: 'other');

  setUp(() {
    postRepository = MockPostRepository();
    postsListCubit = PostsListCubit(postRepository: postRepository);
  });

  tearDown(() => postsListCubit.close());

  test('initial state is correct', () {
    expect(postsListCubit.state, const PostsListState(posts: Loading()));
  });

  blocTest<PostsListCubit, PostsListState>(
    'emits Loading then Success when the repository returns posts',
    build: () {
      when(() => postRepository.getPosts()).thenAnswer((_) async => posts);
      return postsListCubit;
    },
    act: (cubit) => cubit.getPosts(),
    expect: () => [
      const PostsListState(posts: Loading()),
      const PostsListState(posts: Success(posts)),
    ],
  );

  blocTest<PostsListCubit, PostsListState>(
    'emits Failure when the repository throws',
    build: () {
      when(() => postRepository.getPosts()).thenThrow(failure);
      return postsListCubit;
    },
    act: (cubit) => cubit.getPosts(),
    expect: () => [
      const PostsListState(posts: Loading()),
      const PostsListState(posts: Failure(failure)),
    ],
  );
}
```

Notes:

- Stub the repository with `thenAnswer((_) async => …)` for the success path and
  `thenThrow(…)` for the failure path; the cubit awaits the read, so both work.
- `Failure.fromObject` keeps a `LocalizedException` and maps anything else to
  `Failure(const UnknownException())`. Reuse one `const` exception instance in
  the stub and in `expect`, because the exception has no value equality.
- `blocTest` compares states with `==`, so every state class needs Equatable
  `props`, and expectations should be `const` where the resource holds no
  non-const value.
- A retry after a `Failure` re-emits `Loading`; a repeat call while the state is
  already `Success` still emits `Loading` first, then the new result.
- `blocTest` consumes only the states emitted during `act`; the initial state is
  asserted with a plain `test` + `expect` as above.
- Flat `test`/`blocTest` calls in `main()` are enough; nest related cases when a
  file grows.

## State test template

```dart
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const posts = [Post(id: '1', title: 'title', body: 'body')];

  test('returns same object when no properties are passed', () {
    expect(const PostsListState().copyWith(), const PostsListState());
  });

  test('returns object with updated posts when posts is passed', () {
    expect(
      const PostsListState().copyWith(posts: const Success(posts)),
      const PostsListState(posts: Success(posts)),
    );
  });
}
```

Cover every `copyWith` parameter plus the default constructor, and assert the
default resource is `const Loading()`.

## Widget test template

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/posts_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class MockPostsListCubit() extends MockCubit<PostsListState> implements PostsListCubit;

void main() {
  late PostsListCubit postsListCubit;

  setUp(() {
    postsListCubit = MockPostsListCubit();
    when(() => postsListCubit.state).thenReturn(const PostsListState());
  });

  testWidgets('renders page', (tester) async {
    await tester.pumpApp(
      BlocProvider.value(value: postsListCubit, child: const PostsListPage()),
    );
    await tester.pump();

    expect(find.byType(PostsListPage), findsOneWidget);
  });
}
```

- `when(() => mockCubit.state).thenReturn(...)` is required for `MockCubit`; stub
  it again with `Success(...)` or `Failure(...)` to cover those branches.
- Stub cubit methods before tapping anything that calls them, for example
  `when(() => cubit.getPosts()).thenAnswer((_) async {})`.
- `BlocProvider.value` is used **only in tests** — production pages create their
  cubit in `wrappedRoute`.
- `await tester.pump()` flushes the first frame. Avoid `pumpAndSettle` unless
  animations really settle: the `Skeletonizer` loading state shimmers forever.
- Widget-level tests read the rendered output; assert text and component types,
  not cubit internals.

A leaf widget test needs no cubit at all:

```dart
void main() {
  testWidgets('shows the post content', (tester) async {
    const post = Post(id: '1', title: 'Test Title', body: 'Test Body');

    await tester.pumpApp(const PostCard(post: post));

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsOneWidget);
  });
}
```

## Resource widget test

`SkeletonizerResourceWidget<T>` collapses the four `Resource` cases into one
widget, so a widget test covers each case by pumping a different resource. It
lives at
`packages/common_ui/test/src/widgets/skeletonizer_resource_widget_test.dart`.

```dart
import 'package:core/core.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system/design_system.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  const fake = ['fake item'];
  const failure = LocalizedException(l10nKey: 'other');

  SkeletonizerResourceWidget<List<String>> build(Resource<List<String>> resource) {
    return SkeletonizerResourceWidget<List<String>>(
      resource,
      fakeValue: fake,
      successBuilder: (value) => Text('items: ${value.length}'),
      failureBuilder: (exception) => Text('failed: ${exception.l10nKey}'),
    );
  }

  testWidgets('renders real content on Success', (tester) async {
    await tester.pumpApp(build(const Success(['a', 'b'])));

    expect(find.text('items: 2'), findsOneWidget);
  });

  testWidgets('renders the failure builder on Failure', (tester) async {
    await tester.pumpApp(build(const Failure(failure)));

    expect(find.text('failed: other'), findsOneWidget);
  });

  testWidgets('renders the fake value under Skeletonizer on Loading', (tester) async {
    await tester.pumpApp(build(const Loading()));

    expect(tester.widget<Skeletonizer>(find.byType(Skeletonizer)).enabled, isTrue);
    expect(find.text('items: 1'), findsOneWidget);
  });

  testWidgets('renders nothing on Initial', (tester) async {
    await tester.pumpApp(build(const Initial()));

    expect(find.byType(Text), findsNothing);
  });
}
```

- Assert the builder output by text or type; the fake value only appears while
  loading, and `Success` must show the real value. `Skeletonizer` wraps both, so
  check its `enabled` flag rather than only its presence.
- Loading content is a live region: wrap the assertions in
  `final handle = tester.ensureSemantics();` … `handle.dispose();` and match the
  semantics label (`context.l10n.common.loading`) when you need to lock the
  announcement. The four visual state assertions above are the minimum.
- `Skeletonizer` shimmer animates while enabled, so use `pumpApp` without
  `pumpAndSettle`.

## Package tests

- Pure Dart packages (`core`, `form_inputs`, `formatters`, `logger`, `network`):
  `package:test`, plain `test()` functions, no Flutter binding.
- Flutter packages (`design_system`, `services/*`): `flutter_test` + `mocktail`;
  inject SDK mocks through the constructor's optional parameter
  (`FirebaseAnalyticsService(MockFirebaseAnalytics())`,
  `SecureStorageServiceImpl(MockFlutterSecureStorage())`).
- `design_system` tests use `test/helpers/widget_host.dart`, which wraps a widget in
  `MaterialApp` + `AppThemed` (or a plain host) at the rose variant.
- Some packages have no tests yet — adding the first `test/<topic>_service_test.dart`
  following the SDK-mock pattern is fine.

## Gotchas

- Always `tearDown(() => cubit.close())` — leaked cubits fail the suite.
- Never mock the network client or a platform channel; mock the repository or the
  SDK wrapper one level in.
- `app/test/analysis_options.yaml` extends the root config and disables
  `avoid_redundant_argument_values`; keep the same conventions there.
- Use `Success(null)` (not `Success<void>(null)`) for void resources.
- Widget tests must pump with `pumpApp`; `pumpWidget` alone breaks l10n and the
  theme.
- Do not generate mocks or add codegen for tests; hand-write them with
  `mocktail`.
- New test files are picked up by `melos test` automatically (very_good runner) —
  there is no test registration list.
