---
name: async-state
description: Implement Cubit state management in this app with the sealed Resource pattern (Initial/Loading/Success/Failure), one-shot Future repository reads, Equatable part-file state classes, Skeletonizer loading states built from a model fake, private rebuilding widgets that read narrow slices with context.select/context.read, and BlocListener side effects. Use when creating or editing a Cubit or its state, wiring loading/error/empty states, adding skeleton loaders, showing a failure SnackBar, or whenever code mentions Resource, emit, Success, Failure, Skeletonizer, or posts.
---

# Async state in the app

Every async value in `app/lib` goes through a `flutter_bloc` **Cubit** (never
`Bloc`) that holds a sealed `Resource<T>` in its state. Match the existing
features instead of inventing a variant.

Reads are **one-shot repository calls**: the cubit method emits `Loading`, awaits
a `Future`, then emits `Success` or `Failure`. There is no stream subscription
layer and no reactive read path in this starter; the `GQLClient` may serve a
cached result, but the cubit still receives it as one `Future`.

## The pattern in one picture

```
read:
PostsListPage.wrappedRoute → BlocProvider(create: () => injector.get<PostsListCubit>()..getPosts())
   → cubit.getPosts(): emit Loading → await repo.getPosts() → emit Success(list)
                                                          catch → emit Failure.fromObject(e)
   → BlocBuilder + switch over state.posts
        Initial  → SizedBox.shrink()
        Loading  → Skeletonizer(child: list built from Post.fake)
        Success  → real list (BaseListView, EmptyIndicator when empty)
        Failure  → ErrorIndicator with retry calling the same method

action / form submit:
page → cubit.submit(): emit <slot> Loading → await repo → emit Success
                                                  catch → emit Failure → emit Initial
   → BlocListener shows a SnackBar for Failure; Success navigates
```

## Resource rules

`Resource<S>` lives in `packages/core/lib/src/utils/resource.dart` and is
exported by `package:core/core.dart`:

- `Initial()` — nothing requested, or reset after a handled result. Default for
  **action / form slots**. Pages render it as `SizedBox.shrink()`.
- `Loading()` — in flight. Default for **read slots**, so the skeleton is the
  first frame instead of a flash of empty content.
- `Success<S>(value)` — the value.
- `Failure(exception)` — build it with `Failure.fromObject(exception)`; it keeps
  the exception only when it is a `LocalizedException`, otherwise it wraps
  `UnknownException`.

`Success` and `Failure` implement `==`, so `BlocListener.listenWhen` can compare
the slot directly.

A repository returns a plain model (`Future<List<Post>>`) and never a
`Resource`. `Resource` is a presentation type; keeping it out of the data layer
means the cubit is the only place that translates an exception into UI state, and
the data layer stays usable without Flutter.

### Naming convention

- **Read slot**: the data name, no suffix. `posts`, `profile`, `settings`.
  Default `const Loading()`.
- **Action slot**: the verb plus `Action`, or the domain noun used by the screen.
  Real examples: `login` in `LoginState`, `submission` in `EditProfileState`.
  Template default `const Initial()`.
- Constructor parameter, `copyWith` parameter, field, and `props` entry all use
  the same name.

## Cubit template (one-shot read)

`app/lib/features/post/presentation/list/cubit/posts_list_cubit.dart` is the
canonical read cubit:

