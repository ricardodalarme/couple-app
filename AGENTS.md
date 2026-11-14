# AGENTS.md

**Repara** is a mobile app for couples, in Brazilian Portuguese first and English second. Each person quietly saves
small good things the partner did ("slips"); the app turns them into a weekly Sunday card, helps repair after a fight and keeps
dates and memories. It is a Flutter monorepo (Melos, pub workspaces): the app is in `app/`, shared code in `packages/`, the
backend in `supabase/` (Postgres, GraphQL through `pg_graphql`, Edge Functions).

"Repara" is a working name. The Dart package (`flutter_bloc_starter`), the bundle IDs and the Firebase configs keep the
template's names on purpose until the owner picks the final name. Do not rename them, and do not create Firebase, RevenueCat or
store projects named after the product before that.

Before working in an area, load the matching skill from `.agents/skills/` (table at the end). Skills hold the templates and
gotchas; this file holds the rules that always apply. When a requirement is unclear, ask instead of inventing product
behavior.

## Product rules that constrain the code

- **Whoever produces data decides who sees it.** Slips, moods, partner notes and cycle data are private until shared, item by
  item. RLS enforces it; the app never fetches what it must not show.
- **Never score the relationship.** No health score, no "who did more", no predictions. Metrics are individual and opt-in.
- **No guilt, no surveillance.** No real-time location, no reading messages, no partner activity history.
- **Works with one person.** Everything that can work alone does. The partner joins by invite code or a guest link.
- **Safety content stays on the device.** Nothing about safety triage is stored on the server.
- **Honest states.** Empty, loading and unavailable states say what is true. Never invent data, help-line numbers or medical or
  therapeutic claims; use the approved copy and flag gaps to the owner.

Product, design and ticket documents are in `.work/` (local only, never committed): start with `.work/FRONTEND_PROMPT.md`.

## Commands (repo root)

| Command | What it does |
| --- | --- |
| `melos bootstrap` | Install dependencies and git hooks |
| `melos get` | `flutter pub get` in every package |
| `melos gen` | `build_runner` for routes, GraphQL and assets; run it before analyzing |
| `melos l10n` | Generate the app and design-system slang translations |
| `melos l10n:analyze` | Fail on missing or unused translation keys |
| `melos lint` | `flutter analyze` plus the format check |
| `melos format` | `dart format` on all Dart files |
| `melos test` | Run every package's tests in random order (`very_good test`) |
| `cd app && flutter test test/path_test.dart [--plain-name "..."]` | One test file |
| `cd app && flutter run --dart-define-from-file ../.env.development --flavor development` | Run the app |

Melos is configured under `melos:` in the root `pubspec.yaml` (there is no `melos.yaml`). Generated files are committed and CI
does not run codegen.

Supabase commands, the schema layout and the migration workflow are in `supabase/README.md` and the `supabase` skill. Run
`supabase test db` only against the local stack, and push to the linked project only when the owner asks.

## Repository layout

`app/` (package `flutter_bloc_starter`, flavors `development` and `production`), `packages/` (`core`, `network`, `design_system`,
`common_ui`, `form_inputs`, `formatters`, `logger`, `services/*`), `supabase/`, `.agents/skills/`.

Firebase client configuration is committed per flavor: `app/android/app/src/{development,production}/google-services.json` and
`app/ios/config/{development,production}/GoogleService-Info.plist`. Firebase is initialized from the native flavor config.

## App architecture

`app/lib` is feature-first: `features/<feature>/{di,data/{data_sources,models,mappers,repositories},presentation/<page>}`, plus
`infrastructure/` (config, initializers), `router/app_router.dart`, `main.dart` and `app.dart`. `features/gifts` is the reference.

**Navigation.** `AppRouter` has a global auth and onboarding guard. `HomePage` is an `AutoTabsRouter` with four tabs, **Today,
Slips, Together, Memories**, and a capture button in the middle that pushes `QuickSlipRoute` on the root router. Every other page,
including the widget-extension screens, is a flat root route. Adding a tab needs both a child route under `HomeRoute` and an
entry in `HomePage`'s `routes`; keep the two in sync.

**State.** Cubit with `Resource<T>` (`Initial`, `Loading`, `Success`, `Failure`). Name read slots after the data (`slips`) and
action slots with an `Action` suffix (`saveAction`). Reads start as `const Loading()`, actions as `const Initial()`. On failure
emit `Failure.fromObject(exception)`. Reads are Futures: a cubit awaits a repository `getX()`; there is no stream convention.

