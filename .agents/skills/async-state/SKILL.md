---
name: async-state
description: Implement Cubit state management in this app with the sealed Resource pattern (Initial/Loading/Success/Failure), one-shot Future repository reads, Equatable part-file state classes, read slots rendered by SkeletonizerResourceWidget (skeleton from a model fake, BaseEmptyState on failure), private rebuilding widgets that read narrow slices with context.select/context.read, and BlocListener side effects. Use when creating or editing a Cubit or its state, wiring loading/error/empty states, adding skeleton loaders, showing a failure SnackBar, or whenever code mentions Resource, emit, Success, Failure, SkeletonizerResourceWidget, Skeletonizer, or posts.
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
   → SkeletonizerResourceWidget<List<Post>>(posts, fakeValue, successBuilder, failureBuilder)
        Initial  → SizedBox.shrink()
        Loading  → Skeletonizer(successBuilder(fakeValue))  (reuses the last Success on refresh)
        Success  → successBuilder(value)                    (InfiniteListView, BaseEmptyState when empty)
        Failure  → failureBuilder(exception)                (BaseEmptyState with retry)

action / form submit:
page → cubit.submit(): emit <slot> Loading → await repo → emit Success
                                                  catch → emit Failure → emit Initial
   → BlocListener shows an app toast for Failure; Success navigates
