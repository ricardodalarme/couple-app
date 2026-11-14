// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryDateIdeaSuggestions {
  factory VariablesQueryDateIdeaSuggestions({required String locale}) =>
      VariablesQueryDateIdeaSuggestions._({r'locale': locale});

  VariablesQueryDateIdeaSuggestions._(this._$data);

  factory VariablesQueryDateIdeaSuggestions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$locale = data['locale'];
    result$data['locale'] = (l$locale as String);
    return VariablesQueryDateIdeaSuggestions._(result$data);
  }

  Map<String, dynamic> _$data;

  String get locale => (_$data['locale'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$locale = locale;
    result$data['locale'] = l$locale;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryDateIdeaSuggestions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$locale = locale;
    final lOther$locale = other.locale;
    if (l$locale != lOther$locale) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$locale = locale;
    return Object.hashAll([l$locale]);
  }
}

class QueryDateIdeaSuggestions {
  QueryDateIdeaSuggestions({required this.contentItemsCollection, this.$__typename = 'Query'});

  factory QueryDateIdeaSuggestions.fromJson(Map<String, dynamic> json) {
    final l$contentItemsCollection = json['contentItemsCollection'];
    final l$$__typename = json['__typename'];
    return QueryDateIdeaSuggestions(
      contentItemsCollection: QueryDateIdeaSuggestionscontentItemsCollection.fromJson(
        (l$contentItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryDateIdeaSuggestionscontentItemsCollection contentItemsCollection;

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
    if (other is! QueryDateIdeaSuggestions || runtimeType != other.runtimeType) {
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

const documentNodeQueryDateIdeaSuggestions = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'DateIdeaSuggestions'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'locale')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
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
                value: IntValueNode(value: '10'),
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
                            value: EnumValueNode(name: NameNode(value: 'date_idea')),
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
                      name: NameNode(value: 'plusOnly'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: BooleanValueNode(value: false),
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
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'position'),
                          value: EnumValueNode(name: NameNode(value: 'AscNullsLast')),
                        ),
                      ],
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
QueryDateIdeaSuggestions _parserFnQueryDateIdeaSuggestions(Map<String, dynamic> data) =>
    QueryDateIdeaSuggestions.fromJson(data);
typedef OnQueryCompleteQueryDateIdeaSuggestions = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryDateIdeaSuggestions?,
);

class OptionsQueryDateIdeaSuggestions extends graphql.QueryOptions<QueryDateIdeaSuggestions> {
  OptionsQueryDateIdeaSuggestions({
    String? operationName,
    required VariablesQueryDateIdeaSuggestions variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryDateIdeaSuggestions? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryDateIdeaSuggestions? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DateIdeaSuggestions',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryDateIdeaSuggestions(data)),
         onError: onError,
         document: documentNodeQueryDateIdeaSuggestions,
         parserFn: _parserFnQueryDateIdeaSuggestions,
       );

  final OnQueryCompleteQueryDateIdeaSuggestions? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryDateIdeaSuggestions
    extends graphql.WatchQueryOptions<QueryDateIdeaSuggestions> {
  WatchOptionsQueryDateIdeaSuggestions({
    String? operationName,
    required VariablesQueryDateIdeaSuggestions variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryDateIdeaSuggestions? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DateIdeaSuggestions',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryDateIdeaSuggestions,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryDateIdeaSuggestions,
       );
}

class FetchMoreOptionsQueryDateIdeaSuggestions extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryDateIdeaSuggestions({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryDateIdeaSuggestions variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryDateIdeaSuggestions,
       );
}

extension ClientExtensionQueryDateIdeaSuggestions on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryDateIdeaSuggestions>> queryDateIdeaSuggestions(
    OptionsQueryDateIdeaSuggestions options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryDateIdeaSuggestions> watchQueryDateIdeaSuggestions(
    WatchOptionsQueryDateIdeaSuggestions options,
  ) => this.watchQuery(options);

  void writeQueryDateIdeaSuggestions({
    required QueryDateIdeaSuggestions data,
    required VariablesQueryDateIdeaSuggestions variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryDateIdeaSuggestions),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryDateIdeaSuggestions? readQueryDateIdeaSuggestions({
    required VariablesQueryDateIdeaSuggestions variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryDateIdeaSuggestions),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryDateIdeaSuggestions.fromJson(result);
  }
}

class QueryDateIdeaSuggestionscontentItemsCollection {
  QueryDateIdeaSuggestionscontentItemsCollection({
    required this.edges,
    this.$__typename = 'ContentItemsConnection',
  });

  factory QueryDateIdeaSuggestionscontentItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryDateIdeaSuggestionscontentItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryDateIdeaSuggestionscontentItemsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryDateIdeaSuggestionscontentItemsCollectionedges> edges;

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
    if (other is! QueryDateIdeaSuggestionscontentItemsCollection ||
        runtimeType != other.runtimeType) {
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

class QueryDateIdeaSuggestionscontentItemsCollectionedges {
  QueryDateIdeaSuggestionscontentItemsCollectionedges({
    required this.node,
    this.$__typename = 'ContentItemsEdge',
  });

  factory QueryDateIdeaSuggestionscontentItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryDateIdeaSuggestionscontentItemsCollectionedges(
      node: QueryDateIdeaSuggestionscontentItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryDateIdeaSuggestionscontentItemsCollectionedgesnode node;

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
    if (other is! QueryDateIdeaSuggestionscontentItemsCollectionedges ||
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

class QueryDateIdeaSuggestionscontentItemsCollectionedgesnode {
  QueryDateIdeaSuggestionscontentItemsCollectionedgesnode({
    required this.slug,
    required this.title,
    this.$__typename = 'ContentItems',
  });

  factory QueryDateIdeaSuggestionscontentItemsCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return QueryDateIdeaSuggestionscontentItemsCollectionedgesnode(
      slug: (l$slug as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String slug;

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slug = slug;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slug, l$title, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryDateIdeaSuggestionscontentItemsCollectionedgesnode ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}
