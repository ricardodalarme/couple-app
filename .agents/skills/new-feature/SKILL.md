---
name: new-feature
description: Scaffold a complete feature in the app — folder layout, data layer, DI module, Cubit with Resource state, pages, route, localization keys, tests and Storybook. Use when adding any feature, screen, page, form or flow under app/lib/features, including small requests like "add a detail page" or "build an onboarding step", even if the user does not mention architecture.
---

# Adding a feature

A feature is one user-facing capability in `app/lib/features/<snake_case_name>/`. `gifts` is the reference for a feature that reads
and writes server data, with a page and a sheet; copy its shapes. Do not invent product behavior or backend surface: if the
request is ambiguous or needs a table, query or mutation the schema snapshot does not have, ask.

## Definition of done

1. `data/` data sources, models, mappers and a repository (only if the feature touches data).
2. `di/<feature>_injection_module.dart`, **and** the module added to `main.dart::_registerModules()`.
3. `presentation/<page>/` with `<name>_page.dart` (`@RoutePage()`), `cubit/` and `widgets/`.
4. The route in `app/lib/router/app_router.dart`, then `melos gen`.
5. Keys in `app/lib/l10n/en/<feature>.json` and `pt/<feature>.json`, then `melos l10n`.
6. Tests that mirror `app/lib` under `app/test/features/<feature>/` (see `testing`).
7. A Storybook example for any reusable widget (see `storybook`).
8. `melos gen`, `melos l10n`, `melos l10n:analyze`, `melos lint` and `melos test` pass, and you ran the screen.

## Step 1: shape

| Situation | Layout |
| --- | --- |
| One screen that reads or writes server data | `di/`, `data/`, `presentation/<page>/` |
| One screen, UI only | `presentation/<page>/`, plus `di/` only if it needs a cubit dependency |
| Several pages or sub-features | one `presentation/<sub_feature>/` per page; data source, models, mappers and repository stay at feature level |

`presentation/` never holds files directly, even for a single page. The `gifts` tree:

```text
features/gifts/
├── data/
│   ├── data_sources/remote/{gifts_data_source.dart, queries/, mutations/, fragments/}   # each with a generated/ folder
│   ├── mappers/{gift_mapper.dart, gift_enum_mapper.dart}
│   ├── models/{gift_idea.dart, gift_budget.dart, gift_idea_status.dart}
│   └── repositories/gifts_repository.dart
├── di/gifts_injection_module.dart
└── presentation/
    ├── gifts/{gifts_page.dart, cubit/gifts_cubit.dart, cubit/gifts_state.dart}
    └── gift_sheet/{gift_sheet.dart, cubit/...}
```

## Step 2: data layer

Follow `data-layer`. Write the `.graphql` files against the committed snapshot, run `melos gen`, then the models (with a
`Model.fake()` factory), the mappers, a data source that wraps every call in `validateResponseData`, and a concrete repository that
returns models. Empty is a valid result, and `fake` values only exist behind a skeleton.

## Step 3: cubit and state

Follow `async-state`. The shape, from `GiftsCubit`:

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

- A read slot starts as `const Loading()` so the skeleton shows on the first frame; an action slot (`saveAction`) starts as
  `const Initial()` and a `BlocListener` reacts to it.
- Name the method for what it does (`load`, `add`, `save`), not `getX`.

## Step 4: page

Follow `design-system` for UI. The page creates its cubit in `wrappedRoute`, reads narrow slices with `context.select`, and
renders a read slot with `SkeletonizerResourceWidget`:

```dart
@RoutePage()
class const GiftsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (_) => AppInjector.instance.get<GiftsCubit>()..load(), child: this);

  @override
  Widget build(BuildContext context) {
    final gifts = context.select((GiftsCubit cubit) => cubit.state.gifts);
    return BaseView(
      appBar: BaseAppBar(title: context.l10n.gifts.title),
      body: BaseRefreshable(
        onRefresh: context.read<GiftsCubit>().load,
        child: BaseStackedContent(
          body: SkeletonizerResourceWidget<List<GiftIdea>>(
            gifts,
            fakeValue: [GiftIdea.fake(), GiftIdea.fake()],
            successBuilder: (values) => values.isEmpty ? const _Empty() : _Sections(gifts: values),
            failureBuilder: (exception) =>
                AppErrorView(exception: exception, onRetry: context.read<GiftsCubit>().load),
          ),
        ),
      ),
    );
  }
}
```

- `fakeValue` must have the same shape as real data, or the skeleton jumps when it lands.
- Failures use `AppErrorView` (`features/_shared/presentation/errors/`), which picks the copy from the exception code and backs off
  retries. Do not hand-build an error state.
- Split the body into private widgets that each `context.select` one slice. Never `BlocBuilder`, `BlocSelector` or `buildWhen`;
  `BlocListener` (with `listenWhen`) is for side effects such as a toast.
- Lists use `InfiniteListView`, which owns pull-to-refresh and pagination. Handle zero items with one `BaseEmptyState`.

## Step 5: DI

Follow `dependency-injection`. Data sources and repositories are lazy singletons and cubits are factories:

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

Add `GiftsInjectionModule()` to `main.dart::_registerModules()`; forgetting it fails at runtime with "not registered".

## Step 6: route

Follow `routing`. Add `AutoRoute(page: GiftsRoute.page)` to `app_router.dart` (a flat root route unless it is a tab), run `melos gen`.
The tabs are Today, Slips, Together and Memories under `HomeRoute`; a new tab needs a child route and an entry in `HomePage`'s
`routes`.

## Step 7: localization and tests

Follow `localization` (add `en` and `pt`, never machine-translate inline) and `testing`. For `gifts` the tests are the data source,
the mappers (one file each), the model, the repository, the cubit and the page, at the mirrored paths.

## Gotchas

- There is no domain or use-case layer: cubits call repositories directly.
- Cubits take no runtime constructor arguments. Pass ids into methods or use route parameters.
- A sheet with text input gets its own cubit, created in a `BlocProvider` inside the sheet (`gifts/presentation/gift_sheet`); do not
  keep `FormInput` fields in a `StatefulWidget`.
- Do not use `BlocProvider.value` in app code (tests only); the page creates its cubit.
- Never hand-edit generated files; commit the output of `melos gen` and `melos l10n`.
- Do not invent server data. Unknown and empty are valid states, and the UI says so.
