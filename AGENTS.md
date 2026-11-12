# AGENTS.md

Flutter monorepo template for **Flutter Bloc Starter**. The app lives in `app/`
(package `flutter_bloc_starter`); shared code lives in `packages/`. Uses Melos
with pub workspaces.

This is a generic starter, not a product repository. There is no product
blueprint or brand book in this repo. The backend is a schema-first Supabase
project under `supabase/` with `pg_graphql`; the starter's domain is deliberately
small (a public `posts` feed). When a requirement is unclear, ask instead of
inventing product behavior.

Before working in an area, load the matching skill in `.agents/skills/` — the
skills contain the full conventions, templates, and gotchas. This file is the
always-on summary. Skills use the generic `SKILL.md` format, so any
Agent-Skills-compatible tool can load them.

## Commands (run from the repo root)

| Command                                                                                  | What it does                                                                       |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `melos bootstrap`                                                                        | Install deps + hooks, copies `.env.example` → `.env.development`                   |
| `melos get`                                                                              | `flutter pub get`                                                                  |
| `melos gen`                                                                              | build_runner for routes, GraphQL and generated assets (required before analyze)    |
| `melos l10n`                                                                             | Regenerate app + design-system slang translations                                  |
| `melos l10n:analyze`                                                                     | Fails on missing/unused translation keys (CI + pre-push)                           |
| `melos lint`                                                                             | `flutter analyze` + format check                                                   |
| `melos test`                                                                             | Run tests in every workspace package only (app + packages).                         |
| `melos format`                                                                           | Format all Dart files (100-col page width)                                         |
| `cd app && flutter test test/path_test.dart [--plain-name "..."]`                        | Single test file                                                                   |
| `cd packages/core && dart test`                                                          | Pure-Dart package tests                                                            |
| `cd packages/design_system && flutter test`                                                         | Flutter package tests                                                              |
| `cd packages/common_ui && flutter test`                                                  | Shared widget tests                                                                |
| `cd app && flutter run --dart-define-from-file ../.env.development --flavor development` | Run the app (VSCode F5 works too)                                                  |

Melos config is the `melos:` key in the **root `pubspec.yaml`** — there is no
`melos.yaml`. Generated files are committed; CI does not run codegen.

### Supabase

| Command | What it does |
| --- | --- |
| `supabase link --project-ref rqrntvjatuwbmostkpao` | One-time link to the starter project |
| `supabase start` / `supabase stop` | Start/stop the local stack (ports `553xx`) |
| `supabase db reset --local` | Replay migrations + seed into the local database |
| `supabase test db` | Run the pgTAP tests in `supabase/tests/` |
| `supabase db push --remote --include-all` | Apply committed migrations to the linked project |
| `melos graphql:schema` | Download the GraphQL SDL from the configured Supabase endpoint |

`melos graphql:schema` runs an inline shell command in the root
`pubspec.yaml`. It reads `SERVER_URL` and `SERVER_API_KEY` from
`.env.development` and calls the npm `get-graphql-schema` CLI. Install it
globally with `npm install -g get-graphql-schema@2.1.2`. For schemas with
authenticated-only tables (notifications), also set `SCHEMA_AUTH_TOKEN` to a
service-role token; the script sends it as a Bearer header.

`supabase db schema declarative sync` is local-only and requires Docker. When
Docker is unavailable, edit the declarative schema and migration together and
keep them in sync.

## Repository layout

```text
app/          # Flutter app, package flutter_bloc_starter
packages/     # core, network, design_system, common_ui, form_inputs, formatters, logger, services/*
supabase/     # schema-first database, migrations, seed, pgTAP tests
docs/         # contributing, dependency injection, localization, navigation notes
.agents/      # skills (SKILL.md) and agent instructions
```

Firebase client configuration is committed per flavor:
`app/android/app/src/{development,production}/google-services.json` and
`app/ios/config/{development,production}/GoogleService-Info.plist`. Keep those
files aligned with the Firebase dev and production projects; the startup
initializers initialize Firebase through the native flavor config.

## App architecture

```text
app/lib/
├── main.dart              # entrypoint, DI registration, startup pipeline, runApp
├── infrastructure/        # app-wide technical concerns
│   └── initializers/      # startup steps ordered by declared dependencies
├── app.dart               # root widget + AppCubit routing
├── features/<feature>/    # feature-first
│   ├── di/<feature>_injection_module.dart
│   ├── data/
│   │   ├── data_sources/  # queries/, fragments/, generated/, XDataSource
│   │   ├── models/        # hand-written Equatable models with `fake`
│   │   ├── mappers/       # generated type → model extensions
│   │   └── repositories/  # concrete classes, Logger, rethrow/map exceptions
│   └── presentation/
│       ├── <page_or_sub_feature>/ # always a folder: <name>_page.dart + cubit/ + widgets/
└── router/app_router.dart # auto_route config
```

