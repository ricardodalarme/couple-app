---
name: async-state
description: Implement Cubit state in this app with the sealed Resource pattern (Initial, Loading, Success, Failure), one-shot Future reads, Equatable part-file states, action and form slots, SkeletonizerResourceWidget for read slots, context.select for narrow rebuilds, and BlocListener for side effects. Use when creating or editing a Cubit or its state, wiring loading, error or empty UI, adding skeletons or toasts, validating a form, or whenever code mentions Resource, emit, Success, Failure or SkeletonizerResourceWidget.
---

# Async state

Every async value in `app/lib` lives in a `flutter_bloc` **Cubit** (never a `Bloc`) as a sealed `Resource<T>`. Reads are one-shot:
the cubit emits `Loading`, awaits a repository `Future`, then emits `Success` or `Failure`. There is no stream layer.

```
page.wrappedRoute -> BlocProvider(create: get<GiftsCubit>()..load())
  cubit.load(): Loading -> await repo.getGiftIdeas() -> Success(list)   | catch -> Failure.fromObject(e)
  SkeletonizerResourceWidget(slot, fakeValue, successBuilder, failureBuilder)
action: cubit.save(): saveAction Loading -> await repo -> Success(result) | catch -> Failure, then Initial
        BlocListener(listenWhen: slot changed) shows a toast or navigates
```

## Resource

`Resource<S>` is in `packages/core/lib/src/utils/resource.dart`, exported by `package:core/core.dart`.

- `Initial()`: nothing requested. The default for **action and form slots**; renders as `SizedBox.shrink()`.
- `Loading()`: in flight. The default for **read slots**, so the skeleton is the first frame instead of a flash of empty content.
- `Success<S>(value)`: the value. An action with no result uses `Success(null)`.
- `Failure(exception)`: build it with `Failure.fromObject(exception)`, which keeps a `LocalizedException` and wraps anything else
  as `UnknownException`.

A repository returns plain models, never a `Resource`; the cubit is the only place that turns an exception into UI state.

Name a read slot after its data (`gifts`, `slips`) and an action slot with the verb plus `Action` (`saveAction`). The constructor
parameter, field, `copyWith` parameter and `props` entry all use the same name.

## Read cubit

```dart
class GiftsCubit({required final GiftsRepository _giftsRepository}) extends Cubit<GiftsState> {
  this : super(const GiftsState());

  Future<void> load() async {
    if (state.gifts is! Success) emit(state.copyWith(gifts: const Loading()));
    try {
      emit(state.copyWith(gifts: Success(await _giftsRepository.getGiftIdeas())));
    } catch (exception) {
      if (state.gifts is Success) return; // a failed refresh keeps what is on screen
      emit(state.copyWith(gifts: Failure.fromObject(exception)));
    }
  }
}
```

- The cubit has a primary constructor with a named private field, declares `part '<name>_state.dart'`, and passes the default state
  to `super`.
- Emit `Loading` first so a retry clears the error at once, but not over an existing `Success`: refreshing keeps the content.
- Catch without a type filter; the repository already normalized the failure. The cubit does not log or report it.
- Runtime data (ids, filters) goes into method parameters, never the constructor: the injector creates cubits with no arguments.

## Action cubit

```dart
Future<void> save() async {
  if (state.saveAction.isLoading || state.saveAction is Success || !_validate()) return;

  emit(state.copyWith(saveAction: const Loading()));
  final id = _savedId ??= _uuid.v4();            // a retry reuses the id, so the server upserts instead of duplicating
  try {
    final outcome = await _slipRepository.saveQuick(id: id, body: state.text.value.trim(), createdAt: clock.now());
    emit(state.copyWith(saveAction: Success(outcome)));
  } catch (exception) {
    emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    emit(state.copyWith(saveAction: const Initial()));
  }
}
```

- Guard against a double tap with `isLoading`. One method per user gesture, and no optimistic `Success` before the await resolves.
- Resetting to `Initial` after a `Failure` lets the same failure fire the `BlocListener` again on the next attempt, because the
  listener compares the slot. Do not reset after `Success` when the listener navigates away.
- Do not emit `Failure` for a cancelled user action.

## State

```dart
part of 'gifts_cubit.dart';

final class const GiftsState({
  final Resource<List<GiftIdea>> gifts = const Loading(),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  GiftsState copyWith({Resource<List<GiftIdea>>? gifts, Resource<void>? saveAction}) =>
      GiftsState(gifts: gifts ?? this.gifts, saveAction: saveAction ?? this.saveAction);

  @override
  List<Object?> get props => [gifts, saveAction];
}
```

