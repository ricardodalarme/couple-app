// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQuerySpiceCards {
  factory VariablesQuerySpiceCards({required String locale}) =>
      VariablesQuerySpiceCards._({r'locale': locale});

  VariablesQuerySpiceCards._(this._$data);

  factory VariablesQuerySpiceCards.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$locale = data['locale'];
    result$data['locale'] = (l$locale as String);
    return VariablesQuerySpiceCards._(result$data);
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
    if (other is! VariablesQuerySpiceCards || runtimeType != other.runtimeType) {
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

class QuerySpiceCards {
  QuerySpiceCards({required this.contentItemsCollection, this.$__typename = 'Query'});

  factory QuerySpiceCards.fromJson(Map<String, dynamic> json) {
    final l$contentItemsCollection = json['contentItemsCollection'];
    final l$$__typename = json['__typename'];
    return QuerySpiceCards(
      contentItemsCollection: QuerySpiceCardscontentItemsCollection.fromJson(
        (l$contentItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QuerySpiceCardscontentItemsCollection contentItemsCollection;

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
    if (other is! QuerySpiceCards || runtimeType != other.runtimeType) {
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

const documentNodeQuerySpiceCards = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SpiceCards'),
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
                value: IntValueNode(value: '30'),
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
                            value: StringValueNode(value: 'spice_card', isBlock: false),
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
QuerySpiceCards _parserFnQuerySpiceCards(Map<String, dynamic> data) =>
    QuerySpiceCards.fromJson(data);
typedef OnQueryCompleteQuerySpiceCards = FutureOr<void> Function(
  Map<String, dynamic>?,
  QuerySpiceCards?,
);

class OptionsQuerySpiceCards extends graphql.QueryOptions<QuerySpiceCards> {
  OptionsQuerySpiceCards({
    String? operationName,
    required VariablesQuerySpiceCards variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QuerySpiceCards? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQuerySpiceCards? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQuerySpiceCards(data)),
         onError: onError,
         document: documentNodeQuerySpiceCards,
         parserFn: _parserFnQuerySpiceCards,
       );

  final OnQueryCompleteQuerySpiceCards? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQuerySpiceCards extends graphql.WatchQueryOptions<QuerySpiceCards> {
  WatchOptionsQuerySpiceCards({
    String? operationName,
    required VariablesQuerySpiceCards variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QuerySpiceCards? typedOptimisticResult,
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
         document: documentNodeQuerySpiceCards,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQuerySpiceCards,
       );
}

class FetchMoreOptionsQuerySpiceCards extends graphql.FetchMoreOptions {
  FetchMoreOptionsQuerySpiceCards({
    required graphql.UpdateQuery updateQuery,
    required VariablesQuerySpiceCards variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQuerySpiceCards,
       );
}

extension ClientExtensionQuerySpiceCards on graphql.GraphQLClient {
  Future<graphql.QueryResult<QuerySpiceCards>> querySpiceCards(
    OptionsQuerySpiceCards options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QuerySpiceCards> watchQuerySpiceCards(
    WatchOptionsQuerySpiceCards options,
  ) => this.watchQuery(options);

  void writeQuerySpiceCards({
    required QuerySpiceCards data,
    required VariablesQuerySpiceCards variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQuerySpiceCards),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QuerySpiceCards? readQuerySpiceCards({
    required VariablesQuerySpiceCards variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySpiceCards),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QuerySpiceCards.fromJson(result);
  }
}

class QuerySpiceCardscontentItemsCollection {
  QuerySpiceCardscontentItemsCollection({
    required this.edges,
    this.$__typename = 'ContentItemsConnection',
  });

  factory QuerySpiceCardscontentItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QuerySpiceCardscontentItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QuerySpiceCardscontentItemsCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QuerySpiceCardscontentItemsCollectionedges> edges;

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
    if (other is! QuerySpiceCardscontentItemsCollection || runtimeType != other.runtimeType) {
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

class QuerySpiceCardscontentItemsCollectionedges {
  QuerySpiceCardscontentItemsCollectionedges({
    required this.node,
    this.$__typename = 'ContentItemsEdge',
  });

  factory QuerySpiceCardscontentItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QuerySpiceCardscontentItemsCollectionedges(
      node: QuerySpiceCardscontentItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QuerySpiceCardscontentItemsCollectionedgesnode node;

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
    if (other is! QuerySpiceCardscontentItemsCollectionedges || runtimeType != other.runtimeType) {
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

class QuerySpiceCardscontentItemsCollectionedgesnode {
  QuerySpiceCardscontentItemsCollectionedgesnode({
    required this.slug,
    required this.title,
    this.$__typename = 'ContentItems',
  });

  factory QuerySpiceCardscontentItemsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return QuerySpiceCardscontentItemsCollectionedgesnode(
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
    if (other is! QuerySpiceCardscontentItemsCollectionedgesnode ||
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