```dart
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:flutter_bloc_starter/features/post/data/repositories/post_repository.dart';

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

- The class declares `part '<name>_state.dart';`, uses a primary constructor with
  a named private field, and passes the default state to `super`.
- `emit(state.copyWith(<slot>: const Loading()))` runs **first**, so a retry
  after a failure clears the error UI immediately.
- Catch `exception` without a type filter — the repository already normalized
  whatever the client threw. `Failure.fromObject` decides whether the UI gets a
  `LocalizedException` or `UnknownException`.
- Errors are carried by the `Failure` slot and nowhere else. The cubit does not
  log or report them; the page decides what the user sees.
- A method that takes runtime data takes it as a parameter
  (`getPosts({int? first, String? after})`), never through the constructor.
  Cubits are created by the injector with no runtime arguments (see
  `dependency-injection`).
- The repository method here is a single `GQLClient.query` wrapped in
  `validateResponseData` and mapped by an extension (`PostResponseMapper`).
  Keep the cubit blind to that: it sees `Future<List<Post>>`.

## Cubit template (one-shot action)

Add this shape when a page mutates data or submits a form. It is a template — the
starter's `PostRepository` currently exposes reads only.

```dart
Future<void> savePost(Post post) async {
  if (state.isNotValid) return;

  emit(state.copyWith(saveAction: const Loading()));

  try {
    await _postRepository.savePost(post);
    emit(state.copyWith(saveAction: const Success(null)));
  } catch (exception) {
    emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    emit(state.copyWith(saveAction: const Initial()));
  }
}
```

- `if (state.isNotValid) return;` belongs only in form cubits; remove it for
  plain actions.
- `Resource<void>` actions use `const Success(null)`.
- Resetting to `const Initial()` after a failure lets the same failure fire the
  `BlocListener` twice in a row. `LoginCubit.onSubmit` does exactly this:

  ```dart
  } catch (exception) {
    emit(state.copyWith(login: Failure.fromObject(exception)));
    emit(state.copyWith(login: const Initial()));
  }
  ```

  Because `listenWhen` compares the slot, `Failure → Initial → Failure` is two
  distinct transitions. Emitting `Failure` twice with no reset would be one
  transition only if the values were equal.
- Do not reset to `Initial` after `Success` when a listener navigates away — the
  page is disposed, and the reset would only rebuild a dead subtree.
- One action method per user gesture, and no optimistic `Success` before the
  await resolves.

## State template

`app/lib/features/post/presentation/list/cubit/posts_list_state.dart`:

```dart
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

Rules:

- `final class ... with Equatable` — **`with`** (mixin), never `extends`.
- `part of` the cubit file, one state file per cubit, same base name.
- Explicit `copyWith`; no `freezed`, no `json_serializable`, no generated state.
- `props` lists **every** field, or equality tests and `listenWhen` silently
  break.
- Form states mix in both `Equatable` and `FormzMixin` and expose
  `List<FormzInput<dynamic, dynamic>> get inputs => [email, password];`. The
  cubit reads `state.isNotValid`; widgets read `state.isValid`,
  `state.email.displayError`, and so on. Canonical form state:
  `app/lib/features/authentication/presentation/login/cubit/login_state.dart`.

## Page consumption

The page creates the cubit in `wrappedRoute` (see `routing`), then switches over
the resource. Real code from
`app/lib/features/post/presentation/list/posts_list_page.dart`:

```dart
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
    final l10n = context.l10n.post.list;

    return BaseView(
      title: l10n.title,
      body: BlocBuilder<PostsListCubit, PostsListState>(
        builder: (context, state) => switch (state.posts) {
          Initial() => const SizedBox.shrink(),
          Success(:final List<Post> value) => _PostsListWidget(posts: value),
          Loading() => Skeletonizer(child: _PostsListWidget(posts: _skeletonPosts)),
          Failure() => ErrorIndicator(
            title: context.l10n.common.genericError,
            buttonText: context.l10n.common.retry,
            message: l10n.textFailure,
            onButtonPressed: context.read<PostsListCubit>().getPosts,
          ),
        },
      ),
    );
  }
}
```

- `switch` over the sealed `Resource` is exhaustive, so every slot must be
  handled and no `default` is needed.
- `Loading` renders the **same widget** as `Success` wrapped in `Skeletonizer`,
  fed by a fake list. Do not build a different loading layout.
- Models expose `static const Post fake` (`app/lib/features/post/data/models/post.dart`);
  for lists use `List.filled(n, Post.fake)` as a `static` on the page so it is
  allocated once.
- `Initial` only appears if a read slot defaults to `Initial` — read slots
  default to `Loading`, so the branch exists to keep the switch honest.
- `Failure` uses `ErrorIndicator` from
  `app/lib/features/_shared/presentation/widgets/error_indicator.dart`
  (`title`, `message`, `buttonText`, `onButtonPressed`). The retry callback is
  the same cubit method that produced the failure.
- Localize the message with
  `context.l10n.<feature>.<scope>.errors.selectOrFallback(exception.l10nKey)`
  when a feature has an error map; otherwise use a generic failure string.
  Never show `exception.l10nKey` or `exception.toString()`.
- The list itself is `BaseListView`
  (`packages/common_ui/lib/src/components/base_list_view.dart`), which wires
  pull-to-refresh and the empty state in one widget:

  ```dart
  class const _PostsListWidget({required final List<Post> posts}) extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final l10n = context.l10n.post.list;

      return BaseListView(
        onRefresh: context.read<PostsListCubit>().getPosts,
        padding: const EdgeInsets.all(Spacings.large),
        itemCount: posts.length,
        emptyBuilder: (_) => EmptyIndicator(title: l10n.emptyIndicator.title),
        itemBuilder: (_, index) => PostCard(key: ValueKey(posts[index].id), post: posts[index]),
        separator: const Gap(Spacings.medium),
      );
    }
  }
  ```

