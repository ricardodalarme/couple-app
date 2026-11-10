---
name: routing
description: Add pages and navigation in the app with auto_route — annotate pages with @RoutePage, register AutoRoute entries (including nested children and tab routes) in app/lib/router/app_router.dart, wrap cubit-backed pages with AutoRouteWrapper, pass arguments with @PathParam/@QueryParam, navigate with context.pushRoute/context.router, and regenerate with melos gen. Use when creating a screen or route, navigating between pages, adding a bottom tab, building a wizard or nested flow, passing a page argument, or when the user mentions routes, navigation, deep links, tabs, or auto_route.
---

# Routing in the app

All navigation is type-safe auto_route. Two files matter:

- `app/lib/router/app_router.dart` — hand-written `AppRouter extends RootStackRouter`
  with the `routes` list.
- `app/lib/router/app_router.gr.dart` — generated, attached via `part`; **never
  edit**.

Routes are generated from `@RoutePage()`-annotated widgets under
`lib/features/**/presentation/**.dart` (see `app/build.yaml`). A page without
`@RoutePage()` gets no `XRoute` class and cannot be registered.

## The tab shell

`HomePage` (`app/lib/features/home/presentation/home_page.dart`) is the only
shell page. It is annotated `@RoutePage()` and renders three tabs with
`AutoTabsRouter` and the `BaseTabBar` primitive inside `BaseView`:

```dart
@RoutePage()
class const HomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: null,
      hasSafeArea: false,
      body: AutoTabsRouter(
        duration: Duration.zero,
        routes: const [PostsListRoute(), SearchRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Column(
            children: [
              Expanded(
                // The outer BaseView owns keyboard insets and the tab bar owns
                // the bottom safe area; tab pages must not add either twice.
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: MediaQuery.removeViewInsets(
                    context: context,
                    removeBottom: true,
                    child: child,
                  ),
                ),
              ),
              BaseTabBar(
                currentIndex: tabsRouter.activeIndex,
                onSelected: tabsRouter.setActiveIndex,
                items: [
                  BaseTabBarItem(icon: AppIcons.home, label: context.l10n.post.list.title),
                  BaseTabBarItem(icon: AppIcons.search, label: context.l10n.search.title),
                  BaseTabBarItem(
                    icon: AppIcons.user,
                    label: context.l10n.account.profile.title,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
```

The tab routes are children of `HomeRoute`:

```dart
AutoRoute(
  page: HomeRoute.page,
  children: [
    AutoRoute(page: PostsListRoute.page, initial: true),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: ProfileRoute.page),
  ],
),
```

**Adding a tab takes two edits that must stay in sync**: a child `AutoRoute`
under `HomeRoute` and a matching entry in `HomePage`'s
`AutoTabsRouter.routes` plus its `BaseTabBarItem` label. The child list
and the `routes` list have to be in the same order, because
`tabsRouter.activeIndex` indexes both.

Every other page (`Login`, `SignUp`, `ForgotPassword`, `Settings`, `EditProfile`,
`ChangePassword`, `PrivacyPolicy`, `TermsList`, `NotFound`) is a flat root route.
`NotFoundRoute` is registered last with `path: '*'`.

## Add a new page

1. Annotate the page and declare its arguments in the primary constructor:

```dart
@RoutePage()
class const PostDetailPage({
  @PathParam('postId') required final String postId,
  super.key,
}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PostDetailCubit>()..getPost(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) => ...;
}
```

2. Register it in `AppRouter.routes` at the right nesting level:

```dart
AutoRoute(page: PostDetailRoute.page),
```

3. Run `melos gen`.
4. Navigate to it: `context.pushRoute(PostDetailRoute(postId: postId))` — the
   generated name is `<PageClassWithoutPage>Route`.

Cubits take no runtime constructor arguments (the injector has no
`registerFactoryParam`), so a route argument stays on the page widget and is
passed into cubit methods rather than into the cubit constructor.

## AutoRoute Features & Usage

### Stack Navigation & Controls

