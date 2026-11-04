---
name: dependency-injection
description: Register and consume dependencies in this app through the core Injector/InjectionModule abstraction over get_it — create a feature DI module, choose lifetimes (registerSingleton, registerLazySingleton, registerFactory), add the module to `main.dart::_registerModules()`, resolve cubits in a page's wrappedRoute, and debug "not registered" errors. Use when adding a service, repository, data source, or cubit that needs construction, wiring or reordering DI modules, or when a page cannot resolve its cubit.
---

# Dependency injection in the app

`packages/core` wraps get_it behind two interfaces, `Injector` and
`InjectionModule`. Everything in `app/lib` programs against those types from
`package:core/core.dart`; `package:get_it` is a dependency of `packages/core`
only and must never be imported by app code.

The prose companion is `docs/dependency_injection.md`; keep the two consistent
when module structure changes.

```dart
abstract interface class Injector() {
  T get<T extends Object>({String? instanceName});

  void unregister<T extends Object>({String? instanceName});

  void registerSingleton<T extends Object>(T instance, {String? instanceName});

  void registerLazySingleton<T extends Object>(T Function() function, {String? instanceName});

  void registerFactory<T extends Object>(T Function() function, {String? instanceName});
}

abstract interface class InjectionModule() {
  void registerDependencies({required Injector injector});
}
```

`AppInjector.instance` (`packages/core/lib/src/di/app_injector.dart`) is the one
locator in the app. It is a `GetIt.instance` wrapper that:

- returns the same `Injector` for the process lifetime;
- guards every registration with `isRegistered`, so calling
  `registerDependencies` twice is safe;
- exposes **no parameterized factory**. A dependency is built from the container
  alone, never from runtime arguments. That is why cubits take no constructor
  values for ids or filters.

## Where dependencies are registered

| Location | Contents |
| --- | --- |
| `app/lib/features/_shared/di/shared_injection_module.dart` | Infrastructure shared by every feature: `RootStackRouter`, router observers, `GQLClient`, `RestClient`, and the `packages/services/*` implementations (`SecureStorageService`, `PreferencesService`, `AnalyticsService`, `RemoteConfigService`, `CrashReportService`, `DeviceInfoService`, `BiometricService`) |
| `app/lib/features/app/di/app_injection_module.dart` | `AppCubit`, the one app-wide cubit |
| `app/lib/features/<feature>/di/<feature>_injection_module.dart` | That feature's data source → repository → cubit(s) |

Modules are listed in `app/lib/main.dart::_registerModules()`:

```dart
void _registerModules() {
  final injectionModules = <InjectionModule>[
    SharedInjectionModule(),
    AppInjectionModule(),
    AuthenticationInjectionModule(),
    OnboardingInjectionModule(),
    AccountInjectionModule(),
    PostInjectionModule(),
    SettingsInjectionModule(),
  ];

  final injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    injectionModule.registerDependencies(injector: injector);
  }
}
```

Add a new feature module to that list in the same change that introduces it.

## Feature module template

`app/lib/features/post/di/post_injection_module.dart` is the complete, real
example:

```dart
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/post/data/data_sources/post_data_source.dart';
import 'package:flutter_bloc_starter/features/post/data/repositories/post_repository.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:network/network.dart';

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

- Class name and file name: `<Feature>InjectionModule` in
  `<feature>_injection_module.dart`. The class uses a primary constructor with an
  empty parameter list (`class PostInjectionModule() implements InjectionModule`).
- One cascade, one registration per line, ordered from the leaf outward: data
  source, then repository, then cubits.
- Resolve every dependency inside the closure with `injector.get<T>()`. Do not
  capture instances eagerly at module construction; a lazy singleton must be
  created on first use, not when the module runs.
- Named parameters in the constructors (`graphlQLClient:`,
  `postDataSource:` — note the existing typo in `PostDataSource`) must match the
  real declarations.
- Register **every** cubit of the feature here. A page whose cubit is missing
  throws at runtime, and the error only appears when that page opens.
- All classes involved — modules, data sources, repositories, services, cubits,
  and test mocks — use a **primary constructor** in the class header, never an
  old-style constructor in the body:

  ```dart
  class MockPostRepository() extends Mock implements PostRepository;
  ```

## Lifetimes

| Kind | Registration | Why |
| --- | --- | --- |
| Data sources, repositories, clients, services | `registerLazySingleton` | Stateless wrappers over a client or platform channel; one instance keeps connections and caches alive |
| Cubits for a page or flow | `registerFactory` | Every page gets a fresh state, and closing the page closes the cubit |
| `AppCubit` | `registerLazySingleton` | Drives root routing and must outlive route rebuilds |
| Already-constructed object handed to the container | `registerSingleton` | For values built before DI (rare; prefer a factory function) |

Multiple implementations of one type use `instanceName:`; resolve with the same
name. Prefer distinct types when possible.

## Consuming

**In a page** — resolve the cubit in `wrappedRoute`, never in `build`:

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

- `wrappedRoute` runs once per route push, so the factory registration produces a
  new cubit per page and `BlocProvider` disposes it on pop.
- Kick off the first read on the resolved cubit (`..getPosts()`) rather than in
  `initState`, so a page-level widget test can supply a `MockCubit` instead.
- See `routing` for route registration and nested tabs.

**Inside an injection module** — `injector.get<T>()`, as shown in the template.

**Outside a widget or module** — `AppInjector.instance.get<T>()`, for example
an initializer under `app/lib/infrastructure/initializers/` resolving
`CrashReportService` or `AppCubit` during startup.

**In tests** — never initialize the injector. Construct the cubit with mock
dependencies and provide it with `BlocProvider.value`:

```dart
postsListCubit = MockPostsListCubit();
when(() => postsListCubit.state).thenReturn(const PostsListState());

await tester.pumpApp(
  BlocProvider.value(value: postsListCubit, child: const PostsListPage()),
);
```

## Gotchas

- **A module that is not in `_registerModules()` does not exist.** The failure is a
  runtime "Object/factory with type X is not registered" when the page opens, not
  a compile error.
- **`SharedInjectionModule` must be registered first.** Feature modules resolve
  `GQLClient`, `RestClient`, and the service implementations from it; an
  out-of-order list works only by accident of lazy resolution, and it breaks the
  moment a closure runs during registration.
- **No runtime arguments for cubits.** There is no parameterized factory. Pass
  ids, filters, or search terms into cubit methods, or read them from route
  params.
- **Registration is idempotent and silent.** `AppInjector` skips a type that is
  already registered, so a second module registering the same type keeps the
  first implementation without any warning. Register each type exactly once; use
  `unregister<T>()` when intentionally replacing one.
- **Do not import `package:get_it/get_it.dart` in `app/lib`.** Only
  `packages/core` knows about get_it. Use `Injector` and `AppInjector` from
  `package:core/core.dart`.
- **Services belong in `SharedInjectionModule`.** Packages under
  `packages/services/` deliberately ship no DI module; the app owns the wiring
  and the interface-to-implementation choice.
- **Do not resolve dependencies in `build`.** A widget that calls
  `AppInjector.instance.get` on every rebuild re-resolves factories and creates
  throwaway objects. Resolve in `wrappedRoute`, a startup initializer, or a module.
- **Do not make a page cubit a singleton.** Shared cubits leak state between
  visits and are never disposed; only `AppCubit` is app-wide.
- **Keep imports `package:`-prefixed** (`package:flutter_bloc_starter/...`), as
  everywhere else in `app/lib`.