**UI.** Pages are `@RoutePage()` plus `AutoRouteWrapper` and create their cubit in `wrappedRoute`. Read state with
`context.select`, act with `context.read`, and use `BlocListener` only for side effects. Render read slots with
`SkeletonizerResourceWidget` (a fake value plus success and failure builders) and `BaseEmptyState`. Every page is
`BaseView(appBar:, body:)`; the body is a design-system content widget (`BaseFlowContent`, `BaseStackedContent`,
`BaseMomentContent`, `BaseTabContent`) or the page's own viewport. A sheet with form state gets its own cubit in a
`BlocProvider` inside the sheet.

**Forms.** Fields back `FormInput<T>` values from `package:form_inputs`. A cubit has one `_validate()` that validates every
field and returns whether all are valid; `save()` calls it first. Submit buttons stay enabled; only a loading action disables
them. Field errors come from a per-field l10n map.

**DI.** One `InjectionModule` per feature, added to `main.dart::_registerModules()`. Data sources, repositories and services are
lazy singletons; cubits are factories with no runtime arguments.

**Startup.** New startup work is an `Initializer` under `infrastructure/initializers/`, never inline in `main.dart`.

**Errors.** Data layers throw `LocalizedException(l10nKey:)`; the UI shows
`context.l10n.<namespace>.<errors>.selectOrFallback(exception.l10nKey)`.

**Constructors.** Use Dart primary constructors, in the class header, for widgets, cubits, states, repositories and mocks:

```dart
class const SlipCard({required final Slip slip, super.key}) extends StatelessWidget {
  final Slip slip;
}
```

Never write the old separate form (`const SlipCard({required this.slip});` in the body).

## Data rules

- **Feature data uses GraphQL.** Each feature keeps its `queries/`, `mutations/` and `fragments/` under
  `data/data_sources/remote/`; the schema snapshot is `app/lib/features/_shared/data/data_sources/remote/schema.graphql`.
  `RestClient` is for Edge Functions and other REST APIs only.
- **Data sources** are concrete classes that call `GQLClient` from `package:network/network.dart`, wrap one-shot queries in
  `validateResponseData`, and never let generated GraphQL types escape the data layer. **Repositories** are concrete classes with a
  `Logger` that return models. There is no domain layer, no use cases and no repository interfaces.
- **Closed value sets are enums end to end.** A column with a fixed set of values is a Postgres enum, so GraphQL and codegen
  expose it as an enum. The app models it as a plain camelCase Dart enum with no `value`, `wire` or `serverValue` field,
  and converts at the data boundary with a mapper (`toModel()` on the generated enum, `toRemote()` on the domain enum; only the
  directions in use). Never compare a domain value with a string literal; translation keys and local storage use `.name`. The same
  applies to values sent to an Edge Function.
- **Codegen owns generated types.** Run `melos gen` after editing a `.graphql` file. After a schema change run
  `melos graphql:schema`, then `melos gen`. Never hand-edit the snapshot or any generated file.
- **No invented server data.** `Model.fake` values exist only as skeleton placeholders behind `Skeletonizer`; never render them as
  real records. `supabase/seed.sql` is development-only.
- **Backend changes come first.** A feature that needs a new table, query or mutation edits `supabase/schemas/` and adds a
  migration; ask before inventing one. New tables need explicit grants and RLS policies.
- **Notifications are created by the backend.** Clients read and update only `notification_settings`, register a push token
  through `registerDevice` (and remove it with `unregisterDevice` or `revokeDevice`), and never read tokens or the outbox.
- **Secrets.** Never put a `service_role` or secret key in the app. `SERVER_API_KEY` and `SUPABASE_ANON_KEY` are the project's
  publishable key.

## Design system

`packages/design_system` is the only UI layer the app uses; Material and Cupertino exist inside that package only. Import
everything UI-related from `package:design_system/design_system.dart`, which also re-exports `flutter/widgets.dart`,
`skeletonizer`, `flutter_svg`, `cached_network_image_ce`, the icons, the tokens and the `Base*` components. `BaseApp.router`
installs `MaterialApp.router`, so app code never touches `Scaffold`, `AppBar` or `MaterialApp`.

- Use semantic colors (`context.colors`), text styles (`context.text`) and the token constants (`AppSpace`, `AppRadius`,
  `AppBorder`, `AppMotion`, `AppIconSize`); never raw colors or magic numbers.
- Loading is `BaseLoadingDots` and pull-to-refresh is `BaseRefreshable`. Never use a rounded spinner
  (`CircularProgressIndicator`, `CupertinoActivityIndicator`, `RefreshIndicator`).
