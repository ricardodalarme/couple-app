// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryLearnedItems {
  QueryLearnedItems({required this.learnedItemsCollection, this.$__typename = 'Query'});

  factory QueryLearnedItems.fromJson(Map<String, dynamic> json) {
    final l$learnedItemsCollection = json['learnedItemsCollection'];
    final l$$__typename = json['__typename'];
    return QueryLearnedItems(
      learnedItemsCollection: QueryLearnedItemslearnedItemsCollection.fromJson(
        (l$learnedItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLearnedItemslearnedItemsCollection learnedItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$learnedItemsCollection = learnedItemsCollection;
    _resultData['learnedItemsCollection'] = l$learnedItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$learnedItemsCollection = learnedItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$learnedItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryLearnedItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$learnedItemsCollection = learnedItemsCollection;
    final lOther$learnedItemsCollection = other.learnedItemsCollection;
    if (l$learnedItemsCollection != lOther$learnedItemsCollection) {
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

const documentNodeQueryLearnedItems = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'LearnedItems'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'learnedItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
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
                              name: NameNode(value: 'target'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'text'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'excerpt'),
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
                              name: NameNode(value: 'createdAt'),
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
QueryLearnedItems _parserFnQueryLearnedItems(Map<String, dynamic> data) =>
    QueryLearnedItems.fromJson(data);
typedef OnQueryCompleteQueryLearnedItems = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryLearnedItems?,
);

class OptionsQueryLearnedItems extends graphql.QueryOptions<QueryLearnedItems> {
  OptionsQueryLearnedItems({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLearnedItems? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryLearnedItems? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'LearnedItems',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryLearnedItems(data)),
         onError: onError,
         document: documentNodeQueryLearnedItems,
         parserFn: _parserFnQueryLearnedItems,
       );

  final OnQueryCompleteQueryLearnedItems? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryLearnedItems extends graphql.WatchQueryOptions<QueryLearnedItems> {
  WatchOptionsQueryLearnedItems({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLearnedItems? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'LearnedItems',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryLearnedItems,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryLearnedItems,
       );
}

class FetchMoreOptionsQueryLearnedItems extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryLearnedItems({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryLearnedItems);
}

extension ClientExtensionQueryLearnedItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryLearnedItems>> queryLearnedItems([
    OptionsQueryLearnedItems? options,
  ]) async => await this.query(options ?? OptionsQueryLearnedItems());

  graphql.ObservableQuery<QueryLearnedItems> watchQueryLearnedItems([
    WatchOptionsQueryLearnedItems? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryLearnedItems());

  void writeQueryLearnedItems({required QueryLearnedItems data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryLearnedItems)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryLearnedItems? readQueryLearnedItems({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryLearnedItems)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryLearnedItems.fromJson(result);
  }
}

class QueryLearnedItemslearnedItemsCollection {
  QueryLearnedItemslearnedItemsCollection({
    required this.edges,
    this.$__typename = 'LearnedItemsConnection',
  });

  factory QueryLearnedItemslearnedItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryLearnedItemslearnedItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                QueryLearnedItemslearnedItemsCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryLearnedItemslearnedItemsCollectionedges> edges;

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
    if (other is! QueryLearnedItemslearnedItemsCollection || runtimeType != other.runtimeType) {
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

class QueryLearnedItemslearnedItemsCollectionedges {
  QueryLearnedItemslearnedItemsCollectionedges({
    required this.node,
    this.$__typename = 'LearnedItemsEdge',
  });

  factory QueryLearnedItemslearnedItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryLearnedItemslearnedItemsCollectionedges(
      node: QueryLearnedItemslearnedItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLearnedItemslearnedItemsCollectionedgesnode node;

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
    if (other is! QueryLearnedItemslearnedItemsCollectionedges ||
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

class QueryLearnedItemslearnedItemsCollectionedgesnode {
  QueryLearnedItemslearnedItemsCollectionedgesnode({
    required this.id,
    required this.target,
    required this.text,
    this.excerpt,
    required this.status,
    required this.createdAt,
    this.$__typename = 'LearnedItems',
  });

  factory QueryLearnedItemslearnedItemsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$target = json['target'];
    final l$text = json['text'];
    final l$excerpt = json['excerpt'];
    final l$status = json['status'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return QueryLearnedItemslearnedItemsCollectionedgesnode(
      id: (l$id as String),
      target: fromJsonEnumLearnedItemTarget((l$target as String)),
      text: (l$text as String),
      excerpt: (l$excerpt as String?),
      status: fromJsonEnumLearnedItemStatus((l$status as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final EnumLearnedItemTarget target;

  final String text;

  final String? excerpt;

  final EnumLearnedItemStatus status;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$target = target;
    _resultData['target'] = toJsonEnumLearnedItemTarget(l$target);
    final l$text = text;
    _resultData['text'] = l$text;
    final l$excerpt = excerpt;
    _resultData['excerpt'] = l$excerpt;
    final l$status = status;
    _resultData['status'] = toJsonEnumLearnedItemStatus(l$status);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = ((v) => v.toUtc().toIso8601String())(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$target = target;
    final l$text = text;
    final l$excerpt = excerpt;
    final l$status = status;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$target,
      l$text,
      l$excerpt,
      l$status,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryLearnedItemslearnedItemsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$target = target;
    final lOther$target = other.target;
    if (l$target != lOther$target) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$excerpt = excerpt;
    final lOther$excerpt = other.excerpt;
    if (l$excerpt != lOther$excerpt) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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