- `onRefresh` is the same `getPosts` future, so the `RefreshIndicator` completes
  when the network call does. Do not return a cached value from it.
- `emptyBuilder` returns `EmptyIndicator`
  (`app/lib/features/_shared/presentation/widgets/empty_indicator.dart`); an
  empty list is a normal success, not a failure.

## Rebuild discipline

Split the body into private `StatelessWidget` classes, one per concern, and read
only the slice each needs:

```dart
class const _RetryButton({required final String label}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasFailed = context.select((PostsListCubit cubit) => cubit.state.posts is Failure);

    if (!hasFailed) return const SizedBox.shrink();

    return BaseButton(text: label, onPressed: context.read<PostsListCubit>().getPosts);
  }
}
```

- `context.select((Cubit c) => c.state.<narrow slice>)` rebuilds only that widget
  when the slice changes. Select a value (`is Failure`, `posts.isLoading`), not
  the whole state.
- When a widget genuinely needs the full state, use
  `BlocBuilder(buildWhen: (previous, current) => previous.<field> != current.<field>)`,
  as the login form widgets do for each text field.
- `context.read<Cubit>()` for callbacks; it does not subscribe.
- Private widgets are classes
  (`class const _PostsListWidget({required final List<Post> posts}) extends StatelessWidget`),
  not `Builder` lambdas or `build` helper methods.
- Every class uses a **primary constructor** in its header — cubits, states,
  pages, widgets, and mocks. Never declare an old-style constructor inside the
  class body:

  ```dart
  class MockPostRepository() extends Mock implements PostRepository;
  ```
- `BlocProvider(create:)` lives in `wrappedRoute`. `BlocProvider.value` is only
  for tests, which inject a `MockCubit`.

## Side effects (BlocListener)

Navigation and SnackBars belong in `BlocListener`, never in `build`:

```dart
BlocListener<LoginCubit, LoginState>(
  listenWhen: (previous, current) => previous.login != current.login,
  listener: _handleStatus,
  child: const Center(/* form */),
)
```

```dart
void _handleStatus(BuildContext context, LoginState state) {
  final l10n = context.l10n.authentication.login;

  switch (state.login) {
    case Failure(:final LocalizedException exception):
      context.showSnackBar(
        l10n.errors.selectOrFallback(exception.l10nKey),
        type: SnackBarType.error,
      );
    default:
      break;
  }
}
```

- `context.showSnackBar` and `SnackBarType` come from
  `packages/common_ui/lib/src/components/base_snack_bar.dart`, re-exported by
  `package:common_ui/common_ui.dart`.
- `listenWhen` compares the action slot so unrelated rebuilds do not re-fire the
  side effect.
- A success case can both pop and show a message, as
  `EditProfilePage._handleStatus` does with `context.router.maybePop()`.
- Keep the listener above the widgets it affects so it survives their rebuilds.
- Do not navigate or show a SnackBar from a cubit; state is data, the page
  decides the side effect.

## Gotchas

- **`Initial` vs `Loading` in the read slot.** A read that starts as `Initial`
  flashes blank; start as `Loading`. `Initial` is for actions and forms.
- **`Failure` is the error UI.** Nothing else needs to be set on failure, and
  the slot must be replaced on retry so the message disappears.
- **Never return `Resource` from a repository.** Keep the data layer free of
  presentation types.
- **`with Equatable`, not `extends`** — and list every field in `props`.
- **`copyWith` cannot set a field back to `null`.** If a nullable field must be
  cleared, add an explicit `bool clearX` flag or a sentinel.
- **One cubit per page/flow.** Create it in `wrappedRoute`; never register a page
  cubit as a singleton or provide it globally.
- **No runtime constructor arguments.** Items ids, filters, and search terms go
  into the method call.
- **Close cubits in tests** (`tearDown(() => cubit.close())`), and pass mocks
  through the constructor (`PostsListCubit(postRepository: mockRepository)`).
- **`Success.equals` compares `value`**, so the model must implement `Equatable`
  with all fields — otherwise two identical fetches look like a state change.
- **A cancelled user action is not an error.** Do not emit `Failure` for it.
- **Do not keep a second copy of the data** in a non-`Resource` field; the slot
  is the single source of truth for the screen.