AutoRoute exposes fine-grained control over the route stack through
`context.router` or the `context.*` extension helpers:

- **Push**: adds a route on top of the stack.
  ```dart
  context.pushRoute(PostDetailRoute(postId: id));
  context.router.push(PostDetailRoute(postId: id));
  context.router.pushAll([SearchRoute(), PostDetailRoute(postId: id)]);
  ```
- **Replace**: replaces the topmost route in the stack.
  ```dart
  context.replaceRoute(const HomeRoute());
  context.router.replace(const HomeRoute());
  ```
- **Navigate**: smart navigation — pops back to the target route when it already
  exists in the stack, otherwise pushes it. Ideal for tabs, drawers, and wizards.
  ```dart
  context.navigateTo(const SearchRoute());
  context.router.navigate(const SearchRoute());
  ```
- **ReplaceAll**: clears the entire stack and replaces it with the given routes
  (essential for post-login or post-logout resets).
  ```dart
  context.router.replaceAll([const HomeRoute()]);
  ```
- **Popping**:
  ```dart
  context.maybePop(); // pops if not at root and not blocked by PopScope
  context.router.pop(); // unconditionally pops the active router
  context.router.popTop(); // pops the top page of the topmost active router
  context.router.maybePopTop(); // safely pops the topmost router page
  context.router.popUntil((route) => route.settings.name == HomeRoute.name);
  context.router.popUntilRouteWithName(HomeRoute.name);
  context.router.popUntilRoot();
  ```
- **Stack Removal**: removes entries without pop animations or `PopScope`:
  ```dart
  context.router.removeLast();
  context.router.removeWhere((route) => route.name == TempRoute.name);
  ```

### Passing Arguments & Parameters

Arguments declared on the page constructor are extracted by codegen into
strongly typed properties on the generated `*Route`:

- **Path Parameters**: inject URL path segments into widget fields with
  `@PathParam` or `@pathParam`:
  ```dart
  @RoutePage()
  class const PostDetailPage({
    @PathParam('postId') required final String postId,
    super.key,
  }) extends StatelessWidget {
    @override
    Widget build(BuildContext context) => ...;
  }
  ```
- **Inherited Path Parameters**: child routes can inherit a parent path
  parameter instead of receiving it again:
  ```dart
  @RoutePage()
  class const PostCommentsPage({
    @PathParam.inherit('postId') required final String postId,
    super.key,
  }) extends StatelessWidget {
    @override
    Widget build(BuildContext context) => ...;
  }
  ```
- **Query Parameters**: bind optional URL parameters with
  `@QueryParam('key')` or `@queryParam`:
  ```dart
  @RoutePage()
  class const PostsFilterPage({
    @QueryParam('query') final String? query,
    super.key,
  }) extends StatelessWidget {
    @override
    Widget build(BuildContext context) => ...;
  }
  ```
- **Complex Objects**: any constructor parameter without an annotation becomes a
  typed route argument:
  ```dart
  context.pushRoute(PostDetailRoute(postId: postSummary.id));
  ```
- **Direct Parameter Access**: inspect raw parameters at runtime through
  `context.routeData.pathParams` or `context.routeData.queryParams`.

### Returning Results from Routes

Return values from a pushed screen with `push<T>()` and `maybePop<T>()`:

```dart
// calling screen
final bool? didUpdate = await context.pushRoute<bool>(const EditProfileRoute());

// target screen on completion
context.maybePop<bool>(true);
```

### Nested Navigation & Shell Outlets

Nested routes allow sub-navigation inside a parent container:

- Register child routes in `AppRouter.routes` under the parent's `children:` list.
- Place an `AutoRouter()` widget in the parent page where child pages render:
  ```dart
  class const DashboardShellPage({super.key}) extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: const [
          DashboardHeader(),
          Expanded(child: AutoRouter()), // child route renders here
        ],
      );
    }
  }
  ```
- **Shell Page Shortcut**: when the shell only wraps `AutoRouter`, extend it
  directly:
  ```dart
  @RoutePage()
  class const DashboardShellPage({super.key}) extends AutoRouter;
  ```
