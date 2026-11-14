---
name: routing
description: Adds pages and navigation with auto_route in this app. Covers annotating pages with @RoutePage, registering routes and the four-tab Home shell in app_router.dart, the global AuthGuard and its public-route allowlist, page arguments, root routing by app state and widget deep links, and regenerating routes. Use when creating a screen or route, navigating between pages, adding a tab, passing a page argument, making a page reachable while signed out, or touching deep links.
---

# Routing

Navigation is type-safe auto_route. `app/lib/router/app_router.dart` is hand-written (`AppRouter extends RootStackRouter`, the
`routes` list); `app_router.gr.dart` is generated, committed and never edited. Codegen scans only
`lib/features/**/presentation/**.dart` (`app/build.yaml`), so a page outside that tree gets no `XRoute`. Import route classes from
`package:flutter_bloc_starter/router/app_router.dart`, which re-exports the generated file. There is one router and one
`@AutoRouterConfig`; never use `Navigator.push` or `MaterialPageRoute`.

General auto_route behavior (push, replace, navigate, pop, nested routers, transitions) is documented upstream; this file covers
only what is specific to this app.

## Adding a page

1. Annotate the page `@RoutePage()`, declare its arguments in the primary constructor, and implement `AutoRouteWrapper` when it
   owns a cubit (`wrappedRoute` creates it; see `new-feature`).
2. Add `AutoRoute(page: XRoute.page)` to `AppRouter.routes`. Nearly every page is a flat root route; the tabs are children of
   `HomeRoute`, and `NotFoundRoute` is last with `path: '*'`.
3. Run `melos gen`. The generated class is `<PageClassWithoutPage>Route`.
4. Navigate with `context.pushRoute(XRoute(...))`, which covers almost all forward navigation in the app. `context.router.push`
   is for a nested stack; `context.router.replaceAll([...])` resets the stack.

A page cubit takes no runtime arguments, so a route argument stays on the page and is passed into cubit methods.

### Arguments

| Kind | Declaration | Example |
| --- | --- | --- |
| Path | `@PathParam('id') required final String id` | `SlipDetailPage` |
| Query, optional or defaulted | `@QueryParam('kind') final String kind = 'specific'` | `SlipKindPage`, `RitualEditPage` |
| Typed object or enum | an unannotated constructor parameter | in-app only; cannot come from a deep link |

Prefer an id plus a fetch over passing a whole model, so the page works from a deep link and after a process restart.

## The Home shell

`HomePage` (`features/home/presentation/home/home_page.dart`) is an `AutoTabsRouter` with four tabs, **Today, Slips, Together,
Memories**, and a capture button between the second and third that pushes `QuickSlipRoute` on the root router. A tab is three
things that must stay in the same order: the child `AutoRoute` under `HomeRoute` in `app_router.dart`, the entry in `HomePage`'s
`AutoTabsRouter.routes`, and its icon and label (`homeTabIcons` and the `tabs` l10n keys). The capture index (`_captureIndex`)
sits in the tab bar but is not a tab route. A page inside a tab must not add the bottom or keyboard inset again: `HomePage`
and `BaseTabBar` own them.

## Signed-out access

`AuthGuard` (`router/guards/auth_guard.dart`) is a global guard. A signed-out person can open only the routes in
`publicRouteNames` (welcome, the onboarding steps, sign-in, existing account, debug sign-in, session expired, not found). Any other
route is stashed in `PendingRoute`, the person is sent to `SignInRoute`, and sign-in resumes the stashed destination.

- A page that must work signed out (a new onboarding step, say) has to be added to `publicRouteNames`, or the guard redirects it.
- Do not check authentication inside a page; leave it to the guard.

## Root routing and deep links

- `AppCubit` holds the app state, and `routeForAppState` (`features/app/presentation/navigation/app_state_navigator.dart`) maps it to
  the root route (onboarding, sign-in, home). `App` replaces the stack with `replaceAll` when the state changes. Add a new app-level
  state there, not as a navigation call from a feature.
- `App._deepLinkBuilder` handles incoming links. Widget links go through `transformWidgetDeepLinkUri` and `resolveWidgetDeepLinkUri`,
  which depend on the current app state. A cold start link that is not a widget link falls back to the root route for the state.
- Router observers (`router/observers/`: logging and analytics) are lazy singletons in `shared_injection_module.dart` and are wired
  in `app.dart`. Add a new observer there, never inside a page.

## Gotchas

- "Undefined name XRoute" means `melos gen` has not run since the page or `AutoRoute` was added.
- Removing `initial: true` from a nested level breaks the stack at startup; keep the chain valid.
- `wrappedRoute` returns the provider wrapping `this`, not a rebuilt page.
- Never edit `*.gr.dart`, and do not create a second router config.
