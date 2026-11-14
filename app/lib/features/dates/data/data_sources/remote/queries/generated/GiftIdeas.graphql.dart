// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryGiftIdeas {
  QueryGiftIdeas({required this.giftIdeasCollection, this.$__typename = 'Query'});

  factory QueryGiftIdeas.fromJson(Map<String, dynamic> json) {
    final l$giftIdeasCollection = json['giftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return QueryGiftIdeas(
      giftIdeasCollection: QueryGiftIdeasgiftIdeasCollection.fromJson(
        (l$giftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGiftIdeasgiftIdeasCollection giftIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$giftIdeasCollection = giftIdeasCollection;
    _resultData['giftIdeasCollection'] = l$giftIdeasCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$giftIdeasCollection = giftIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$giftIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGiftIdeas || runtimeType != other.runtimeType) {
      return false;
    }
    final l$giftIdeasCollection = giftIdeasCollection;
    final lOther$giftIdeasCollection = other.giftIdeasCollection;
    if (l$giftIdeasCollection != lOther$giftIdeasCollection) {
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

const documentNodeQueryGiftIdeas = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GiftIdeas'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'giftIdeasCollection'),
            alias: null,
            arguments: [
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
                            value: EnumValueNode(name: NameNode(value: 'idea')),
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
                              name: NameNode(value: 'status'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'isMine'),
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
QueryGiftIdeas _parserFnQueryGiftIdeas(Map<String, dynamic> data) => QueryGiftIdeas.fromJson(data);
typedef OnQueryCompleteQueryGiftIdeas = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryGiftIdeas?,
);

class OptionsQueryGiftIdeas extends graphql.QueryOptions<QueryGiftIdeas> {
  OptionsQueryGiftIdeas({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGiftIdeas? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryGiftIdeas? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'GiftIdeas',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryGiftIdeas(data)),
         onError: onError,
         document: documentNodeQueryGiftIdeas,
         parserFn: _parserFnQueryGiftIdeas,
       );

  final OnQueryCompleteQueryGiftIdeas? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryGiftIdeas extends graphql.WatchQueryOptions<QueryGiftIdeas> {
  WatchOptionsQueryGiftIdeas({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGiftIdeas? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'GiftIdeas',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGiftIdeas,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryGiftIdeas,
       );
}

class FetchMoreOptionsQueryGiftIdeas extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryGiftIdeas({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryGiftIdeas);
}

extension ClientExtensionQueryGiftIdeas on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryGiftIdeas>> queryGiftIdeas([
    OptionsQueryGiftIdeas? options,
  ]) async => await this.query(options ?? OptionsQueryGiftIdeas());

  graphql.ObservableQuery<QueryGiftIdeas> watchQueryGiftIdeas([
    WatchOptionsQueryGiftIdeas? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryGiftIdeas());

  void writeQueryGiftIdeas({required QueryGiftIdeas data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryGiftIdeas)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryGiftIdeas? readQueryGiftIdeas({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryGiftIdeas)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryGiftIdeas.fromJson(result);
  }
}

class QueryGiftIdeasgiftIdeasCollection {
  QueryGiftIdeasgiftIdeasCollection({
    required this.edges,
    this.$__typename = 'GiftIdeasConnection',
  });

  factory QueryGiftIdeasgiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryGiftIdeasgiftIdeasCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryGiftIdeasgiftIdeasCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryGiftIdeasgiftIdeasCollectionedges> edges;

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
    if (other is! QueryGiftIdeasgiftIdeasCollection || runtimeType != other.runtimeType) {
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

class QueryGiftIdeasgiftIdeasCollectionedges {
  QueryGiftIdeasgiftIdeasCollectionedges({required this.node, this.$__typename = 'GiftIdeasEdge'});

  factory QueryGiftIdeasgiftIdeasCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryGiftIdeasgiftIdeasCollectionedges(
      node: QueryGiftIdeasgiftIdeasCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGiftIdeasgiftIdeasCollectionedgesnode node;

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
    if (other is! QueryGiftIdeasgiftIdeasCollectionedges || runtimeType != other.runtimeType) {
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

class QueryGiftIdeasgiftIdeasCollectionedgesnode {
  QueryGiftIdeasgiftIdeasCollectionedgesnode({
    required this.id,
    required this.title,
    required this.status,
    this.isMine,
    this.$__typename = 'GiftIdeas',
  });

  factory QueryGiftIdeasgiftIdeasCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$status = json['status'];
    final l$isMine = json['isMine'];
    final l$$__typename = json['__typename'];
    return QueryGiftIdeasgiftIdeasCollectionedgesnode(
      id: (l$id as String),
      title: (l$title as String),
      status: fromJsonEnumGiftIdeaStatus((l$status as String)),
      isMine: (l$isMine as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final EnumGiftIdeaStatus status;

  final bool? isMine;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$status = status;
    _resultData['status'] = toJsonEnumGiftIdeaStatus(l$status);
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$status = status;
    final l$isMine = isMine;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$status, l$isMine, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGiftIdeasgiftIdeasCollectionedgesnode || runtimeType != other.runtimeType) {
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
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