- `design_system/lib/src/components` holds domain-blind `Base*` building blocks. `packages/common_ui` holds shared non-design
  widgets (`SkeletonizerResourceWidget`, `BaseListView`, `InfiniteListView`, `WebView`, `Assets`); new widgets there do not take
  the `Base*` prefix.
- Apply the `design-system` skill before creating, moving or promoting a reusable widget.

## Hard rules

1. Never import `flutter/material.dart`, `flutter/cupertino.dart` or `material_ui` in `app/lib`. Use the design-system barrel.
2. Cubits, not Blocs. No freezed, json_serializable or injectable.
3. Cubits take no runtime constructor arguments (`Injector` has no `registerFactoryParam`); pass ids into methods or use route
   params.
4. Every new `InjectionModule` goes into `main.dart::_registerModules()`, or `AppInjector.instance.get<T>()` fails at runtime.
5. All user-facing text comes from slang, in both `pt` and `en`: `app/lib/l10n/<locale>/<namespace>.json` (base locale `pt`) and
   `packages/design_system/lib/src/l10n/<locale>/<namespace>.json` (base locale `en`, read through
   `context.designSystemL10nOrBase`). File names are the namespace and are unique per package. Run `melos l10n`, then
   `melos l10n:analyze`.
6. Never hand-edit generated files (`*.g.dart`, `*.gr.dart`, `*.gen.dart`, `*.graphql.dart`, `translations*.dart`); regenerate
   and commit the output.
7. A feature's `presentation/` never holds files directly: every page lives in
   `presentation/<page>/<name>_page.dart` with `cubit/` and `widgets/` beside it, even for a single page. Tests mirror the paths.
8. Imports are always `package:` imports.
9. New `Base*` components go in `packages/design_system/lib/src/components` with a Storybook example and a test.
10. A mapper gets its own test file under `test/.../mappers/`. One test file per real file, never a combined test.

## Working rules

- **Branches.** `<type>/<description>`, with the same types as commits (`feat/gift-ideas`, `fix/card-status`).
- **Commits.** Conventional Commits, lowercase imperative subject without a final period, header up to 100 characters:
  `type(scope): what`. Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`, `ci`. A body, when needed,
  is short bullets that give the why; issue references go in the footer (`Closes #1`). One commit per change, and a change that spans
  features has no feature scope (`refactor: read single records with byPk`, not `refactor(cards,slips,chat): ...`). No
  `Co-Authored-By` or session trailers. Stage explicit paths.
- **History is linear.** Integrate with rebase or cherry-pick, never a merge commit. Never push, open a PR or rewrite shared
  history unless the owner asks. The owner may squash or rebase your commits; check `git reflog` before amending.
- **Remote systems.** Do not change the linked Supabase project, Firebase, RevenueCat or the stores unless the owner asks for that
  action, and say exactly what you changed. Run `supabase test db` only against the local stack.
- **Secrets and local files.** Keys live only in `.env*`. Never commit `.work/`, `.env*`, screenshots or build output.
- **Done means verified.** `melos gen`, `melos l10n`, `melos l10n:analyze`, `melos lint` and `melos test` pass; for backend
  changes the drift check and `supabase test db` pass too. Run the app for UI changes.

## Comments

Default to none. Write one only when the code cannot say it, in one short sentence, describing the declaration in front of you,
not its history or its consumers.

- `///` is for public API whose contract is not obvious from the name: invariants, units, thrown errors. No `@param`, `@return`
  or `@throws`.
- `//` is only for a non-obvious why: a workaround, invariant or ordering requirement.
- Never restate the code, narrate steps, add banners, keep commented-out code, or mention a feature, page, cubit or consumer. No
  diff notes ("now", "no longer", "previously", "moved").
- Properties start with a noun phrase, booleans with "Whether", methods with a third-person verb. Link identifiers with
  `[Symbol]` and backtick literals. Every `// ignore:` states the lint and a short reason.

## Skills

| Skill | Use when |
| --- | --- |
| `new-feature` | Adding a feature, screen, page or flow |
| `async-state` | Cubits, `Resource`, loading and error UI, skeletons, forms |
| `data-layer` | GraphQL, data sources, models, mappers, repositories, enums |
| `localization` | Adding or fixing UI strings and translations |
| `routing` | Pages, routes, navigation, tabs, route arguments |
| `dependency-injection` | Registering or resolving dependencies, DI modules |
| `testing` | Writing or running tests |
| `storybook` | Widgetbook examples for components and widgets |
| `design-system` | Any UI, styling, tokens or reusable widget; `Base*` naming |
| `package` | A new workspace package or a third-party SDK wrapper |
| `supabase` | Schema, migrations, RLS, pgTAP, pg_graphql, Edge Functions, the GraphQL snapshot |