The canonical feature is `post`: a GraphQL read with `PostDataSource`,
`PostRepository`, `PostsListCubit`, `PostsListState`, and a page that renders the
`Resource` state with `SkeletonizerResourceWidget` plus `BaseEmptyState` for
empty and failure. `notifications` follows the same one-shot pattern with a
separate unread badge cubit.

### Navigation shell

The app has three primary tabs, rendered by `HomePage` with `AutoTabsRouter`
and `BaseTabBar`:

**Posts · Search · Profile**

- `HomePage` is a `@RoutePage()` and its tab routes are nested under `HomeRoute`
  in `app/lib/router/app_router.dart`: `PostsListRoute` (initial), `SearchRoute`,
  and `ProfileRoute`.
- Adding a tab requires both a child `AutoRoute` under `HomeRoute` and an entry
  in `HomePage`'s `AutoTabsRouter.routes`; keep the two lists in sync.
- All other pages (`Login`, `SignUp`, `Settings`, `EditProfile`,
  `ChangePassword`, `Notifications`, `PrivacyPolicy`, `TermsList`, `NotFound`)
  are flat root routes.

### State, UI, DI

- **State**: Cubit + `Resource<T>` (`Initial`/`Loading`/`Success`/`Failure`).
  Name read slots after the data they hold (e.g. `posts`) and action slots with
  an `Action` suffix (e.g. `saveAction`). Reads start as `const Loading()`;
  actions start as `const Initial()`. On failure, emit
  `Failure.fromObject(exception)`. A cubit that handles a one-shot mutation may
  emit `const Initial()` after a handled `Failure` so a `BlocListener` can fire
  again.
- **Reads are Futures**: a cubit awaits a repository `getX()` that returns the
  model; the repository wraps a one-shot GraphQL query in `validateResponseData`.
  There is no `watchX`/stream convention in the current app.
- **UI**: pages are `@RoutePage()` + `AutoRouteWrapper`, create their cubit in
  `wrappedRoute`, render read slots with `SkeletonizerResourceWidget` (a fake
  value plus success and failure builders), and split UI into private widgets
  that read narrow slices with `context.select`. Use `context.select` for state
  reads — do not add `BlocBuilder`, `BlocSelector`, or `buildWhen`. Use a manual
  `switch` over the `Resource` only for one-off cases. Every page starts with
  `BaseView(appBar: BaseAppBar(...), body: ...)`, the padding-free page
  shell. `appBar` defaults to a bare `BaseAppBar`, so stack routes get a
  back button without page code; pass `appBar: null` only when the screen owns
  the full screen. The body is a design-system content widget (`BaseFlowContent`,
  `BaseStackedContent`, `BaseMomentContent`, `BaseTabContent`) for scrolling
  content, or the page's own viewport (infinite lists, `WebView`, `PageView`,
  dynamic lists). `BaseAppBar` adds the back button automatically when the
  route can pop; use `onClose` only for a modal-style dismissal. Text fields
  use `BaseTextField`/`BaseTextArea` with `text` + `onChanged`, and transient
  confirmations use `BaseToast.show`.
- **DI**: one `InjectionModule` per feature, registered in
  `main.dart::_registerModules()`; data sources/repositories/services are lazy
  singletons, cubits are factories.
- **Startup**: initialization steps are `Initializer`s under
  `app/lib/infrastructure/initializers/`, ordered by their declared
  dependencies. `main.dart` composes and runs the pipeline; add new startup
  work as an initializer, not inline in `main.dart`.
- **Errors**: `LocalizedException(l10nKey:)` from data layers, shown via
  `context.l10n.<namespace>.<errors>.selectOrFallback(exception.l10nKey)`.
- **Tests**: `app/test` mirrors `app/lib`; `blocTest` + `mocktail` + `pumpApp`.

### Constructors

Use Dart **primary constructors** — the constructor lives in the class header:

```dart
class const PostCard({required final Post post, super.key}) extends StatelessWidget {
  final Post post;
  // ...
}

class PostRepository({required final PostDataSource _postDataSource}) {
  final PostDataSource _postDataSource;
  // ...
}
```

