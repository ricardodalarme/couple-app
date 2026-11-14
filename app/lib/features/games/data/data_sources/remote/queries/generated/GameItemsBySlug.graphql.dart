// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryGameItemsBySlug {
  factory VariablesQueryGameItemsBySlug({
    required EnumContentKind kind,
    required String locale,
    required List<String> slugs,
  }) => VariablesQueryGameItemsBySlug._({r'kind': kind, r'locale': locale, r'slugs': slugs});

  VariablesQueryGameItemsBySlug._(this._$data);

  factory VariablesQueryGameItemsBySlug.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$kind = data['kind'];
    result$data['kind'] = fromJsonEnumContentKind((l$kind as String));
    final l$locale = data['locale'];
    result$data['locale'] = (l$locale as String);
    final l$slugs = data['slugs'];
    result$data['slugs'] = (l$slugs as List<dynamic>).map((e) => (e as String)).toList();
    return VariablesQueryGameItemsBySlug._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumContentKind get kind => (_$data['kind'] as EnumContentKind);

  String get locale => (_$data['locale'] as String);

  List<String> get slugs => (_$data['slugs'] as List<String>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$kind = kind;
    result$data['kind'] = toJsonEnumContentKind(l$kind);
    final l$locale = locale;
    result$data['locale'] = l$locale;
    final l$slugs = slugs;
    result$data['slugs'] = l$slugs.map((e) => e).toList();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryGameItemsBySlug || runtimeType != other.runtimeType) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$locale = locale;
    final lOther$locale = other.locale;
    if (l$locale != lOther$locale) {
      return false;
    }
    final l$slugs = slugs;
    final lOther$slugs = other.slugs;
    if (l$slugs.length != lOther$slugs.length) {
      return false;
    }
    for (int i = 0; i < l$slugs.length; i++) {
      final l$slugs$entry = l$slugs[i];
      final lOther$slugs$entry = lOther$slugs[i];
      if (l$slugs$entry != lOther$slugs$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$kind = kind;
    final l$locale = locale;
    final l$slugs = slugs;
    return Object.hashAll([l$kind, l$locale, Object.hashAll(l$slugs.map((v) => v))]);
  }
}

class QueryGameItemsBySlug {
  QueryGameItemsBySlug({required this.contentItemsCollection, this.$__typename = 'Query'});

  factory QueryGameItemsBySlug.fromJson(Map<String, dynamic> json) {
    final l$contentItemsCollection = json['contentItemsCollection'];
    final l$$__typename = json['__typename'];
    return QueryGameItemsBySlug(
      contentItemsCollection: QueryGameItemsBySlugcontentItemsCollection.fromJson(
        (l$contentItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGameItemsBySlugcontentItemsCollection contentItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$contentItemsCollection = contentItemsCollection;
    _resultData['contentItemsCollection'] = l$contentItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$contentItemsCollection = contentItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$contentItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGameItemsBySlug || runtimeType != other.runtimeType) {
      return false;
    }
    final l$contentItemsCollection = contentItemsCollection;
    final lOther$contentItemsCollection = other.contentItemsCollection;
    if (l$contentItemsCollection != lOther$contentItemsCollection) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

const documentNodeQueryGameItemsBySlug = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GameItemsBySlug'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'ContentKind'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'locale')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'slugs')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'contentItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '60'),
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'kind'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'kind')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'locale'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'locale')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'slug'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'in'),
                            value: VariableNode(name: NameNode(value: 'slugs')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'published'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: BooleanValueNode(value: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'slug'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'body'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
QueryGameItemsBySlug _parserFnQueryGameItemsBySlug(Map<String, dynamic> data) =>
    QueryGameItemsBySlug.fromJson(data);
typedef OnQueryCompleteQueryGameItemsBySlug = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryGameItemsBySlug?,
);

class OptionsQueryGameItemsBySlug extends graphql.QueryOptions<QueryGameItemsBySlug> {
  OptionsQueryGameItemsBySlug({
    String? operationName,
    required VariablesQueryGameItemsBySlug variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGameItemsBySlug? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryGameItemsBySlug? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryGameItemsBySlug(data)),
         onError: onError,
         document: documentNodeQueryGameItemsBySlug,
         parserFn: _parserFnQueryGameItemsBySlug,
       );

  final OnQueryCompleteQueryGameItemsBySlug? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryGameItemsBySlug extends graphql.WatchQueryOptions<QueryGameItemsBySlug> {
  WatchOptionsQueryGameItemsBySlug({
    String? operationName,
    required VariablesQueryGameItemsBySlug variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGameItemsBySlug? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGameItemsBySlug,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryGameItemsBySlug,
       );
}

class FetchMoreOptionsQueryGameItemsBySlug extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryGameItemsBySlug({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryGameItemsBySlug variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGameItemsBySlug,
       );
}

extension ClientExtensionQueryGameItemsBySlug on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryGameItemsBySlug>> queryGameItemsBySlug(
    OptionsQueryGameItemsBySlug options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryGameItemsBySlug> watchQueryGameItemsBySlug(
    WatchOptionsQueryGameItemsBySlug options,
  ) => this.watchQuery(options);

  void writeQueryGameItemsBySlug({
    required QueryGameItemsBySlug data,
    required VariablesQueryGameItemsBySlug variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGameItemsBySlug),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryGameItemsBySlug? readQueryGameItemsBySlug({
    required VariablesQueryGameItemsBySlug variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGameItemsBySlug),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryGameItemsBySlug.fromJson(result);
  }
}

class QueryGameItemsBySlugcontentItemsCollection {
  QueryGameItemsBySlugcontentItemsCollection({
    required this.edges,
    this.$__typename = 'ContentItemsConnection',
  });

  factory QueryGameItemsBySlugcontentItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryGameItemsBySlugcontentItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryGameItemsBySlugcontentItemsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryGameItemsBySlugcontentItemsCollectionedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGameItemsBySlugcontentItemsCollection || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class QueryGameItemsBySlugcontentItemsCollectionedges {
  QueryGameItemsBySlugcontentItemsCollectionedges({
    required this.node,
    this.$__typename = 'ContentItemsEdge',
  });

  factory QueryGameItemsBySlugcontentItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryGameItemsBySlugcontentItemsCollectionedges(
      node: QueryGameItemsBySlugcontentItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGameItemsBySlugcontentItemsCollectionedgesnode node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGameItemsBySlugcontentItemsCollectionedges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class QueryGameItemsBySlugcontentItemsCollectionedgesnode {
  QueryGameItemsBySlugcontentItemsCollectionedgesnode({
    required this.slug,
    required this.title,
    this.body,
    this.$__typename = 'ContentItems',
  });

  factory QueryGameItemsBySlugcontentItemsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return QueryGameItemsBySlugcontentItemsCollectionedgesnode(
      slug: (l$slug as String),
      title: (l$title as String),
      body: (l$body as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String slug;

  final String title;

  final String? body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slug = slug;
    final l$title = title;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slug, l$title, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGameItemsBySlugcontentItemsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (l$slug != lOther$slug) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}
