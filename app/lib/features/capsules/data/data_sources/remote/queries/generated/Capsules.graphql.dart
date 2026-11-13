// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryCapsules {
  QueryCapsules({required this.capsulesCollection, this.$__typename = 'Query'});

  factory QueryCapsules.fromJson(Map<String, dynamic> json) {
    final l$capsulesCollection = json['capsulesCollection'];
    final l$$__typename = json['__typename'];
    return QueryCapsules(
      capsulesCollection: QueryCapsulescapsulesCollection.fromJson(
        (l$capsulesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCapsulescapsulesCollection capsulesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$capsulesCollection = capsulesCollection;
    _resultData['capsulesCollection'] = l$capsulesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$capsulesCollection = capsulesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$capsulesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCapsules || runtimeType != other.runtimeType) {
      return false;
    }
    final l$capsulesCollection = capsulesCollection;
    final lOther$capsulesCollection = other.capsulesCollection;
    if (l$capsulesCollection != lOther$capsulesCollection) {
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

const documentNodeQueryCapsules = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Capsules'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'capsulesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'opensOn'),
                          value: EnumValueNode(name: NameNode(value: 'AscNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '100'),
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
                              name: NameNode(value: 'coupleId'),
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
                              name: NameNode(value: 'opensOn'),
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
QueryCapsules _parserFnQueryCapsules(Map<String, dynamic> data) => QueryCapsules.fromJson(data);
typedef OnQueryCompleteQueryCapsules = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryCapsules?,
);

class OptionsQueryCapsules extends graphql.QueryOptions<QueryCapsules> {
  OptionsQueryCapsules({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCapsules? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryCapsules? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryCapsules(data)),
         onError: onError,
         document: documentNodeQueryCapsules,
         parserFn: _parserFnQueryCapsules,
       );

  final OnQueryCompleteQueryCapsules? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryCapsules extends graphql.WatchQueryOptions<QueryCapsules> {
  WatchOptionsQueryCapsules({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCapsules? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryCapsules,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryCapsules,
       );
}

class FetchMoreOptionsQueryCapsules extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryCapsules({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryCapsules);
}

extension ClientExtensionQueryCapsules on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryCapsules>> queryCapsules([OptionsQueryCapsules? options]) async =>
      await this.query(options ?? OptionsQueryCapsules());

  graphql.ObservableQuery<QueryCapsules> watchQueryCapsules([WatchOptionsQueryCapsules? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryCapsules());

  void writeQueryCapsules({required QueryCapsules data, bool broadcast = true}) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryCapsules)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryCapsules? readQueryCapsules({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryCapsules)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryCapsules.fromJson(result);
  }
}

class QueryCapsulescapsulesCollection {
  QueryCapsulescapsulesCollection({required this.edges, this.$__typename = 'CapsulesConnection'});

  factory QueryCapsulescapsulesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryCapsulescapsulesCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryCapsulescapsulesCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryCapsulescapsulesCollectionedges> edges;

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
    if (other is! QueryCapsulescapsulesCollection || runtimeType != other.runtimeType) {
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

class QueryCapsulescapsulesCollectionedges {
  QueryCapsulescapsulesCollectionedges({required this.node, this.$__typename = 'CapsulesEdge'});

  factory QueryCapsulescapsulesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryCapsulescapsulesCollectionedges(
      node: QueryCapsulescapsulesCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCapsulescapsulesCollectionedgesnode node;

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
    if (other is! QueryCapsulescapsulesCollectionedges || runtimeType != other.runtimeType) {
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

class QueryCapsulescapsulesCollectionedgesnode {
  QueryCapsulescapsulesCollectionedgesnode({
    required this.id,
    required this.authorId,
    this.coupleId,
    required this.body,
    required this.opensOn,
    this.$__typename = 'Capsules',
  });

  factory QueryCapsulescapsulesCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$coupleId = json['coupleId'];
    final l$body = json['body'];
    final l$opensOn = json['opensOn'];
    final l$$__typename = json['__typename'];
    return QueryCapsulescapsulesCollectionedgesnode(
      id: (l$id as String),
      authorId: (l$authorId as String),
      coupleId: (l$coupleId as String?),
      body: (l$body as String),
      opensOn: DateTime.parse((l$opensOn as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String authorId;

  final String? coupleId;

  final String body;

  final DateTime opensOn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$coupleId = coupleId;
    _resultData['coupleId'] = l$coupleId;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$opensOn = opensOn;
    _resultData['opensOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$opensOn);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$authorId = authorId;
    final l$coupleId = coupleId;
    final l$body = body;
    final l$opensOn = opensOn;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$authorId, l$coupleId, l$body, l$opensOn, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCapsulescapsulesCollectionedgesnode || runtimeType != other.runtimeType) {
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
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$opensOn = opensOn;
    final lOther$opensOn = other.opensOn;
    if (l$opensOn != lOther$opensOn) {
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