Never use the old separate-constructor style
(`const PostCard({required this.post});` inside the class body). The same rule
applies to cubits, states, pages, widgets, mocks, and services. Keep `const`,
`factory`, and initializer-list forms in the class header where the language
allows them; use the body only for initializers and behavior.

## Data rules

- **The starter's feature data uses GraphQL** (pg_graphql). The shared schema
  snapshot lives at `app/lib/features/_shared/data/data_sources/schema.graphql`;
  features add their own `queries/` and `fragments/` files under
  `data/data_sources/`. `RestClient` exists for REST integrations; prefer
  GraphQL for feature reads unless the API requires REST.
- **`supabase/schemas/` is the database source of truth.** Edit the declarative
  schema first, generate/review a migration, and keep the two together. The
  starter's `posts` table is public-read only; new tables need explicit grants
  and RLS policies.
- **Notifications are backend-created.** `authenticated` can select its own rows
  and update only `read_at`; `anon` has no access and clients never insert
  notifications. Producers use the service role or a security-definer function.
- **Push tokens are backend-only.** `device_tokens` has no client grants; the app
  registers its FCM installation through `register_device_token` and removes it
  through `unregister_device_token`. `NotificationService` wraps FCM and registers
  tokens after auth. iOS still needs the Push Notifications capability and an
  APNs key in Firebase; the app does not auto-prompt for notification permission.
- **Refresh the GraphQL snapshot after a schema change**: `melos graphql:schema`
  then `melos gen`. The snapshot is generated from the linked project as the
  `authenticated` role; never hand-edit it.
- **Never put a `service_role` or secret key in the app.** Use the project's
  publishable key for `SERVER_API_KEY` and `SUPABASE_ANON_KEY`.
- **Codegen owns generated types.** Run `melos gen` after editing a `.graphql`
  file. Never edit `generated/` by hand.
- Data sources are concrete classes that call `GQLClient` from
  `package:network/network.dart`, wrap one-shot queries with
  `validateResponseData`, and never let generated GraphQL types escape the data
  layer.
- Repositories are concrete classes with a `Logger`, return domain models, and
  map third-party failures to `LocalizedException`. There is no
  repository-interface layer.
- **No invented server data.** Empty, loading, and unavailable states are
  honest. `Model.fake` values exist only as skeleton placeholders behind
  `Skeletonizer`; never render them as real records. `supabase/seed.sql` is
  development-only.
- A feature that needs a new backend surface edits `supabase/schemas/` and adds a
  migration first. Ask before inventing a new table, query, or mutation.

## Design system

`packages/design_system` is the only UI layer the app may use; Material and Cupertino exist
inside that package only. There is no separate design-system document in this
repo — the tokens and components are the source of truth.

Import everything UI-related from `package:design_system/design_system.dart`. The root is
`BaseApp.router`, which installs `MaterialApp.router`, owns the root
`DefaultTextStyle`, and defaults to `GlobalMaterialLocalizations.delegates` from
`material_ui`; the barrel also re-exports `flutter/widgets.dart`, `ThemeMode`,
`GlobalMaterialLocalizations`, `skeletonizer`, `flutter_svg`,
`cached_network_image_ce`, the icons, the tokens and the `Base*` components.
Do not import `flutter_localizations` in app code.

Use semantic colors (`context.colors`), text styles (`context.text`), and the
token constants (`AppSpace`, `AppRadius`, `AppBorder`, `AppMotion`,
`AppIconSize`) — never raw colors or magic numbers.

