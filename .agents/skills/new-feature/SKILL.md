---
name: new-feature
description: Scaffold a complete new feature in the app — folder structure, GraphQL data layer, DI module, Cubit + Resource state, pages with private widgets, route registration, localization keys, tests, and Storybook examples. Use when adding any feature, screen, page, form, or flow under app/lib/features, including small requests like "add a detail page", "create a list screen", or "build an onboarding step" — even if the user does not mention architecture.
---

# Adding a feature to the app

A feature is one user-facing capability: `app/lib/features/<snake_case_name>/`.
Everything follows the same three-part layout, and every feature must be wired
into the global places it needs (DI module list, router, l10n, tests).

This is a generic starter. Do not invent product behavior. When the request is
ambiguous, ask for the missing behavior instead of assuming a domain.

## Definition of done

A feature is only complete when all of these exist and `melos gen` / `melos l10n`
have run:

1. `data/` — data sources, models, mappers, repository (only if it touches data)
2. `di/<feature>_injection_module.dart` — registered **and** added to `main.dart::_registerModules()`
3. `presentation/` — page(s) with `@RoutePage()` + cubit(s)
4. Route registered in `app/lib/router/app_router.dart`
5. l10n keys in `app/lib/l10n/en/<feature>.json` (plus the `pt/` sibling)
6. Tests in `app/test/features/<feature>/`
7. Storybook example for any reusable widget
   (`app/lib/features/dev_menu/storybook/`)
8. A new `common_ui` widget ships with a widget test under
   `packages/common_ui/test/src/widgets/`; visual ones also get a Storybook
   example under `app/lib/features/dev_menu/storybook/examples/widgets/`
9. `melos analyze` and `melos test` pass

## Step 1 — Choose the shape

| Situation | Layout |
| --- | --- |
| One screen, reads/writes server data | `di/`, `data/`, `presentation/<name>/` |
| One screen, UI only (no data) | `presentation/<name>/` + `di/` (cubit only) |
| Multiple pages / sub-features (see `authentication`) | `presentation/<sub_feature>/` each with `<name>_page.dart`, `cubit/`, `widgets/` |

Key rule for multi-page features: **data source, models, mappers, and repository
stay at feature level; presentation is split per sub-feature.** Each sub-feature
folder holds its page, widgets, and cubits.

Simple feature tree (modeled on the real `post` feature; `posts` is a placeholder
feature name — replace it with yours):

```text
app/lib/features/posts/
├── data/
│   ├── data_sources/
│   │   ├── post_data_source.dart
│   │   ├── queries/GetPosts.graphql
│   │   ├── queries/generated/GetPosts.graphql.dart       (generated)
│   │   ├── fragments/PostFragment.graphql
│   │   └── fragments/generated/PostFragment.graphql.dart (generated)
│   ├── mappers/post_response_mapper.dart
│   ├── models/post.dart
│   └── repositories/post_repository.dart
├── di/post_injection_module.dart
└── presentation/list/
    ├── posts_list_page.dart
    ├── cubit/posts_list_cubit.dart        (parts its state)
    ├── cubit/posts_list_state.dart
    └── widgets/post_card.dart
```

## Step 2 — Data layer

Follow the `data-layer` skill. Minimum viable flow:

1. Add `.graphql` query/fragment files under `data/data_sources/` against the
   committed schema snapshot at
   `app/lib/features/_shared/data/data_sources/schema.graphql`.
2. Write model(s) and mapper(s) — hand-written Equatable models with a
   `static const fake`.
3. Write an `XDataSource` with a one-shot `getX` returning the generated
   collection, wrapped in `validateResponseData`.
4. Write a concrete repository returning `Future<Model>` or
   `Future<List<Model>>`, with a `Logger` and `LocalizedException` mapping.
5. Run `melos gen` to generate GraphQL code before importing it.

Do not invent a table, field, or mutation the snapshot does not expose. Empty is
a valid result; `Model.fake` is only a skeleton placeholder.

