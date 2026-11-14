---
name: data-layer
description: Implement a feature's data layer — GraphQL query, mutation and fragment files, graphql_codegen types, GQLClient data sources with validateResponseData, models with fakes, mappers (including enum mappers), and concrete repositories with a Logger. Use when adding a query, mutation, data source, model, mapper, enum or repository, when editing .graphql files or codegen, or when asked to fetch or save server data.
---

# Data layer

```text
.graphql -> generated/*.graphql.dart (codegen) -> DataSource -> Mapper -> Model -> Repository -> Cubit
```

Data sources and repositories are plain concrete classes with constructor injection: no interface and implementation split, no
use cases and no DTO layer. Reads are one-shot `Future`s: the repository awaits one `GQLClient` call. There is no `watchX` or stream
convention. `features/gifts` is the reference.

## 1. GraphQL files

```text
features/<feature>/data/data_sources/
├── remote/
│   ├── <feature>_data_source.dart
│   ├── queries/      GiftPage.graphql      + generated/GiftPage.graphql.dart
│   ├── mutations/    AddGiftWish.graphql   + generated/
│   └── fragments/    GiftWishFragment.graphql + generated/
└── local/            device storage only (*_local_data_source.dart); never imports package:network
```

- One operation per file, named for what it does (`GiftPage`, `AddGiftWish`, `SetGiftWishVisibility`); the file name is the
  operation name. Share fields through fragments.
- The schema snapshot is `app/lib/features/_shared/data/data_sources/remote/schema.graphql`. Only `_shared` holds a schema file;
  features add operations. Write a document only against fields the snapshot has. If the backend lacks one, ask for it (see
  `supabase`); do not work around it.
- After editing any `.graphql` file run `melos gen`. After a backend schema change run `melos graphql:schema` first. Never edit
  `generated/` or the snapshot by hand.
- GraphQL documents use enum literals unquoted (`kind: wish`) and enum variable types (`$kind: GiftKind!`), never `String`. The
  Dart analyzer cannot see inside a `.graphql` file, so after changing the schema, validate every document against the snapshot
  before `melos gen`.
- Codegen (`app/build.yaml`): `namingSeparator: ""`, output in `generated/`, `setOperationName: true`, scalars `Date`, `Datetime`,
  `BigInt`, `BigFloat`, `JSON`, `Opaque` and `Time` mapped to Dart types. Add a scalar mapping there before using a new custom
  scalar. Generated names are fixed: `OptionsQueryGiftPage`, `VariablesMutationAddGiftWish`, `FragmentGiftWishFragment`,
  `Enum<TypeName>`. Never rename or alias them.

## 2. Data source

```dart
class GiftsDataSource({required final GQLClient _client}) {
  Future<List<FragmentGiftWishFragment>> getGiftIdeas() async {
    final response = await _client.query(OptionsQueryGiftPage(fetchPolicy: FetchPolicy.networkOnly));
    final edges = validateResponseData(response, getData: (data) => data.giftIdeasCollection.edges);
    return [for (final edge in edges) edge.node];
  }

  Future<FragmentGiftWishFragment> addGiftWish({required String id, required String title}) async {
    final response = await _client.mutate(
      OptionsMutationAddGiftWish(variables: VariablesMutationAddGiftWish(id: id, title: title)),
    );
    return validateResponseData(
      response,
      getData: (data) => data.insertIntoGiftIdeasCollection?.records.firstOrNull,
    );
  }
}
```

- `GQLClient` comes from `package:network/network.dart` and is constructor-injected. App code never imports `package:graphql`;
  `FetchPolicy` and the other types it needs are re-exported by `package:network`.