- **EmptyShellRoute**: create a shell route without a separate page class:
  ```dart
  const postsTab = EmptyShellRoute('PostsTab');
  ```

### Tab Navigation (AutoTabsRouter)

`AutoTabsRouter` keeps offstage tab state alive, loads tab content lazily, and
handles tab transitions. `HomePage` composes the raw router inside `BaseView`;
use the same pattern when the shell needs a custom layout:

- **Scoped controller access**:
  ```dart
  AutoTabsRouter(
    routes: const [PostsListRoute(), SearchRoute(), ProfileRoute()],
    builder: (context, child) {
      final tabsRouter = AutoTabsRouter.of(context);
      return BaseView(
        body: Column(
          children: [
            Expanded(child: child),
            BaseTabBar(
              currentIndex: tabsRouter.activeIndex,
              onSelected: tabsRouter.setActiveIndex,
              items: [/* BaseTabBarItem entries */],
            ),
          ],
        ),
      );
    },
  )
  ```
  `BaseTabBar` takes `items` (`List<BaseTabBarItem>`, each with an `icon` and a
  `label`), `currentIndex`, and `onSelected`. `removeBottom: true` on the page
  area stops the tab page's `SafeArea` from adding the bottom inset twice; the
  tab bar owns that inset.
- **PageView tabs**: `AutoTabsRouter.pageView(routes: [...], builder: ...)` for
  swipeable tab content.
- **TabBar tabs**: `AutoTabsRouter.tabBar(routes: [...], builder: ...)` when a
  `TabController` drives the tabs.

### Scoped Routers & Router Hierarchy

Each nested `AutoRouter` creates its own scoped routing controller in the widget
tree:

- `context.router`: the closest parent router controller.
- `context.router.root`: the root `StackRouter`.
- `context.router.parent<T>()`: the parent router typed as `StackRouter` or
  `TabsRouter`.
- `context.innerRouterOf<T>(RouteName)`: an inner router reached from outside its
  subtree, without passing a `GlobalKey`.
- `context.topRoute.name`: the active route's name.

### Route Guards & Protection

Guards act as navigation middleware that checks a condition (auth, verification)
before a route enters the stack:

```dart
class AuthGuard() extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      resolver.next(true); // continue navigation
    } else {
      // redirect to login and resume the original destination on success
      resolver.redirectUntil(
        LoginRoute(onResult: (success) => resolver.next(success)),
      );
    }
  }
}
```

- `resolver.next()` must be called exactly once per evaluation.
- Attach a guard to specific routes:
  `AutoRoute(page: EditProfileRoute.page, guards: [AuthGuard()])`.
- Global guards: override `List<AutoRouteGuard> get guards` in `AppRouter`.
- Re-evaluate guards when auth changes with `reevaluateListenable`:
  ```dart
  router.config(reevaluateListenable: authNotifier);
  ```

### Route Wrapping (AutoRouteWrapper)

Attach dependencies and cubits to a route's lifecycle by implementing
`AutoRouteWrapper`. The widget returned from `wrappedRoute` must wrap `this` as
its child. This is the shape every cubit-backed page uses, including
`PostsListPage`:

```dart
@RoutePage()
class const PostsListPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PostsListCubit>()..getPosts(),
      child: this,
    );
  }
}
```

### Route Observers & Lifecycle (AutoRouteAware)

Track transitions and tab switches per page with `AutoRouteAwareStateMixin`:

```dart
class _PostDetailPageState() extends State<PostDetailPage>
    with AutoRouteAwareStateMixin<PostDetailPage> {
  @override
  void didPopNext() {
    // the page above this one was popped and this page is visible again
  }

  @override
  void didPushNext() {
    // a new route was pushed on top of this page
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    // this page's tab became active in a tabs router
  }
}
```

