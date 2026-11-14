---
name: testing
description: Writes and runs tests for the app and packages. Covers cubit tests with blocTest and mocktail, widget tests with MockCubit and pumpApp, data source, repository, model and mapper tests, form validation and time tests, and package tests. Use when adding or fixing tests, when asked to write tests or add coverage, or when a change needs verification.
---

# Testing

Tests mirror the source tree and there is **one test file per real file**: `app/lib/features/<f>/<path>/<name>.dart` is tested in
`app/test/features/<f>/<path>/<name>_test.dart`. Never combine several files in one test. `features/gifts` is the reference.

```text
test/features/gifts/
├── data/data_sources/remote/gifts_data_source_test.dart
├── data/mappers/{gift_mapper_test.dart, gift_enum_mapper_test.dart}
├── data/models/gift_idea_test.dart
├── data/repositories/gifts_repository_test.dart
└── presentation/gifts/{cubit/gifts_cubit_test.dart, gifts_page_test.dart}
```

## Commands

```bash
melos test                                          # every package, random order
cd app && flutter test test/features/gifts          # a folder
cd app && flutter test path/file_test.dart --plain-name "initial state"
cd packages/core && dart test                       # pure Dart package
```

New test files are picked up automatically; there is no registration list.

## Tools

- `flutter_test`, `bloc_test` and `mocktail`. No mockito, no generated mocks, no golden tests.
- Hand-write mocks as primary-constructor classes: `class _MockGiftsRepository() extends Mock implements GiftsRepository;` and
  `class _MockGiftsCubit() extends MockCubit<GiftsState> implements GiftsCubit;`.
- `tester.pumpApp(widget)` (`app/test/test_helpers/pump_app.dart`) wraps the widget in `TranslationProvider`, the theme and
  `BaseApp`. Never use `pumpWidget` alone: l10n and the theme break.
- Mock a repository for cubit and page tests, and an SDK wrapper for service tests. Data source tests stub `GQLClient` at the
  boundary (see below); never mock a platform channel.
- mocktail needs a fallback value for each custom type used with `any(named: ...)`. They are registered once in
  `app/test/flutter_test_config.dart`; add a `registerFallbackValue(...)` there when a mock takes a new enum or model.

## Cubit

```dart
void main() {
  late GiftsRepository repository;
  late GiftsCubit cubit;

  setUp(() {
    repository = _MockGiftsRepository();
    cubit = GiftsCubit(giftsRepository: repository);
  });
  tearDown(() => cubit.close());

  test('starts loading', () => expect(cubit.state, const GiftsState()));

  blocTest<GiftsCubit, GiftsState>(
    'emits Loading then Success',
    build: () {
      when(repository.getGiftIdeas).thenAnswer((_) async => [gift]);
      return cubit;
    },
    act: (cubit) => cubit.load(),
    expect: () => [const GiftsState(gifts: Success([gift]))],
  );

  blocTest<GiftsCubit, GiftsState>(
    'emits Failure when the repository throws',
    build: () {
      when(repository.getGiftIdeas).thenThrow(const LocalizedException(l10nKey: 'other'));
      return cubit;
    },
    act: (cubit) => cubit.load(),
    expect: () => [const GiftsState(gifts: Failure(LocalizedException(l10nKey: 'other')))],
  );
}
```

- Stub with `thenAnswer((_) async => ...)` or `thenThrow(...)`. Reuse one `const` exception in the stub and in `expect`: the exception has
  no value equality.
- `blocTest` records only what `act` emits; assert the initial state with a plain `test`. If the cubit skips `Loading` (a refresh that
  keeps a `Success`), expect no `Loading`.
- States need Equatable `props` for `==` to work. Close every cubit in `tearDown`.
- Verify side effects explicitly: `verify(() => repository.add(...)).called(1)`, `verifyNever(...)` when validation blocks a write.

### States