## Step 3 — Cubit + state

Follow the `async-state` skill. Condensed template:

```dart
// presentation/list/cubit/posts_list_cubit.dart
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/posts/data/models/post.dart';
import 'package:flutter_bloc_starter/features/posts/data/repositories/post_repository.dart';

part 'posts_list_state.dart';

class PostsListCubit({required final PostRepository _postRepository})
    extends Cubit<PostsListState> {
  this : super(const PostsListState());

  Future<void> getPosts() async {
    emit(state.copyWith(posts: const Loading()));

    try {
      final posts = await _postRepository.getPosts();
      emit(state.copyWith(posts: Success(posts)));
    } catch (exception) {
      emit(state.copyWith(posts: Failure.fromObject(exception)));
    }
  }
}
```

```dart
// presentation/list/cubit/posts_list_state.dart
part of 'posts_list_cubit.dart';

final class const PostsListState({final Resource<List<Post>> posts = const Loading()})
    with Equatable {
  PostsListState copyWith({Resource<List<Post>>? posts}) {
    return PostsListState(posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [posts];
}
```

- Primary constructors in the class header; no separate constructor body.
- Reads start as `const Loading()` so the skeleton shows on the first frame.
- Mutations/actions use an `*Action` slot and start as `const Initial()`.
- Always emit `Failure.fromObject(exception)` on failure.
- Forms mix in `FormzMixin` and expose
  `List<FormzInput<dynamic, dynamic>> get inputs => [...]`; `state.isValid`
  drives submit buttons (see `login_state.dart`).

## Step 4 — Page + widgets

Follow `async-state` for state rendering and `design-system` for UI. A read slot
is rendered by `SkeletonizerResourceWidget`, not by a hand-written `switch`:

```dart
// presentation/list/posts_list_page.dart
@RoutePage()
class const PostsListPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  static final List<Post> _skeletonPosts = List.filled(6, Post.fake);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PostsListCubit>()..getPosts(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.posts.list;
    final posts = context.select((PostsListCubit cubit) => cubit.state.posts);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: SkeletonizerResourceWidget<List<Post>>(
        posts,
        fakeValue: _skeletonPosts,
        successBuilder: (posts) => _PostsListWidget(posts: posts),
        failureBuilder: (exception) => BaseEmptyState(
          title: context.l10n.common.genericError,
          text: l10n.textFailure,
          actionText: context.l10n.common.retry,
          onAction: context.read<PostsListCubit>().getPosts,
          face: FaceKind.sad,
        ),
      ),
    );
  }
}
```

- `SkeletonizerResourceWidget`
  (`packages/common_ui/lib/src/widgets/skeletonizer_resource_widget.dart`)
  is the default renderer for a read slot: `Initial` → `SizedBox.shrink()`,
  `Loading` → `Skeletonizer` over `successBuilder(fakeValue)`, `Success` →
  `successBuilder(value)`, `Failure` → `failureBuilder(exception)`. Use a manual
  `switch` over the `Resource` only for a one-off case that genuinely does not
  fit, and say why in the page.
- `fakeValue` is what `successBuilder` receives while loading, so it must be
  structurally representative (`Post.fake`, `List.filled(6, Post.fake)`). A fake
  with a different shape makes the skeleton jump when the data lands.
- `failureBuilder` receives the `LocalizedException`; build a `BaseEmptyState`
  there (`face: FaceKind.sad`), and point its retry at the cubit method that
  produced the failure.
- Do not wrap the widget in another `Skeletonizer`, and do not add an
  `isRefreshing` flag — the widget keeps the last `Success` on screen while a
  refresh is loading.
- Split the body into `_PrivateWidget` classes so each one selects only the
  state slice it needs with `context.select`. Do not add `BlocBuilder`,
  `BlocSelector`, or `buildWhen`; use `context.select` for every state read and
  `context.read` for actions.
