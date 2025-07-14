# Dependency Injection

- [Why Dependency Injection?](#why-dependency-injection)
- [Registration Types](#registration-types)
- [Feature Modules](#feature-modules)
- [Example Module](#example-module)
- [Parameterized Dependencies](#parameterized-dependencies)

## Why Dependency Injection?

Dependency Injection (DI) is a crucial technique for building maintainable and testable applications. It decouples components by providing dependencies from external sources rather than having them create dependencies themselves. This improves code reusability, simplifies testing by allowing for easy mocking of dependencies, and centralizes dependency management.

We leverage [GetIt](https://pub.dev/packages/get_it) as our DI library, wrapping it in a custom `AppInjector` class to avoid depending directly on the GetIt package. This abstraction prevents changes to the package from breaking the entire codebase, and allows GetIt to be easily replaced with another DI library if necessary.

## Registration Types

| Type        | Lifetime Case                           | Use Cases                                |
| ----------- | --------------------------------------- | ---------------------------------------- |
| `singleton` | Single instance                         | `DataSource`, `Repository`, `Repository` |
| `factory`   | New instance on each call to `get<T>()` | `Cubit`, `Mapper`, `UseCase`             |

## Feature Modules

We organize our DI modules by feature. Each feature should have its own injection module located in the `di` folder and named `feature_name_injection_module.dart`. For example, the injection module for the "User Profile" feature would be named `user_profile_injection_module.dart` and reside in the `di` directory.

These feature modules are then registered within the `_registerModules` method in the `main.dart` file. This centralizes the registration of all feature-specific dependencies.

```dart
// main.dart
void _registerModules() {
  final injectionModules = [
    // ... other modules
    UserProfileInjectionModule(),
  ];

  // ...
}
```

## Example Module

```dart
class UserProfileInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(remoteDataSource: injector.get<ExampleDataSource>()),
      )
    ..registerFactory<UserProfileCubit>(
        () => UserProfileCubit(repository: injector.get<UserRepository>()),
      );
}
```

## Parameterized Dependencies

When dependencies require parameters, use `registerFactoryParam` to register them with the necessary parameters. This is especially useful for Cubits that need parameters to initialize:

```dart
..registerFactoryParam<UserProfileCubit, String>(
  (userId) => UserProfileCubit(
    userId: userId,
    repository: injector.get<UserRepository>(),
  ),
);
```

For multiple parameters, use [Dart Records](https://dart.dev/language/records):

```dart
..registerFactoryParam<UserProfileCubit, (String, bool)>(
  (params) => UserProfileCubit(
    userId: params.$1,
    isAdmin: params.$2,
    repository: injector.get<UserRepository>(),
  ),
);
```
