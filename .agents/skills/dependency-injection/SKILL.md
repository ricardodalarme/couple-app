---
name: dependency-injection
description: Registers and resolves dependencies through the core Injector and InjectionModule abstraction over get_it. Covers creating a feature DI module, choosing lifetimes (lazy singleton or factory), adding the module to main.dart, resolving cubits in a page's wrappedRoute, and debugging "not registered" errors. Use when adding a service, repository, data source or cubit, wiring or reordering modules, or when a page cannot resolve its cubit.
---

# Dependency injection

`packages/core` wraps get_it behind `Injector` and `InjectionModule`. App code programs against those from `package:core/core.dart`
and never imports `package:get_it`. `AppInjector.instance` is the one locator.

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

There is no parameterized factory: a dependency is built from the container alone, which is why cubits take no runtime
constructor arguments.

## Where things are registered

| Place | Holds |
| --- | --- |
| `features/_shared/di/shared_injection_module.dart` | The router and observers, `GQLClient`, `RestClient`, and every `packages/services/*` implementation |
| `features/app/di/app_injection_module.dart` | `AppCubit`, the one app-wide cubit |
| `features/<feature>/di/<feature>_injection_module.dart` | That feature's data source, repository and cubits |

`main.dart::_registerModules()` holds the ordered list of modules. `SharedInjectionModule` comes first, because feature modules
resolve `GQLClient` and the services from it. A new module goes into that list in the same change that creates it.

## Feature module

```dart
class GiftsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<GiftsDataSource>(() => GiftsDataSource(client: injector.get<GQLClient>()))
    ..registerLazySingleton<GiftsRepository>(() => GiftsRepository(
        dataSource: injector.get<GiftsDataSource>(),
        togetherRepository: injector.get<TogetherRepository>()))
    ..registerFactory<GiftsCubit>(() => GiftsCubit(giftsRepository: injector.get<GiftsRepository>()));
}
```

- Name it `<Feature>InjectionModule` in `<feature>_injection_module.dart`, with a primary constructor and an empty parameter list.
- One cascade, one registration per line, from the leaf outward: data source, repository, cubits.
- Resolve inside the closure with `injector.get<T>()`; a lazy singleton must be created on first use, not when the module runs.
- Named arguments must match the real constructors (`GiftsDataSource(client:)`).
- Register **every** cubit of the feature. A missing one only fails when its page opens.

## Lifetimes

| Kind | Registration |
| --- | --- |
| Data sources, repositories, clients, services | `registerLazySingleton` |
| Cubits for a page or flow | `registerFactory`, so each page gets fresh state and closing the page closes the cubit |
| `AppCubit` and the other app-level cubits provided in `app.dart` | `registerLazySingleton` |
| An object that already exists | `registerSingleton` (rare) |

Use `instanceName:` only when two implementations of one type must coexist; prefer distinct types.

## Consuming

- **Page:** resolve the cubit in `wrappedRoute` and kick off the first read there (`..load()`), never in `build` or `initState`:
  `BlocProvider(create: (_) => AppInjector.instance.get<GiftsCubit>()..load(), child: this)`.
- **Module:** `injector.get<T>()`.
- **Outside widgets and modules:** `AppInjector.instance.get<T>()`, for example in an initializer under
  `infrastructure/initializers/`.
- **Tests:** never initialize the injector. Construct the cubit with mocks and provide it with `BlocProvider.value`
  (`pumpApp(BlocProvider.value(value: mockCubit, child: const GiftsPage()))`).

## Gotchas

- A module missing from `_registerModules()` fails at runtime with "Object/factory with type X is not registered", not at compile
  time.
- Registration is idempotent and silent: if a type is already registered, a second registration is ignored and the first
  implementation stays. Register each type once, and call `unregister<T>()` to replace one on purpose.
- Services live in `SharedInjectionModule`. Packages under `packages/services/` ship no DI module; the app owns the wiring and the
  choice of implementation.
- Never resolve in `build`: it re-runs factories on every rebuild.
- A page cubit is never a singleton; shared cubits leak state between visits.
- Pass ids, filters and search terms into cubit methods, or read them from route parameters.
