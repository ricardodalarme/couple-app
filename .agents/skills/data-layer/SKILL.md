---
name: data-layer
description: Implement a feature's data layer in the app — GraphQL query/fragment files, graphql_codegen generated types, GQLClient data sources with one-shot queries and validateResponseData, mappers from generated types to hand-written Equatable models with fake values, and concrete repositories using Logger and LocalizedException. Use when adding a query, mutation, data source, model, mapper, or repository, when working with .graphql files, codegen, or when the user says "fetch data from the server".
---

# Data layer in the app

Server data flows through GraphQL (pg_graphql) like this:

```text
.graphql file → generated/*.graphql.dart (codegen) → DataSource → Mapper → Model
                                                              → Repository → Cubit

read:     Future<GeneratedType> → Future<List<Model>> → cubit Loading → Success / Failure
mutation: Future<GeneratedType> → Future<Model>       → cubit action Loading → Success / Failure
```

There is **no interface/impl split** for data sources or repositories — they are
plain concrete classes with constructor injection.

Reads are **one-shot Futures** in this starter. The cubit awaits the repository's
`getX()`, and the repository awaits a single `GQLClient.query(...)`. There is no
`watchX` or reactive stream convention in the current app; do not introduce one
unless the whole feature is being migrated deliberately.

Use a network-only fetch policy when a call must bypass the cache, for example a
pull-to-refresh or an imperative revalidation. The starter's post data source
uses the client default policies; keep the choice explicit when freshness
matters.

## 1. GraphQL files

Location: `app/lib/features/<feature>/data/data_sources/`

```text
data_sources/
├── post_data_source.dart
├── queries/GetPosts.graphql
├── queries/generated/GetPosts.graphql.dart       (generated, committed)
├── fragments/PostFragment.graphql
└── fragments/generated/PostFragment.graphql.dart (generated, committed)
```

Real example (`post`):

```graphql
query GetPosts($first: Int, $after: Cursor) {
  postsCollection(first: $first, after: $after, orderBy: [{ id: DescNullsLast }]) {
    edges {
      node {
        ...PostFragment
      }
    }
  }
}
```

```graphql
fragment PostFragment on posts {
  id
  title
  content
  author_image_url
}
```

Conventions:

- One operation per file, named `GetX` / `CreateX` / `UpdateX` / `DeleteX`.
  The file name matches the operation (`GetPosts.graphql`).
- Reuse fields through fragments; every feature owns its own fragment file.
- The shared schema snapshot lives at
  `app/lib/features/_shared/data/data_sources/schema.graphql` with generated
  types in `.../generated/schema.graphql.dart`. Only `_shared` has a schema file;
  features only add queries and fragments.
- Refresh the schema snapshot when the backend API changes, then run
  `melos gen`. Do not invent a table, field, query, or mutation the snapshot
  does not expose.
- Run `melos gen` after editing any `.graphql` file. **Never edit `generated/`.**

Generator facts (configured in `app/build.yaml`):

- `clients: [graphql]`, `namingSeparator: ""`,
  `disableCopyWithGeneration: true`, `outputDirectory: generated`.
- Generated names look like `OptionsQueryGetPosts`,
  `VariablesQueryGetPosts`, `QueryGetPostspostsCollection`,
  `FragmentPostFragment`.
- Generated header is `// dart format width=100`; formatting is applied by the
  generator, so leave it alone.
- Custom scalars: `DateTime` → `DateTime`, `JSONObject` → `Map<String, dynamic>`.
  Add a scalar mapping in `app/build.yaml` before using a new custom scalar.

## 2. Data source

```dart
class PostDataSource({required GQLClient graphQLClient}) {
  final GQLClient _client = graphQLClient;

  Future<QueryGetPostspostsCollection> getPosts({int? first, String? after}) async {
    final response = await _client.query(
      OptionsQueryGetPosts(
        variables: VariablesQueryGetPosts(first: first, after: after),
      ),
    );

    return validateResponseData(response, getData: (data) => data?.postsCollection);
  }
}
```

- Name it `<Feature>DataSource` and keep it in
  `data_sources/<feature>_data_source.dart`.
- `GQLClient` comes from `package:network/network.dart`; it is registered in
  `SharedInjectionModule` and must be constructor-injected.
- Wrap every one-shot query and mutation in
  `validateResponseData(response, getData: ...)`.
  - `getData` is **required** by the current helper signature. It receives
    `T?`, so return the selected collection (e.g. `data?.postsCollection`).
  - The helper throws `ServerResponseException(code)` or `NoDataException` for
    you. Do not add your own null-check after it.
  - When the whole payload is the value, return `data` from `getData`.
- Never let `QueryResult`, `ObservableQuery`, or `WatchQueryOptions` escape the
  data source. Return the generated collection type.
- Mutations use `_client.mutate(OptionsMutationX(variables: ...))` and
  `validateResponseData` in the same way.
- `FetchPolicy`, `Store`, and `QueryResult` are re-exported by
  `package:network`; app code must never import `package:graphql` directly.
