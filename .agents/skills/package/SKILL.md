---
name: package
description: Creates a workspace package under packages/ and wraps third-party SDKs as service packages under packages/services/. Covers the pubspec, workspace membership, the consumer path dependency, the barrel, the concrete-class and interface-plus-implementation service shapes, the domain exception, registration in SharedInjectionModule and tests with an injected SDK mock. Use when adding a package, wrapping a new SDK or platform API, extracting shared code, or when asked to create a package, service or abstraction.
---

# Packages

Packages hold code shared with the app. App code never imports a third-party SDK directly; it goes through a service package, so the
SDK can be swapped and mocked. Copy the closest existing package instead of inventing a layout.

| Need | Location | Package name |
| --- | --- | --- |
| Shared pure-Dart logic | `packages/<name>/` | `<name>` (`core`, `network`, `logger`, `formatters`, `form_inputs`) |
| Shared UI | `packages/design_system`, `packages/common_ui` | existing; see `design-system` |
| SDK or platform wrapper | `packages/services/<topic>/` | `<topic>_service` |

The folder is short (`secure_storage`), the package name is suffixed (`secure_storage_service`), and consumers import
`package:secure_storage_service/secure_storage_service.dart`.

## Create it

1. `packages/services/<topic>/pubspec.yaml`. Copy `environment:` and versions from `packages/services/analytics/pubspec.yaml`.
   `resolution: workspace` is mandatory, and a pure-Dart package drops the Flutter entries and uses `package:test`.

   ```yaml
   name: <topic>_service
   resolution: workspace
   publish_to: "none"

   environment:
     sdk: ^3.14.0

   dependencies:
     flutter:
       sdk: flutter
     <sdk_package>: <current version>

   dev_dependencies:
     flutter_test:
       sdk: flutter
     mocktail: ^1.0.5
   ```

2. Workspace membership: the root `pubspec.yaml` lists `packages/services/**` as a glob, so a new service is a member automatically.
   A package outside `packages/services/` needs its own `workspace:` entry.
3. Add a `path:` dependency in every consumer (`app/pubspec.yaml`, and any package that uses it). Workspace resolution does not
   replace it.
4. Create the barrel `lib/<topic>_service.dart` exporting only the public API (the service, its exception, its models). Implementation
   details stay in `lib/src/`.
5. Run `melos get`.

## Two service shapes

**Concrete class** (default, for example `secure_storage`, `preferences`, `share`): a class with the SDK as an optional
constructor argument, so tests inject a mock.

```dart
class SecureStorageService([FlutterSecureStorage? secureStorage]) {
  final FlutterSecureStorage _secureStorage = secureStorage ?? const FlutterSecureStorage();

  Future<String?> read({required String key}) async {
    try {
      return await _secureStorage.read(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }
}
```

**Interface plus implementation** (for example `analytics`, `crash_report`, `biometric`, `connectivity`): an `abstract interface class`
and an implementation named for the SDK, when call sites should not know the vendor or there may be several implementations
(`AnalyticsService` and `FirebaseAnalyticsService`). The app registers the interface type.

Rules for both:

- Primary constructors in the header, as everywhere; fields `final`. A body field may hold a fallback expression (`sdk ?? RealSdk()`).
- Failures that callers must handle throw a domain exception (`class const SecureStorageException(final Object error) implements Exception;`)
  wrapped with `Error.throwWithStackTrace` to keep the trace. A fire-and-forget side channel (analytics, performance) swallows SDK
  errors and logs them with `log` from `dart:developer` instead.
- Expose the smallest useful surface; do not mirror the SDK. Never leak raw SDK types, unless the barrel re-exports one on purpose
  (the authentication barrel exports the SDK's `Session`).
- Returned models are hand-written Equatable classes with a primary constructor, never freezed or generated (see `device_info_service`).
- Inside a package, import with `package:` URIs, never relative paths. Dependencies point downward: app to package, package to
  `core`, never package to app.

## Wire it into the app

1. Register it in `app/lib/features/_shared/di/shared_injection_module.dart`, where every service lives (packages hold no DI
   modules): `..registerLazySingleton<AnalyticsService>(FirebaseAnalyticsService.new)`. See `dependency-injection`.
2. If the SDK needs startup work, add an `Initializer` under `app/lib/infrastructure/initializers/`; DI is registered before the
   startup pipeline runs.
3. Consume it by constructor injection in data sources, repositories and cubits.

## Tests

Mock the SDK class and pass it to the constructor; cover default construction, one success path and one exception-mapping path.
`flutter_test` and `mocktail` (or `package:test` for pure Dart). Mocks are primary-constructor classes
(`class MockFlutterSecureStorage() extends Mock implements FlutterSecureStorage;`). References:
`packages/services/secure_storage/test/secure_storage_service_test.dart` and
`packages/services/analytics/test/firebase_analytics_service_test.dart`. Verify with `cd packages/services/<topic> && flutter test`,
then `melos lint`.

## Gotchas

- Do not add freezed, json_serializable or build_runner to a package that does not already use them.
- Prefer pure Dart when Flutter is not needed; it makes tests and CI lighter.
- A service that needs a vendor project (Firebase, RevenueCat, push) must not be given a real project name here; see `AGENTS.md`.