- The client default is `cacheAndNetwork`; reads pass `FetchPolicy.networkOnly` so the cubit gets one fresh result.
- Wrap every call in `validateResponseData(response, getData: ...)`. It throws `ServerResponseException` for a failed response
  (codes `NETWORK` and `TIMEOUT` when the request did not complete, otherwise the server's stable code) and `NoDataException` when
  the data, or what `getData` selects, is null. Do not add your own null check after it.
- Retries, timeouts, de-duplication and token refresh are links in `package:network`; a data source does not implement them.
- Never let `QueryResult` or generated types escape the data layer beyond the data source's return type. A data source has no
  fake data: an empty response is a valid result.

## 3. Model

Hand-written, `Equatable`, primary constructor, with a `fake()` for skeletons:

```dart
class const GiftIdea({required final String id, required final String title, final String? note, ...}) with Equatable {
  factory fake() => const GiftIdea(id: 'fake', title: 'Gift idea', ...);

  @override
  List<Object?> get props => [id, title, note, ...];
}
```

- No freezed or json_serializable. Generated types are not models; map them.
- Add `fake()` to every model rendered behind a `Skeletonizer`. It is a placeholder, never production data, and it must have the
  same shape as real data.
- Use `sealed` when the server type has variants, and switch exhaustively in the mapper.
- Ownership flags such as `isMine` and `isShared` come from the server's computed fields; do not recompute them from user or
  couple ids in the app.

## 4. Mapper

One `extension <Generated>Mapper on <GeneratedType>` per model in `data/mappers/` (`FragmentGiftWishFragment.toModel()`). Parse a
`DateTime` explicitly only when the schema type is a string. A mapper never throws for a valid variant.

## 5. Enums

A closed set of values is a Postgres enum, so GraphQL has an enum and codegen emits `Enum<Name>` (snake_case members plus
`$unknown`). Model it as a plain camelCase Dart enum with **no** `value`, `wire`, `serverValue` or `key` field and no parser:

```dart
// models/gift_budget.dart
enum GiftBudget { free, low, medium, high }

// mappers/gift_enum_mapper.dart
extension EnumGiftBudgetMapper on EnumGiftBudget {
  GiftBudget? toModel() => switch (this) { EnumGiftBudget.free => GiftBudget.free, /* ... */ EnumGiftBudget.$unknown => null };
}

extension GiftBudgetMapper on GiftBudget {
  EnumGiftBudget toRemote() => switch (this) { GiftBudget.free => EnumGiftBudget.free, /* ... */ };
}
```

- Members are camelCase even when the stored value is snake_case (`so_so` is `soSo`); the mapper holds the spelling.
- **Add only the directions in use.** A read-only enum has `toModel()` and no `toRemote()`. Remove a direction and let the compiler
  say whether it is needed.
- Data sources take and return generated enums; repositories convert with the mapper; cubits, states, pages and models see only
  domain enums.
- Handle `$unknown` explicitly: throw `FormatException` when the value cannot be shown or acted on, or degrade (return `null`, fall
  back to a neutral member) when the UI can hide it, and say so in a one-line doc comment.
- A SQL function parameter that is an enum is not exposed by `pg_graphql`, so function parameters stay `text`. Convert with a
  `toRpc()` in the mapper (`toRemote().toJson()`), as `SlipCategoryMapper` does. The same rule covers values sent to an Edge Function:
  map the enum, do not give it a `wire` string.
- Never compare a domain value with a string literal. The analyzer only warns (`unrelated_type_equality_checks`) and the comparison
  silently never matches.
- Local storage (preferences, widget payloads) stores `.name` and reads it back with `Enum.values.asNameMap()[name]`; an unknown name
  reads as `null`. Translation keys for an enum are its `.name`.
- A mapper has its own test file under `test/features/<feature>/data/mappers/`: every domain value survives a round trip, and each
  `$unknown` behavior is asserted.

## 6. Repository

```dart
class GiftsRepository({required final GiftsDataSource _dataSource, ...}) {
  final Logger _logger = Logger('GiftsRepository');

  Future<List<GiftIdea>> getGiftIdeas() => _run('read gift wishes', () async => [
    for (final node in await _dataSource.getGiftIdeas()) if (node.isMine == true || node.isShared == true) node.toModel(),
  ]);

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
```

- A concrete `<Feature>Repository` with a `Logger` from `package:logger/logger.dart` and the data source injected. It returns domain
  models, never generated types and never `Resource`.
- Network failures are already `LocalizedException`s (`ServerResponseException`): log with context and `rethrow`. Translate a
  third-party exception (`LocalizedException(l10nKey: exception.code)`), and make sure the key exists in the feature's error map with
  an `other` fallback.
- Trim and normalize user input here (`title.trim()`, empty note to `null`), not in the data source.

## 7. Errors in the UI

Map server codes to copy through a slang `(map)` namespace with an `other` entry:

```json
{ "errors(map)": { "unauthorized": "Your session expired. Sign in again.", "other": "@:common.genericError" } }
```

The UI shows `context.l10n.<namespace>.errors.selectOrFallback(exception.l10nKey)`, or `AppErrorView`. Never show a raw server code
or exception message.

## 8. Backend changes

The backend lives in this repository under `supabase/`. A feature that needs a new table, column, query or mutation changes
`supabase/schemas/` and adds a migration first (see the `supabase` skill), then refreshes the snapshot with
`melos graphql:schema`, then `melos gen`. Ask before inventing backend surface.

## Gotchas

- `melos gen` is required before analyzing new GraphQL code, and CI does not run it: commit the generated files.
- Do not introduce `UseCase`, abstract repositories or DTOs.
- Do not import `package:graphql` in app code.
- No fake records outside a skeleton. Empty is a valid, honest result.
