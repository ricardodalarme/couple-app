---
name: package
description: Create a new package in this monorepo (packages/... or packages/services/...) — pubspec with resolution workspace, the root workspace list entry, path dependencies in consumers, barrel exports, tests, and the service abstraction pattern for wrapping third-party SDKs (interface + impl, or a concrete class with optional SDK injection and a domain exception). Use when adding a package, wrapping a new third-party SDK/API, extracting shared code, or when the user says "create a package/service/abstraction".
---

# Packages in this monorepo

Packages under `packages/` hold code shared with the app. Anything that touches a
third-party SDK goes through a wrapper package so the app never imports the SDK
directly and the implementation can be swapped.

## Decide the shape

| Need | Location | Package name |
| --- | --- | --- |
| Shared pure-Dart logic (utils, models, DI contracts) | `packages/<name>/` | `<name>` (e.g. `core`, `network`, `logger`) |
| Shared Flutter UI | `packages/common_ui` (existing) | `common_ui` |
| Third-party SDK wrapper | `packages/services/<topic>/` | `<topic>_service` |

Service folders are short (`secure_storage`), package names are suffixed
(`secure_storage_service`), and consumers import
`package:secure_storage_service/secure_storage_service.dart`.

Existing services: `analytics`, `authentication`, `biometric`, `crash_report`,
`device_info`, `preferences`, `remote_config`, `secure_storage`. Copy the shape
of the closest one instead of inventing a new layout.

## 1. Create the package

`packages/services/<topic>/pubspec.yaml` (Flutter-dependent service). Copy the
`environment:` constraints and dependency versions from an existing package so
they stay current:

```yaml
name: <topic>_service
resolution: workspace
publish_to: "none"

environment:
  sdk: ^3.13.7
  flutter: ^3.47.9

dependencies:
  flutter:
    sdk: flutter
  <sdk_package>: <latest compatible>
  core:            # only if you need LocalizedException or the DI contracts
    path: ../../core

dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.5
```

Pure-Dart package: drop the `flutter` / `flutter_test` entries and use
`test: ^1.31.1` (follow `packages/core/pubspec.yaml`).

2. **Add the package to the root `pubspec.yaml` `workspace:` list.** The list is
   explicit — there are no globs — so a package that is missing from it is not a
   workspace member:

```yaml
workspace:
  - app
  - packages/common_ui
  - packages/core
  # …
  - packages/services/<topic>
```

3. Add a `path:` dependency in every consumer — `app/pubspec.yaml` and any
   package that uses it. Workspace resolution does not replace explicit path
   dependencies in this repo.

4. Create the barrel `lib/<topic>_service.dart` exporting the public API:

```dart
export 'src/<topic>_service.dart';
export 'src/<topic>_exception.dart';
```

5. Run `melos get` (or `melos bootstrap`).

## Service abstraction patterns

### Pattern A — interface + implementation (preferred when call sites only need behavior)

Real example: `packages/services/analytics`.

```dart
// lib/src/analytics_service.dart
import 'package:analytics_service/src/models/analytics_event.dart';

abstract interface class AnalyticsService() {
  void logEvent(AnalyticsEvent event);
  void logScreenView({required String screenName});
}

// lib/src/firebase_analytics_service.dart
class FirebaseAnalyticsService([FirebaseAnalytics? firebaseAnalytics])
    implements AnalyticsService {
  final FirebaseAnalytics _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance;

  @override
  void logEvent(AnalyticsEvent event) {
    try {
      unawaited(_firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters));
    } catch (error, stackTrace) {
      log('Failed to log event: $event', error: error, stackTrace: stackTrace);
    }
  }

  @override
  void logScreenView({required String screenName}) {
    try {
      unawaited(_firebaseAnalytics.logScreenView(screenName: screenName));
    } catch (error, stackTrace) {
      log('Failed to log screen view: $screenName', error: error, stackTrace: stackTrace);
    }
  }
}
```

`log` comes from `dart:developer`. Analytics is a fire-and-forget side channel, so
it swallows SDK errors on purpose; a service whose failures matter must throw a
domain exception instead (Pattern B).