App-wide observers live in `app/lib/router/observers/` (`LogRouterObserver`
extends `NavigatorObserver`, `AnalyticsRouterObserver` extends
`AutoRouterObserver`). They are lazy singletons in `shared_injection_module.dart`
and are wired in `app.dart` through
`routerConfig: appRouter.config(navigatorObservers: ...)` — register a new
observer there, not inside a page.

### Custom Transitions & Route Builders

Customize animation and page route builders per route with `CustomRoute`:

```dart
CustomRoute(
  page: PostDetailRoute.page,
  transitionsBuilder: TransitionsBuilders.slideBottom,
  duration: const Duration(milliseconds: 300),
)
```

- `TransitionsBuilders` ships presets (`slideBottom`, `fadeIn`, `zoomIn`, …).
- Custom builders take `(context, animation, secondaryAnimation, child)`.

### Declarative Navigation

Drive the route stack reactively from app state with `AutoRouter.declarative`:

```dart
AutoRouter.declarative(
  routes: (handler) => [
    const PostsListRoute(),
    if (selectedPostId != null) PostDetailRoute(postId: selectedPostId!),
  ],
)
```

The root `App` does the same thing at the router level: `AppCubit` picks
`OnboardingRoute`, `LoginRoute`, or `HomeRoute` in `_resolveRouteForState` and
`_onAppStateChanged` calls `appRouter.replaceAll([resolvedRoute])`. A deep link
goes through `_deepLinkBuilder`.

### Navigation Helpers & UI Components

- **AutoLeadingButton**: an app-bar leading button that detects whether to pop an
  inner tab, the parent stack, or render nothing. It is a `Widget`, so it goes in
  an app bar's `leading` slot. `BaseView` does not expose a `leading` slot;
  compose the header in the page and pass it as `BaseView.appBar` — never
  reach into `packages/design_system` for a page shell.
- **AutoBackButton.builder**: custom back button that hands you a nullable
  `leading` widget, so the layout does not jump when nothing can pop.
- **ActiveGuardObserver**: listen to whether a guard is resolving, for global
  loading indicators:
  ```dart
  context.router.activeGuardObserver.addListener(() {
    final isChecking = context.router.activeGuardObserver.guardInProgress;
  });
  ```

## Navigation recipes

| Goal | Call |
| --- | --- |
| Push a page | `context.pushRoute(PostDetailRoute(postId: id))` |
| Push/replace within a nested stack | `context.router.push(PostDetailRoute(postId: id))` |
| Wizard/tab step advance | `context.router.navigate(const StepRoute())` |
| Back | `context.router.pop()` or `context.router.maybePop()` |
| Reset stack (post-auth) | `context.router.replaceAll([const HomeRoute()])` |
| Push any widget (dev tools) | `context.router.pushWidget(const DevMenuPage())` |

Prefer the shortest form already used in the file you are editing. `pushRoute`
covers almost all forward navigation.

## Gotchas

- The directory is `app/lib/router/`, not `lib/routes/`.
- A missing `melos gen` after adding `@RoutePage()` or `AutoRoute` produces
  "undefined name XRoute" errors — regenerate first.
- `app_router.gr.dart` and every other `*.gr.dart` file are committed; never
  hand-edit them and never create a second `@AutoRouterConfig` router.
- Codegen only scans `lib/features/**/presentation/**.dart`; a page outside that
  tree generates no route.
- Import route classes from `package:flutter_bloc_starter/router/app_router.dart`
  (it re-exports the generated file).
- Never construct `MaterialPageRoute` or call `Navigator.push` directly — always
  go through auto_route.
- Keep the `initial: true` route chain valid: removing it from a nested level
  breaks the stack at startup.
- The tab routes are children of `HomeRoute`, and `HomePage`'s
  `AutoTabsRouter.routes` repeats them. Adding or reordering a tab means
  updating the child `AutoRoute` list, the `routes` list, and the
  `BaseTabBarItem` list together; a drift between them misroutes the selected
  index.
- `wrappedRoute` must return the provider wrapped around `this`; returning a
  rebuilt page instead of `this` breaks the route's state identity.
