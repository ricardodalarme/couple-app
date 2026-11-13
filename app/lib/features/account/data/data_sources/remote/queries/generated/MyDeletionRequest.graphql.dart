// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyDeletionRequest {
  QueryMyDeletionRequest({required this.deletionRequestsCollection, this.$__typename = 'Query'});

  factory QueryMyDeletionRequest.fromJson(Map<String, dynamic> json) {
    final l$deletionRequestsCollection = json['deletionRequestsCollection'];
    final l$$__typename = json['__typename'];
    return QueryMyDeletionRequest(
      deletionRequestsCollection: QueryMyDeletionRequestdeletionRequestsCollection.fromJson(
        (l$deletionRequestsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyDeletionRequestdeletionRequestsCollection deletionRequestsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletionRequestsCollection = deletionRequestsCollection;
    _resultData['deletionRequestsCollection'] = l$deletionRequestsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletionRequestsCollection = deletionRequestsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deletionRequestsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyDeletionRequest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletionRequestsCollection = deletionRequestsCollection;
    final lOther$deletionRequestsCollection = other.deletionRequestsCollection;
    if (l$deletionRequestsCollection != lOther$deletionRequestsCollection) {
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

const documentNodeQueryMyDeletionRequest = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyDeletionRequest'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deletionRequestsCollection'),
            alias: null,
            arguments: [
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
                              name: NameNode(value: 'requestedAt'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'purgeAfter'),
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
QueryMyDeletionRequest _parserFnQueryMyDeletionRequest(Map<String, dynamic> data) =>
    QueryMyDeletionRequest.fromJson(data);
typedef OnQueryCompleteQueryMyDeletionRequest = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyDeletionRequest?,
);

class OptionsQueryMyDeletionRequest extends graphql.QueryOptions<QueryMyDeletionRequest> {
  OptionsQueryMyDeletionRequest({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyDeletionRequest? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyDeletionRequest? onComplete,
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
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryMyDeletionRequest(data)),
         onError: onError,
         document: documentNodeQueryMyDeletionRequest,
         parserFn: _parserFnQueryMyDeletionRequest,
       );

  final OnQueryCompleteQueryMyDeletionRequest? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyDeletionRequest extends graphql.WatchQueryOptions<QueryMyDeletionRequest> {
  WatchOptionsQueryMyDeletionRequest({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyDeletionRequest? typedOptimisticResult,
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
         document: documentNodeQueryMyDeletionRequest,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyDeletionRequest,
       );
}

class FetchMoreOptionsQueryMyDeletionRequest extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyDeletionRequest({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyDeletionRequest);
}

extension ClientExtensionQueryMyDeletionRequest on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyDeletionRequest>> queryMyDeletionRequest([
    OptionsQueryMyDeletionRequest? options,
  ]) async => await this.query(options ?? OptionsQueryMyDeletionRequest());

  graphql.ObservableQuery<QueryMyDeletionRequest> watchQueryMyDeletionRequest([
    WatchOptionsQueryMyDeletionRequest? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMyDeletionRequest());

  void writeQueryMyDeletionRequest({required QueryMyDeletionRequest data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyDeletionRequest)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMyDeletionRequest? readQueryMyDeletionRequest({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyDeletionRequest)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyDeletionRequest.fromJson(result);
  }
}

class QueryMyDeletionRequestdeletionRequestsCollection {
  QueryMyDeletionRequestdeletionRequestsCollection({
    required this.edges,
    this.$__typename = 'DeletionRequestsConnection',
  });

  factory QueryMyDeletionRequestdeletionRequestsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryMyDeletionRequestdeletionRequestsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryMyDeletionRequestdeletionRequestsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryMyDeletionRequestdeletionRequestsCollectionedges> edges;

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
    if (other is! QueryMyDeletionRequestdeletionRequestsCollection ||
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

class QueryMyDeletionRequestdeletionRequestsCollectionedges {
  QueryMyDeletionRequestdeletionRequestsCollectionedges({
    required this.node,
    this.$__typename = 'DeletionRequestsEdge',
  });

  factory QueryMyDeletionRequestdeletionRequestsCollectionedges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryMyDeletionRequestdeletionRequestsCollectionedges(
      node: QueryMyDeletionRequestdeletionRequestsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyDeletionRequestdeletionRequestsCollectionedgesnode node;

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
    if (other is! QueryMyDeletionRequestdeletionRequestsCollectionedges ||
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

class QueryMyDeletionRequestdeletionRequestsCollectionedgesnode {
  QueryMyDeletionRequestdeletionRequestsCollectionedgesnode({
    required this.requestedAt,
    required this.purgeAfter,
    this.$__typename = 'DeletionRequests',
  });

  factory QueryMyDeletionRequestdeletionRequestsCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$requestedAt = json['requestedAt'];
    final l$purgeAfter = json['purgeAfter'];
    final l$$__typename = json['__typename'];
    return QueryMyDeletionRequestdeletionRequestsCollectionedgesnode(
      requestedAt: DateTime.parse((l$requestedAt as String)),
      purgeAfter: DateTime.parse((l$purgeAfter as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime requestedAt;

  final DateTime purgeAfter;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestedAt = requestedAt;
    _resultData['requestedAt'] = ((v) => v.toUtc().toIso8601String())(l$requestedAt);
    final l$purgeAfter = purgeAfter;
    _resultData['purgeAfter'] = ((v) => v.toUtc().toIso8601String())(l$purgeAfter);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestedAt = requestedAt;
    final l$purgeAfter = purgeAfter;
    final l$$__typename = $__typename;
    return Object.hashAll([l$requestedAt, l$purgeAfter, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyDeletionRequestdeletionRequestsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestedAt = requestedAt;
    final lOther$requestedAt = other.requestedAt;
    if (l$requestedAt != lOther$requestedAt) {
      return false;
    }
    final l$purgeAfter = purgeAfter;
    final lOther$purgeAfter = other.purgeAfter;
    if (l$purgeAfter != lOther$purgeAfter) {
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
