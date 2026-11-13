// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryListDetail {
  factory VariablesQueryListDetail({required String id}) => VariablesQueryListDetail._({r'id': id});

  VariablesQueryListDetail._(this._$data);

  factory VariablesQueryListDetail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesQueryListDetail._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryListDetail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class QueryListDetail {
  QueryListDetail({required this.listsCollection, this.$__typename = 'Query'});

  factory QueryListDetail.fromJson(Map<String, dynamic> json) {
    final l$listsCollection = json['listsCollection'];
    final l$$__typename = json['__typename'];
    return QueryListDetail(
      listsCollection: QueryListDetaillistsCollection.fromJson(
        (l$listsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryListDetaillistsCollection listsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$listsCollection = listsCollection;
    _resultData['listsCollection'] = l$listsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$listsCollection = listsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$listsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryListDetail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$listsCollection = listsCollection;
    final lOther$listsCollection = other.listsCollection;
    if (l$listsCollection != lOther$listsCollection) {
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

const documentNodeQueryListDetail = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListDetail'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'listsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'id'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'id')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
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
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'authorId'),
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
                              name: NameNode(value: 'kind'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'coupleId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'listItemsCollection'),
                              alias: null,
                              arguments: [
                                ArgumentNode(
                                  name: NameNode(value: 'orderBy'),
                                  value: ListValueNode(
                                    values: [
                                      ObjectValueNode(
                                        fields: [
                                          ObjectFieldNode(
                                            name: NameNode(value: 'position'),
                                            value: EnumValueNode(
                                              name: NameNode(value: 'AscNullsLast'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ObjectValueNode(
                                        fields: [
                                          ObjectFieldNode(
                                            name: NameNode(value: 'createdAt'),
                                            value: EnumValueNode(
                                              name: NameNode(value: 'AscNullsLast'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ArgumentNode(
                                  name: NameNode(value: 'first'),
                                  value: IntValueNode(value: '500'),
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
                                                name: NameNode(value: 'id'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(value: 'listId'),
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
                                                name: NameNode(value: 'status'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(value: 'position'),
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
QueryListDetail _parserFnQueryListDetail(Map<String, dynamic> data) =>
    QueryListDetail.fromJson(data);
typedef OnQueryCompleteQueryListDetail = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryListDetail?,
);

class OptionsQueryListDetail extends graphql.QueryOptions<QueryListDetail> {
  OptionsQueryListDetail({
    String? operationName,
    required VariablesQueryListDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryListDetail? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryListDetail? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryListDetail(data)),
         onError: onError,
         document: documentNodeQueryListDetail,
         parserFn: _parserFnQueryListDetail,
       );

  final OnQueryCompleteQueryListDetail? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryListDetail extends graphql.WatchQueryOptions<QueryListDetail> {
  WatchOptionsQueryListDetail({
    String? operationName,
    required VariablesQueryListDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryListDetail? typedOptimisticResult,
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
         document: documentNodeQueryListDetail,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryListDetail,
       );
}

class FetchMoreOptionsQueryListDetail extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryListDetail({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryListDetail variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryListDetail,
       );
}

extension ClientExtensionQueryListDetail on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryListDetail>> queryListDetail(
    OptionsQueryListDetail options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryListDetail> watchQueryListDetail(
    WatchOptionsQueryListDetail options,
  ) => this.watchQuery(options);

  void writeQueryListDetail({
    required QueryListDetail data,
    required VariablesQueryListDetail variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryListDetail),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryListDetail? readQueryListDetail({
    required VariablesQueryListDetail variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryListDetail),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryListDetail.fromJson(result);
  }
}

class QueryListDetaillistsCollection {
  QueryListDetaillistsCollection({required this.edges, this.$__typename = 'ListsConnection'});

  factory QueryListDetaillistsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryListDetaillistsCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryListDetaillistsCollectionedges> edges;

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
    if (other is! QueryListDetaillistsCollection || runtimeType != other.runtimeType) {
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

class QueryListDetaillistsCollectionedges {
  QueryListDetaillistsCollectionedges({required this.node, this.$__typename = 'ListsEdge'});

  factory QueryListDetaillistsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsCollectionedges(
      node: QueryListDetaillistsCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryListDetaillistsCollectionedgesnode node;

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
    if (other is! QueryListDetaillistsCollectionedges || runtimeType != other.runtimeType) {
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

class QueryListDetaillistsCollectionedgesnode {
  QueryListDetaillistsCollectionedgesnode({
    required this.id,
    required this.authorId,
    required this.title,
    required this.kind,
    this.coupleId,
    this.listItemsCollection,
    this.$__typename = 'Lists',
  });

  factory QueryListDetaillistsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$title = json['title'];
    final l$kind = json['kind'];
    final l$coupleId = json['coupleId'];
    final l$listItemsCollection = json['listItemsCollection'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsCollectionedgesnode(
      id: (l$id as String),
      authorId: (l$authorId as String),
      title: (l$title as String),
      kind: (l$kind as String),
      coupleId: (l$coupleId as String?),
      listItemsCollection: l$listItemsCollection == null
          ? null
          : QueryListDetaillistsCollectionedgesnodelistItemsCollection.fromJson(
              (l$listItemsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String authorId;

  final String title;

  final String kind;

  final String? coupleId;

  final QueryListDetaillistsCollectionedgesnodelistItemsCollection? listItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$kind = kind;
    _resultData['kind'] = l$kind;
    final l$coupleId = coupleId;
    _resultData['coupleId'] = l$coupleId;
    final l$listItemsCollection = listItemsCollection;
    _resultData['listItemsCollection'] = l$listItemsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$authorId = authorId;
    final l$title = title;
    final l$kind = kind;
    final l$coupleId = coupleId;
    final l$listItemsCollection = listItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$authorId,
      l$title,
      l$kind,
      l$coupleId,
      l$listItemsCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryListDetaillistsCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$authorId = authorId;
    final lOther$authorId = other.authorId;
    if (l$authorId != lOther$authorId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$listItemsCollection = listItemsCollection;
    final lOther$listItemsCollection = other.listItemsCollection;
    if (l$listItemsCollection != lOther$listItemsCollection) {
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

class QueryListDetaillistsCollectionedgesnodelistItemsCollection {
  QueryListDetaillistsCollectionedgesnodelistItemsCollection({
    required this.edges,
    this.$__typename = 'ListItemsConnection',
  });

  factory QueryListDetaillistsCollectionedgesnodelistItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsCollectionedgesnodelistItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges> edges;

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
    if (other is! QueryListDetaillistsCollectionedgesnodelistItemsCollection ||
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

class QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges {
  QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges({
    required this.node,
    this.$__typename = 'ListItemsEdge',
  });

  factory QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges(
      node: QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode node;

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
    if (other is! QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges ||
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

class QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode {
  QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode({
    required this.id,
    required this.listId,
    required this.title,
    required this.status,
    required this.position,
    this.$__typename = 'ListItems',
  });

  factory QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$listId = json['listId'];
    final l$title = json['title'];
    final l$status = json['status'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode(
      id: (l$id as String),
      listId: (l$listId as String),
      title: (l$title as String),
      status: (l$status as String),
      position: (l$position as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String listId;

  final String title;

  final String status;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$listId = listId;
    _resultData['listId'] = l$listId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$listId = listId;
    final l$title = title;
    final l$status = status;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$listId, l$title, l$status, l$position, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$listId = listId;
    final lOther$listId = other.listId;
    if (l$listId != lOther$listId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
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