### Pattern B — concrete class with optional SDK injection + domain exception

Real example: `packages/services/secure_storage`.

```dart
// lib/src/secure_storage_service.dart
abstract interface class SecureStorageService() {
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
  Future<void> clear();
}

class const SecureStorageServiceImpl([
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(),
]) implements SecureStorageService {
  @override
  Future<String?> read({required String key}) async {
    try {
      return await _secureStorage.read(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }
}

// lib/src/secure_storage_exception.dart
class const SecureStorageException(final Object error) implements Exception;
```

Rules that apply to both:

- **Every class declares its constructor in the header** (Dart primary
  constructors) — `class FirebaseAnalyticsService([FirebaseAnalytics? analytics])`,
  `class const SecureStorageServiceImpl([...])`, and
  `class MockFlutterSecureStorage() extends Mock implements FlutterSecureStorage;`
  in tests. Never a separate `ClassName(...)` constructor inside the class body.
  Declare fields as `final`; a field may be initialized in the body when it needs
  a fallback expression (as `FirebaseAnalyticsService` does).
- The SDK is an optional constructor parameter; the class stores it as a `final`
  field initialized with `sdk ?? RealSdk()` (or uses a primary-constructor default
  value). That is how tests pass mocks.
- Define a domain exception for failures (`SecureStorageException`,
  `AuthenticationException(code)`) and wrap with
  `Error.throwWithStackTrace(wrapped, stackTrace)` to preserve the trace.
- Never leak raw SDK types at call sites unless the barrel re-exports a selected
  type on purpose (the authentication barrel exports the SDK's `Session`).
- Models returned to the app are hand-written + Equatable with primary
  constructors (`class const DeviceInfo({ ... }) with Equatable`), never freezed
  or generated. See `device_info_service`.

## Wire it into the app

1. Register the implementation in
   `app/lib/features/_shared/di/shared_injection_module.dart` (all services are
   registered there, not in feature modules):

```dart
..registerLazySingleton<AnalyticsService>(FirebaseAnalyticsService.new)
..registerLazySingleton<SecureStorageService>(SecureStorageServiceImpl.new)
```

2. If the SDK needs startup initialization, add an `Initializer` under
   `app/lib/infrastructure/initializers/` and list it in the pipeline in
   `app/lib/main.dart`. DI is registered before the pipeline, so resolve
   services from `AppInjector`.
3. Consume the service with constructor injection in data sources, repositories,
   and cubits — never import the SDK in the app.

## Tests

- `flutter_test` + `mocktail` (or `package:test` for pure Dart).
- Mock the SDK class and pass it to the optional constructor parameter.
- Cover the default-construction path, at least one success path, and one
  exception-mapping path.

```dart
class MockFlutterSecureStorage() extends Mock implements FlutterSecureStorage;

void main() {
  late FlutterSecureStorage flutterSecureStorage;
  late SecureStorageServiceImpl secureStorage;

  setUp(() {
    flutterSecureStorage = MockFlutterSecureStorage();
    secureStorage = SecureStorageServiceImpl(flutterSecureStorage);
  });
}
```

```bash
cd packages/services/<topic> && flutter test
melos lint
```

Reference tests: `packages/services/analytics/test/firebase_analytics_service_test.dart`
and `packages/services/secure_storage/test/secure_storage_service_test.dart`.

## Gotchas

- Forgetting the root `workspace:` entry (or the consumer `path:` dependency)
  breaks resolution — neither is generated for you.
- `resolution: workspace` is mandatory in every member pubspec, including
  `packages/services/*`.
- Packages contain **no DI modules**; registration always stays in the app's
  `SharedInjectionModule`.
- Do not add freezed, json_serializable, or build_runner unless the package
  already has them — the repo hand-writes models.
- Keep packages free of `app` imports; dependencies point downward
  (app → package, package → core, never package → app/feature).
- Import with `package:` URIs inside a package, never relative `../` paths.
- Prefer pure Dart when Flutter is not needed (fewer test requirements, faster
  CI).
- When wrapping an SDK, expose the smallest useful surface; do not mirror the
  entire SDK API.