```

## Resource rules

`Resource<S>` lives in `packages/core/lib/src/utils/resource.dart` and is
exported by `package:core/core.dart`:

- `Initial()` — nothing requested, or reset after a handled result. Default for
  **action / form slots**. `SkeletonizerResourceWidget` renders it as
  `SizedBox.shrink()`.
- `Loading()` — in flight. Default for **read slots**, so the skeleton is the
  first frame instead of a flash of empty content.
  `SkeletonizerResourceWidget` turns it into a skeleton over the fake value.
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
- Form states hold `FormInput<String>` fields from `package:form_inputs` and
  mix in only `Equatable`. Change handlers emit `FormInput(value)`, which clears
  that field's error. Validation runs on submit: the cubit emits the validated
  state, returns early when any input is invalid, and only then performs the
  action. Validate with `NonEmptyValidator`, `EmailValidator`,
  `PasswordValidator`, `ConfirmValueValidator`, or `CompositeValidator`.
  Widgets read `state.email.errorName` for `errorText`; submit buttons stay
  enabled and are not gated on validity. Canonical form state:
  `app/lib/features/authentication/presentation/login/cubit/login_state.dart`.

## Page consumption

The page creates the cubit in `wrappedRoute` (see `routing`) and hands the read
slot to `SkeletonizerResourceWidget`, which owns every `Resource` branch. Real
code from `app/lib/features/post/presentation/list/posts_list_page.dart`:

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

- The page does **not** switch over the `Resource`. `SkeletonizerResourceWidget`
  (`packages/common_ui/lib/src/widgets/skeletonizer_resource_widget.dart`)
  is the default renderer for a read slot and handles every branch:
  `Initial` → `SizedBox.shrink()`, `Loading` → `Skeletonizer` over
  `successBuilder(fakeValue)`, `Success` → `successBuilder(value)`, `Failure` →
  `failureBuilder(exception)`.
- `fakeValue` is passed to `successBuilder` while loading, so it must be
  structurally representative of the real value: a single model
  (`Post.fake`) or a list of them (`List.filled(6, Post.fake)`). Keep the list on
  the page as a `static final` so it is allocated once. A fake with a different
  shape produces a skeleton that jumps when the data arrives.
- Do not wrap the widget in another `Skeletonizer`; it already applies one while
  loading. Nested skeletonizers double the shimmer and break the loading
  semantics.
- `failureBuilder` receives the `LocalizedException`, so build a
  `BaseEmptyState` (`title`, `text`, `actionText`, `onAction`, `face: FaceKind.sad`)
  inside it. The retry callback is the same cubit method that produced the
  failure.
- While loading, the widget wraps the content in
  `Semantics(liveRegion: true, label: context.l10n.common.loading)` and excludes
  the fake content from semantics. Do not re-announce loading from the page.
- The widget keeps the last `Success` value as the skeleton input when the slot
  goes back to `Loading`, so a refresh keeps the current content on screen
  instead of flashing a skeleton. Do not add a separate "refreshing" state or an
  `isRefreshing` flag for that.
- `context.select` selects only the resource slot, so the page rebuilds when the
  slot changes and not on unrelated cubit state.
- Localize a feature-specific message with
  `context.l10n.<feature>.<scope>.errors.selectOrFallback(exception.l10nKey)`
  when the feature has an error map; otherwise use a generic failure string.
  Never show `exception.l10nKey` or `exception.toString()`.
- The list itself is `InfiniteListView`
  (`packages/common_ui/lib/src/widgets/infinite_list_view.dart`), which owns the
  pagination trigger and pull-to-refresh. It has no `emptyBuilder`: handle zero
  items at the call site by rendering a single `BaseEmptyState` row:

  ```dart
  class const _PostsListWidget({required final List<Post> posts}) extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final l10n = context.l10n.post.list;

      return InfiniteListView(
        onRefresh: context.read<PostsListCubit>().getPosts,
        padding: const EdgeInsets.all(AppSpace.screenMargin),
        itemCount: posts.isEmpty ? 1 : posts.length,
        onFetchData: () {},
        hasNextPage: false,
        isLoading: false,
        itemBuilder: (_, index) => posts.isEmpty
            ? BaseEmptyState(
                title: l10n.emptyIndicator.title,
                text: l10n.emptyIndicator.text,
              )
            : PostCard(key: ValueKey(posts[index].id), post: posts[index]),
        separator: posts.isEmpty ? null : const SizedBox(height: AppSpace.s12),
      );
    }
  }
  ```

- `onRefresh` is the same `getPosts` future, so the `RefreshIndicator` completes
  when the network call does. Do not return a cached value from it.
- The empty row is a `BaseEmptyState`; an empty list is a normal success, not a
  failure.

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
- Use `context.select` for **every** state read in a widget. Do not add
  `BlocBuilder`, `BlocSelector`, or `buildWhen` anywhere in `app/lib`; those
  rebuild more than the slice and duplicate what `context.select` already does.
  Form fields select their own field:

  ```dart
  final currentPassword = context.select(
    (ChangePasswordCubit cubit) => cubit.state.currentPassword,
  );
  ```

- If one widget needs several slices, call `context.select` once per slice (or
  select a record); do not fall back to `BlocBuilder`.
- The page selects the whole read slot
  (`cubit.state.posts`) and passes it to `SkeletonizerResourceWidget`; the
  widgets built by `successBuilder` select narrower slices of their own and never
  the slot again.
- `context.read<Cubit>()` for callbacks; it does not subscribe. `BlocListener`
  remains the tool for side effects (SnackBars, navigation), never for rebuilds.
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
      BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
    default:
      break;
  }
}
```

- `BaseToast.show(context, message)` inserts the toast in the root overlay and
  dismisses it after four seconds; the old success/error tones collapse to the
  one neutral tone. The app does not wrap it in a helper.
- `listenWhen` compares the action slot so unrelated rebuilds do not re-fire the
  side effect.
- A success case can both pop and show a message, as
  `EditProfilePage._handleStatus` does with `context.router.maybePop()`.
- Keep the listener above the widgets it affects so it survives their rebuilds.
- Do not navigate or show a SnackBar from a cubit; state is data, the page
  decides the side effect.

## Gotchas

- **`SkeletonizerResourceWidget` renders the read slot.** Do not hand-write a
  `switch` over the `Resource` and do not wrap the widget in another
  `Skeletonizer`; it already owns `Initial`/`Loading`/`Success`/`Failure`.
- **`fakeValue` must match the real shape.** It is passed to `successBuilder`
  while loading, so a list slot needs a list of model fakes, not one model.
- **A refresh is not a new state.** The widget reuses the last `Success` value as
  the skeleton input while the slot is `Loading`; do not add an `isRefreshing`
  flag or a separate refreshing state.
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