- `with Equatable`, never `extends`. List **every** field in `props`, or equality and `listenWhen` break quietly.
- One state file per cubit, `part of` the cubit file. No freezed or generated state.
- `copyWith` cannot set a nullable field back to null. Use a `clearX` flag (`clearWorkArea` in `SlipKindState`) or a sentinel.
- Keep derived values as getters on the state, not as second copies of the data.

## Forms

Fields are `FormInput<T>` from `package:form_inputs`. A change handler emits `FormInput(value)`, which clears that field's error.
Validation runs on submit; submit buttons stay enabled.

```dart
bool _validate() {
  final validatedText = state.text.validate(
    CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(slipKindMaxLength)]),
  );
  final validatedFeeling = state.feeling.validate(MaxLengthValidator(slipKindNoteMaxLength));
  emit(state.copyWith(text: validatedText, feeling: validatedFeeling));
  return validatedText.isValid && validatedFeeling.isValid;
}
```

- One `_validate()` per cubit; name the locals `validated<Field>` and emit them together. A field that does not apply is reset
  with `toPure()`.
- Validators are non-const: `NonEmptyValidator()`, `MinLengthValidator(n)`, `MaxLengthValidator(n)`, `PatternValidator(regex)`,
  `NumberRangeValidator(min, max)`, `EmailValidator()`, `PasswordValidator()`, `ConfirmValueValidator(value)` and
  `CompositeValidator([...])`. Domain limits live in the feature; compose the generic validators or add a local `Validator<T>`.
- Widgets render `errorText: l10n.<field>Errors.selectOrNull(field.errorName)`.
- A sheet with text input is a `StatelessWidget` returning `BlocProvider(create: (_) => XSheetCubit()..start(...))`. Its cubit has no
  constructor dependencies and `submit()` returns the result (or null when invalid). Never keep `FormInput` fields in `setState`.
  Reference: `features/gifts/presentation/gift_sheet/`. Reference form cubit: `features/slips/presentation/slip_kind/cubit/`.

## Rendering

The page selects the read slot and hands it to `SkeletonizerResourceWidget` (`packages/common_ui`), which owns every branch. The page
template is in `new-feature`. Points that matter here:

- Do not write a `switch` over the `Resource` for a read slot, and do not wrap the widget in another `Skeletonizer`.
- `fakeValue` is what `successBuilder` gets while loading, so it must have the real shape (a list slot needs a list of fakes).
- On `Loading` after a `Success`, the widget reuses the last value as the skeleton input, so a refresh keeps content on screen. Do
  not add an `isRefreshing` flag.
- Failures render with `AppErrorView(exception:, onRetry:)`, and retry is the cubit method that failed. Never show
  `exception.l10nKey` or `toString()` to the user; a feature error map uses `errors.selectOrFallback(exception.l10nKey)`.
- A list is an `InfiniteListView`, which owns pull-to-refresh and pagination. It has no empty builder: render one `BaseEmptyState`
  row for zero items. An empty list is a successful result, not a failure.

## Rebuild discipline

- Split the body into private `StatelessWidget` classes, each reading one slice:
  `context.select((GiftsCubit cubit) => cubit.state.gifts is Failure)`. Select a value, not the whole state.
- Use `context.select` for every state read and `context.read` for callbacks. Never add `BlocBuilder`, `BlocSelector` or `buildWhen`.
  A widget that needs several slices calls `context.select` once per slice.
- Private widgets are classes with primary constructors, not `Builder` lambdas or `build` helper methods.
- `BlocProvider(create:)` lives in `wrappedRoute`; `BlocProvider.value` is for the app-level cubits in `app.dart` and for tests.

## Side effects

Navigation and toasts belong in a `BlocListener` above the widgets they affect, never in `build` or in the cubit:

```dart
BlocListener<GiftsCubit, GiftsState>(
  listenWhen: (previous, current) => previous.saveAction != current.saveAction,
  listener: (context, state) {
    final action = state.saveAction;
    if (action is Failure) {
      BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey), variant: BaseToastVariant.error);
    }
  },
  child: ...,
)
```

`BaseToast.show(context, message)` has a neutral variant (a confirmation, optionally with an undo action) and an error variant (a
background failure, optionally with a retry). Only one toast shows at a time.

## Gotchas

- A read slot that starts as `Initial` flashes blank; start it as `Loading`.
- Never return `Resource` from a repository, and never keep a second copy of the data in a non-`Resource` field.
- Models must be `Equatable` over all fields, or two identical fetches look like a state change.
- One cubit per page or flow, created in `wrappedRoute`; never a singleton or a global provider for a page.
- In tests, close the cubit (`addTearDown(cubit.close)`) and pass mocks through the constructor.