- Use `InfiniteListView` for lists (it owns pull-to-refresh and the pagination
  trigger; handle zero items with a single `BaseEmptyState` row). Never render
  invented records.
- The `fake` model is only used inside the skeleton while loading.

## Step 5 — DI module

Follow `dependency-injection`:

```dart
// di/post_injection_module.dart
class PostInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PostDataSource>(
      () => PostDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<PostRepository>(
      () => PostRepository(postDataSource: injector.get<PostDataSource>()),
    )
    ..registerFactory<PostsListCubit>(
      () => PostsListCubit(postRepository: injector.get<PostRepository>()),
    );
}
```

Then **add `PostInjectionModule()` to the `injectionModules` list in
`app/lib/main.dart::_registerModules()`** — forgetting this causes a
runtime "not registered" error.

## Step 6 — Route

Follow `routing`. Add to `app/lib/router/app_router.dart`:

```dart
AutoRoute(page: PostsListPage.page),
```

inside the appropriate parent `AutoRoute(children: [...])`, then run `melos gen`.
The tab shell is `HomePage` with `PostsListRoute`, `SearchRoute`, and
`ProfileRoute` under `HomeRoute`. Adding a tab requires both a child route and a
`HomePage` `AutoTabsRouter.routes` entry.

## Step 7 — Localization

Follow `localization`. Add `app/lib/l10n/en/posts.json` with the feature
namespace, run `melos l10n`, then reference
`context.l10n.posts.list.title`. Add the `pt` sibling when the feature is ready
for translation; do not machine-translate inline.

## Step 8 — Tests

Follow `testing`. Minimum:

- `app/test/features/posts/presentation/list/cubit/posts_list_cubit_test.dart`
- `app/test/features/posts/presentation/list/cubit/posts_list_state_test.dart`
- `app/test/features/posts/presentation/list/posts_list_page_test.dart`

A new or changed widget under `packages/common_ui/lib/src/widgets/` also needs
its own widget test at `packages/common_ui/test/src/widgets/...`; visual widgets
also get a Storybook example at
`app/lib/features/dev_menu/storybook/examples/widgets/`, registered in
`examples/examples.dart` (see `storybook`).

## Step 9 — Verify

```bash
melos gen          # routes + GraphQL codegen
melos l10n         # if you added keys
melos analyze
melos test         # or: cd app && flutter test test/features/posts
```

## Canonical examples to imitate

- `post` — GraphQL read, `Resource` state, skeleton, empty/error states.
- `authentication` — multi-step forms, service-backed repository,
  `BlocListener` side effects, private widgets.
- `account` — profile pages and form-driven cubits.
- `settings` — local preference-backed state.
- `home` — the three-tab shell.
- `packages/common_ui` — shared widgets (`SkeletonizerResourceWidget`, lists, `WebView`).

## Gotchas

- There is **no domain/usecase layer**. Cubits call repositories directly. Do not invent one.
- Cubits take **no constructor arguments for runtime data** — `Injector` has no
  `registerFactoryParam`. Pass ids/objects into cubit methods or page widgets.
- Any new `InjectionModule` must be added to `main.dart::_registerModules()`, or
  `AppInjector.instance.get<T>()` throws at runtime.
- Generated files (`*.graphql.dart`, `*.gr.dart`, `translations*.dart`) are
  committed. Run `melos gen` / `melos l10n` and commit the outputs; never
  hand-edit them.
- Use Dart **primary constructors**: the constructor lives in the class header
  (`class const PostCard({required final Post post, super.key})`). Never use the
  old separate constructor-body style.
- Imports are always `package:` imports.
- Never import `flutter/material.dart`, `flutter/cupertino.dart`, or
  `material_ui` in `app/lib` — use `package:design_system/design_system.dart`.
- Do not use `BlocProvider.value` in app code (tests only). Pages always create
  their cubit in `wrappedRoute`.
- Do not invent server data. If the service cannot confirm a value, the UI says
  so — empty and unknown are valid states.