Test a state class only when `copyWith` or a getter carries behavior a cubit test cannot see: a `clearX` flag that nulls a field, a
nullable reset, a derived getter with branches. Do not test the default constructor, field passthrough or Equatable.

### Forms

Validation lives in the cubit, so test it there, without a widget: a required field left empty emits its error and writes nothing
(`verifyNever`), an over-limit value reports `tooLong`, typing after a failed submit clears the error, and a valid form writes the trimmed
value. Reference: `test/features/slips/presentation/slip_kind/cubit/`. A widget test needs one case: the submit button shows the field
error and does not pop. `BaseTextArea` only renders `errorText` when `hasError` is true.

## Widgets and pages

```dart
setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

Future<GiftsCubit> pumpGifts(WidgetTester tester) async {
  final cubit = GiftsCubit(giftsRepository: repository); // the real cubit over a mocked repository
  addTearDown(cubit.close);
  await cubit.load();
  await tester.pumpApp(BlocProvider.value(value: cubit, child: const GiftsPage()));
  await tester.pump();
  return cubit;
}

testWidgets('shows my wishes and my partner\'s', (tester) async {
  await pumpGifts(tester);
  expect(find.text('Livro'), findsOneWidget);
});
```

- Provide the cubit with `BlocProvider.value`; never initialize the injector. Prefer the real cubit over a mocked repository, so the
  test covers state to UI. Use `MockCubit` (with `when(() => cubit.state).thenReturn(...)`) only to isolate a widget from cubit logic.
- Set the locale (`LocaleSettings.setLocaleSync(AppLocale.pt)`) and assert the Portuguese copy.
- Do not `pumpAndSettle` on a loading state: the skeleton shimmer never settles.
- `SkeletonizerResourceWidget` has its own test (`packages/common_ui/test/src/widgets/`) for `Initial`, `Loading`, `Success` and
  `Failure`; a page test only checks its own builders.
- A test that must prove "no platform calls" (haptics, notifications) installs a mock method-call handler on
  `SystemChannels.platform` and removes it in `addTearDown`.

## Data layer

- **Data source:** pass a stub `GQLClient` that returns a `QueryResult` (see `_StubGQLClient` and `_CapturingGQLClient` in
  `gifts_data_source_test.dart`) and assert the variables sent and what is returned. Capture the options to check the fetch policy.
- **Repository:** mock the data source; assert mapping, filtering, trimming and that failures are logged and rethrown.
- **Model and mapper:** plain `test`s on `const` values.
- **Enum mappers:** every domain value survives `value.toRemote().toModel()`, multi-word values have the right spelling, and each
  `$unknown` behavior is asserted using the generated member (`EnumMood.$unknown`), never an invented string. Test only the
  directions the mapper has. Fixtures use enums, never string literals.

## Time

Production code reads time from `package:clock` (`clock.now()`), never `DateTime.now()`. A test that depends on now wraps its body in
`withClock(Clock.fixed(DateTime(2026, 3, 10, 12)), () { ... })` and derives every fixture from that instant; never assert against the
wall clock or offset from `DateTime.now()`. Timers still use `FakeAsync` or `blocTest`'s clock.

## Packages

- Pure Dart packages (`core`, `form_inputs`, `formatters`, `logger`, `network`): `package:test`, no Flutter binding.
- Flutter packages (`design_system`, `services/*`): `flutter_test` and `mocktail`, with SDK mocks injected through the constructor
  (`FirebaseAnalyticsService(MockFirebaseAnalytics())`). `design_system` widget tests use `test/helpers/widget_host.dart`.
- A package without tests can get its first `test/<topic>_test.dart` using the same pattern.

## Gotchas

- `app/test/analysis_options.yaml` extends the root config and relaxes `avoid_redundant_argument_values`.
- Use `Success(null)` for void resources.
- Wrap a loading assertion about announcements in `tester.ensureSemantics()`; the label is `context.l10n.common.loading`.
- Do not generate mocks or add codegen for tests.
