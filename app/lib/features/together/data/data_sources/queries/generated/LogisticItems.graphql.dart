// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryLogisticItems {
  QueryLogisticItems({required this.logisticItemsCollection, this.$__typename = 'Query'});

  factory QueryLogisticItems.fromJson(Map<String, dynamic> json) {
    final l$logisticItemsCollection = json['logisticItemsCollection'];
    final l$$__typename = json['__typename'];
    return QueryLogisticItems(
      logisticItemsCollection: QueryLogisticItemslogisticItemsCollection.fromJson(
        (l$logisticItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLogisticItemslogisticItemsCollection logisticItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$logisticItemsCollection = logisticItemsCollection;
    _resultData['logisticItemsCollection'] = l$logisticItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$logisticItemsCollection = logisticItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$logisticItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryLogisticItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$logisticItemsCollection = logisticItemsCollection;
    final lOther$logisticItemsCollection = other.logisticItemsCollection;
    if (l$logisticItemsCollection != lOther$logisticItemsCollection) {
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

const documentNodeQueryLogisticItems = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'LogisticItems'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'logisticItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'createdAt'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '200'),
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
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'assigneeId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'doneAt'),
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
QueryLogisticItems _parserFnQueryLogisticItems(Map<String, dynamic> data) =>
    QueryLogisticItems.fromJson(data);
typedef OnQueryCompleteQueryLogisticItems = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryLogisticItems?,
);

class OptionsQueryLogisticItems extends graphql.QueryOptions<QueryLogisticItems> {
  OptionsQueryLogisticItems({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLogisticItems? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryLogisticItems? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryLogisticItems(data)),
         onError: onError,
         document: documentNodeQueryLogisticItems,
         parserFn: _parserFnQueryLogisticItems,
       );

  final OnQueryCompleteQueryLogisticItems? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryLogisticItems extends graphql.WatchQueryOptions<QueryLogisticItems> {
  WatchOptionsQueryLogisticItems({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLogisticItems? typedOptimisticResult,
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
         document: documentNodeQueryLogisticItems,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryLogisticItems,
       );
}

class FetchMoreOptionsQueryLogisticItems extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryLogisticItems({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryLogisticItems);
}

extension ClientExtensionQueryLogisticItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryLogisticItems>> queryLogisticItems([
    OptionsQueryLogisticItems? options,
  ]) async => await this.query(options ?? OptionsQueryLogisticItems());

  graphql.ObservableQuery<QueryLogisticItems> watchQueryLogisticItems([
    WatchOptionsQueryLogisticItems? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryLogisticItems());

  void writeQueryLogisticItems({required QueryLogisticItems data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryLogisticItems)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryLogisticItems? readQueryLogisticItems({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryLogisticItems)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryLogisticItems.fromJson(result);
  }
}

class QueryLogisticItemslogisticItemsCollection {
  QueryLogisticItemslogisticItemsCollection({
    required this.edges,
    this.$__typename = 'LogisticItemsConnection',
  });

  factory QueryLogisticItemslogisticItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryLogisticItemslogisticItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryLogisticItemslogisticItemsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryLogisticItemslogisticItemsCollectionedges> edges;

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
    if (other is! QueryLogisticItemslogisticItemsCollection || runtimeType != other.runtimeType) {
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

class QueryLogisticItemslogisticItemsCollectionedges {
  QueryLogisticItemslogisticItemsCollectionedges({
    required this.node,
    this.$__typename = 'LogisticItemsEdge',
  });

  factory QueryLogisticItemslogisticItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryLogisticItemslogisticItemsCollectionedges(
      node: QueryLogisticItemslogisticItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLogisticItemslogisticItemsCollectionedgesnode node;

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
    if (other is! QueryLogisticItemslogisticItemsCollectionedges ||
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

class QueryLogisticItemslogisticItemsCollectionedgesnode {
  QueryLogisticItemslogisticItemsCollectionedgesnode({
    required this.id,
    required this.title,
    this.assigneeId,
    this.doneAt,
    required this.authorId,
    this.$__typename = 'LogisticItems',
  });

  factory QueryLogisticItemslogisticItemsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$assigneeId = json['assigneeId'];
    final l$doneAt = json['doneAt'];
    final l$authorId = json['authorId'];
    final l$$__typename = json['__typename'];
    return QueryLogisticItemslogisticItemsCollectionedgesnode(
      id: (l$id as String),
      title: (l$title as String),
      assigneeId: (l$assigneeId as String?),
      doneAt: l$doneAt == null ? null : DateTime.parse((l$doneAt as String)),
      authorId: (l$authorId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? assigneeId;

  final DateTime? doneAt;

  final String authorId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$assigneeId = assigneeId;
    _resultData['assigneeId'] = l$assigneeId;
    final l$doneAt = doneAt;
    _resultData['doneAt'] = l$doneAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$doneAt);
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$assigneeId = assigneeId;
    final l$doneAt = doneAt;
    final l$authorId = authorId;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$assigneeId, l$doneAt, l$authorId, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryLogisticItemslogisticItemsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$assigneeId = assigneeId;
    final lOther$assigneeId = other.assigneeId;
    if (l$assigneeId != lOther$assigneeId) {
      return false;
    }
    final l$doneAt = doneAt;
    final lOther$doneAt = other.doneAt;
    if (l$doneAt != lOther$doneAt) {
      return false;
    }
    final l$authorId = authorId;
    final lOther$authorId = other.authorId;
    if (l$authorId != lOther$authorId) {
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