- No fake data. An empty response is a valid result and should reach the UI as
  an empty state.

## 3. Model

Hand-written, `Equatable`, using primary constructor syntax, with a `fake` for
skeletons:

```dart
class const Post({
  required final String id,
  required final String title,
  required final String body,
  final String? authorImageUrl,
}) with Equatable {
  static const Post fake = Post(
    id: '1',
    title: 'Post title',
    body: 'Post body used only as a skeleton placeholder.',
  );

  @override
  List<Object?> get props => [id, title, body, authorImageUrl];
}
```

- Primary constructors: `class const <Model>({ ... }) with Equatable`.
- No freezed / json_serializable. Types from codegen are **not** models — map
  them.
- Use `sealed` when the server type has variants; switch exhaustively in the
  mapper.
- Domain enums live in `models/` with a `toSource()` extension in `mappers/`.
  Domain enums use camelCase values; generated enums use snake_case. Keep the
  two separate.
- Add `static const fake` to every model used behind `Skeletonizer`. The fake is
  a placeholder, never production data.

## 4. Mapper

```dart
extension PostResponseMapper on FragmentPostFragment {
  Post toModel() {
    return Post(id: id, title: title, body: content, authorImageUrl: author_image_url);
  }
}
```

- One `extension <Generated>Mapper on <GeneratedType>` per model, in
  `data/mappers/`.
- Always handle the generated `$unknown` enum case by throwing
  `UnimplementedError`.
- `DateTime` fields usually arrive as `DateTime`; when a field is nullable or
  string-shaped in the schema, parse explicitly with `DateTime.parse(...)`.
  Follow the file you are extending.

## 5. Repository

```dart
class PostRepository({required final PostDataSource _postDataSource}) {
  final Logger _logger = Logger('PostRepository');
  final PostDataSource _postDataSource;

  Future<List<Post>> getPosts({int? first, String? after}) async {
    _logger.info('Fetching posts first=$first after=$after');
    try {
      final result = await _postDataSource.getPosts(first: first, after: after);
      final posts = result.edges.map((edge) => edge.node.toModel()).toList();
      _logger.trace('Fetched ${posts.length} posts');
      return posts;
    } catch (e, stack) {
      _logger.error('Failed to fetch posts', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
```

- Concrete class named `<Feature>Repository`; constructor-inject the data source.
- Return domain models, never generated types.
- Use `final Logger _logger = Logger('<Name>Repository');` from
  `package:logger/logger.dart`.
- GraphQL exceptions are already `LocalizedException` → log and `rethrow`.
- Third-party exceptions must be translated:
  ```dart
  LocalizedException _toLocalizedException(AuthenticationException exception) {
    return LocalizedException(l10nKey: exception.code);
  }
  ```
  The l10n key must exist in the feature's error map, with `other` as fallback.
- Do not introduce a repository interface or abstraction — one concrete class.
- Never return `Resource` from a repository. `Resource` is a presentation type;
  the cubit owns `Failure` and the UI state.

## 6. Errors and localization

- `validateResponseData` extracts the server code from the first GraphQL error
  and throws `ServerResponseException(code)`, which carries its own
  `LocalizedException` key.
- Map server and validation codes to localized copy through a slang `(map)`
  namespace with an `other` entry:

  ```json
  {
    "errors(map)": {
      "serverError": "Something went wrong. Try again.",
      "unauthorized": "Your session expired. Sign in again.",
      "other": "@:common.genericError"
    }
  }
  ```

- In the UI, use
  `context.l10n.<namespace>.errors.selectOrFallback(exception.l10nKey)`.
- Never show a raw server code or a raw exception message.

## 7. Schema changes

This repository does not own the backend database or migrations. The GraphQL
schema is a committed snapshot under
`app/lib/features/_shared/data/data_sources/schema.graphql`.

- When the API changes, refresh the snapshot, run `melos gen`, and commit the
  snapshot plus generated files.
- Do not add local tables, migrations, or database policy files to this repo.
- Do not hand-write a query against a field the snapshot does not contain. Ask
  for the backend change first.

## Gotchas

- A read is a `Future`, not a stream, in the current app. Do not reintroduce a
  `watchX` convention just for one feature.
- `getData` is required by `validateResponseData`; it receives nullable data and
  throws `NoDataException` when the selected value is null.
- A repository returns models, never generated types and never `Resource`.
- `melos gen` runs build_runner for the whole workspace and is required before
  analyzing new GraphQL code. CI does not run it — commit generated files.
- Generated names are fixed by codegen config: `OptionsX`, `VariablesX`,
  `FragmentX`, `Enum<table_name>`. Do not rename them or re-export aliases.
- Mappers must not throw for valid data variants; exhaustive switches are
  enforced by the analyzer, so handle `$unknown` explicitly.
- Do not introduce `UseCase`, abstract repositories, or DTO layers; keep the
  single concrete repository shape.
- Do not import `package:graphql` directly in app code; use the re-exports from
  `package:network`.
- No fake records in the data layer. Empty is a valid, honest result.