Loading is `BaseLoadingDots`; pull-to-refresh uses its own arc ring inside
`BaseRefreshable`. Never use a rounded spinner (`CircularProgressIndicator`,
`CupertinoActivityIndicator`, or `RefreshIndicator`'s spinner).

- `packages/design_system/lib/src/components` holds **domain-blind building-block nouns**
  (`Base*`).
- `packages/common_ui` holds shared non-design widgets: `SkeletonizerResourceWidget`,
  `BaseListView`, `InfiniteListView`, `WebView` and the generated `Assets`.
  They depend on app-level types or third-party packages, never on the feature
  layer. Every page starts with `design_system`'s `BaseView(appBar:, body:)`; scrolling
  content uses the content widgets (`BaseFlowContent`, `BaseStackedContent`,
  `BaseMomentContent`, `BaseTabContent`) and `BaseEmptyState` for empty and
  failure states.
- Apply the `design-system` skill before creating, moving, or promoting any
  reusable widget.

## Hard rules

1. **Never** import `flutter/material.dart` or `flutter/cupertino.dart` in
   `app/lib`. Use `package:design_system/design_system.dart`; new components go in `packages/design_system`.
   `material_ui` is re-exported from the barrel, never imported directly in
   `app/lib`. Never use `Scaffold`, `AppBar`, `MaterialApp` or `AutoTabsScaffold`
   in app code; `BaseView` and `BaseApp` own them.
2. Cubits, not Blocs. No domain/usecase layer, no repository interfaces, no
   freezed/json_serializable/injectable.
3. Cubits take no runtime constructor arguments (`Injector` has no
   `registerFactoryParam`); pass ids into methods or use route params.
4. Every new `InjectionModule` must be added to `main.dart::_registerModules()`
   or `AppInjector.instance.get<T>()` fails at runtime.
5. All user-facing strings come from slang. App strings live at
   `app/lib/l10n/en/<namespace>.json` with a `pt/<namespace>.json` sibling
   (shared keys in `common.json`). Design-system strings live at
   `packages/design_system/lib/src/l10n/en/<namespace>.json` with a `pt` sibling and are
   read through `context.designSystemL10nOrBase`. File names are the namespace and must be
   unique within their package. Run `melos l10n` then `melos l10n:analyze`.
6. Never hand-edit generated files (`*.g.dart`, `*.gr.dart`, `*.gen.dart`,
   `*.graphql.dart`, `translations*.dart`). Run `melos gen`/`melos l10n` and
   commit outputs.
7. Do not edit `docs/` as part of code tasks.
8. New `Base*` components go in `packages/design_system/lib/src/components` with a
   Storybook example and a test; shared non-design widgets go in
   `packages/common_ui`. New widgets there do not take the `Base*` prefix
   (`BaseListView` keeps its existing name).
9. Use Dart primary constructors everywhere (see §State, UI, DI → Constructors).
   Do not add a separate constructor body just to assign fields.
10. Imports are always `package:` imports, never relative package imports.
11. Read widget state with `context.select` and act with `context.read`. Do not
    add `BlocBuilder`, `BlocSelector`, or `buildWhen` anywhere in `app/lib`;
    `BlocListener` is only for side effects.
12. A feature's `presentation/` never holds files directly. Every page lives in
    its own subfolder (`presentation/<page_or_sub_feature>/<name>_page.dart` with
    `cubit/` and `widgets/` beside it), even when the feature has a single page,
    because features grow more pages. Tests mirror the same paths.

## Comments

Default to none. Write one only when the code cannot say it, and keep it to a
short sentence. Describe the declaration in front of you — not its history, its
consumers, or why it changed.

- `///` is for public API whose contract is not obvious from the name: what it
  is, invariants, units, thrown errors. No `@param`/`@return`/`@throws`.
- `//` is only for a non-obvious why — a workaround, invariant or ordering
  requirement. One line; if it needs more, simplify the code.
- Never restate the name or next line, narrate steps, add banners, keep
  commented-out code, or mention a feature, page, cubit or consumer.
- No diff notes: "now", "no longer", "previously", "moved", "used to", "still".
  A comment must stand on its own.
- Keep a comment local to its declaration; never edit another comment to
  explain a change.
- Properties start with a noun phrase, booleans with "Whether", methods with a
  third-person verb. Link identifiers with `[Symbol]`; backtick literals.
- Every `// ignore:` states the lint and a short reason.

## Skills

| Skill                  | Use when                                                                                                               |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `new-feature`          | Adding any feature, screen, page, or flow                                                                              |
| `async-state`          | Cubits, `Resource`, loading/error UI, skeletons, `context.select`                                                      |
| `data-layer`           | GraphQL, data sources, models, mappers, repositories                                                                   |
| `localization`         | Adding/fixing UI strings and translations                                                                              |
| `routing`              | Pages, routes, navigation, wizard/tab flows, route args                                                                |
| `dependency-injection` | Registering/resolving dependencies, DI modules                                                                         |
| `testing`              | Writing or running tests                                                                                               |
| `storybook`            | Widgetbook (Storybook) examples for components/widgets                                                                 |
| `design-system`        | Any UI, styling, tokens, `design_system`, colors/typography; component-vs-pattern boundary, `Base*` naming, library audits        |
| `package`              | New workspace package or third-party SDK wrapper                                                                       |
| `supabase`             | Schema-first changes, migrations, RLS/grants, pgTAP, pg_graphql, GraphQL snapshot refresh                              |
