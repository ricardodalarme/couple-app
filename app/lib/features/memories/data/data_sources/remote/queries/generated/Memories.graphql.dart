// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMemories {
  QueryMemories({required this.memoriesCollection, this.$__typename = 'Query'});

  factory QueryMemories.fromJson(Map<String, dynamic> json) {
    final l$memoriesCollection = json['memoriesCollection'];
    final l$$__typename = json['__typename'];
    return QueryMemories(
      memoriesCollection: QueryMemoriesmemoriesCollection.fromJson(
        (l$memoriesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMemoriesmemoriesCollection memoriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$memoriesCollection = memoriesCollection;
    _resultData['memoriesCollection'] = l$memoriesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$memoriesCollection = memoriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$memoriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMemories || runtimeType != other.runtimeType) {
      return false;
    }
    final l$memoriesCollection = memoriesCollection;
    final lOther$memoriesCollection = other.memoriesCollection;
    if (l$memoriesCollection != lOther$memoriesCollection) {
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

const documentNodeQueryMemories = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Memories'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'memoriesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'happenedOn'),
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
                              name: NameNode(value: 'body'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'happenedOn'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'place'),
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
QueryMemories _parserFnQueryMemories(Map<String, dynamic> data) => QueryMemories.fromJson(data);
typedef OnQueryCompleteQueryMemories = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMemories?,
);

class OptionsQueryMemories extends graphql.QueryOptions<QueryMemories> {
  OptionsQueryMemories({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMemories? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMemories? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'Memories',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMemories(data)),
         onError: onError,
         document: documentNodeQueryMemories,
         parserFn: _parserFnQueryMemories,
       );

  final OnQueryCompleteQueryMemories? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMemories extends graphql.WatchQueryOptions<QueryMemories> {
  WatchOptionsQueryMemories({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMemories? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'Memories',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMemories,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMemories,
       );
}

class FetchMoreOptionsQueryMemories extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMemories({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMemories);
}

extension ClientExtensionQueryMemories on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMemories>> queryMemories([OptionsQueryMemories? options]) async =>
      await this.query(options ?? OptionsQueryMemories());

  graphql.ObservableQuery<QueryMemories> watchQueryMemories([WatchOptionsQueryMemories? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryMemories());

  void writeQueryMemories({required QueryMemories data, bool broadcast = true}) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryMemories)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMemories? readQueryMemories({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMemories)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMemories.fromJson(result);
  }
}

class QueryMemoriesmemoriesCollection {
  QueryMemoriesmemoriesCollection({required this.edges, this.$__typename = 'MemoriesConnection'});

  factory QueryMemoriesmemoriesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryMemoriesmemoriesCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryMemoriesmemoriesCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryMemoriesmemoriesCollectionedges> edges;

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
    if (other is! QueryMemoriesmemoriesCollection || runtimeType != other.runtimeType) {
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

class QueryMemoriesmemoriesCollectionedges {
  QueryMemoriesmemoriesCollectionedges({required this.node, this.$__typename = 'MemoriesEdge'});

  factory QueryMemoriesmemoriesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryMemoriesmemoriesCollectionedges(
      node: QueryMemoriesmemoriesCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMemoriesmemoriesCollectionedgesnode node;

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
    if (other is! QueryMemoriesmemoriesCollectionedges || runtimeType != other.runtimeType) {
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

class QueryMemoriesmemoriesCollectionedgesnode {
  QueryMemoriesmemoriesCollectionedgesnode({
    required this.id,
    required this.title,
    this.body,
    required this.happenedOn,
    this.place,
    this.$__typename = 'Memories',
  });

  factory QueryMemoriesmemoriesCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$happenedOn = json['happenedOn'];
    final l$place = json['place'];
    final l$$__typename = json['__typename'];
    return QueryMemoriesmemoriesCollectionedgesnode(
      id: (l$id as String),
      title: (l$title as String),
      body: (l$body as String?),
      happenedOn: DateTime.parse((l$happenedOn as String)),
      place: (l$place as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? body;

  final DateTime happenedOn;

  final String? place;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$happenedOn = happenedOn;
    _resultData['happenedOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$happenedOn);
    final l$place = place;
    _resultData['place'] = l$place;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$body = body;
    final l$happenedOn = happenedOn;
    final l$place = place;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$body, l$happenedOn, l$place, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMemoriesmemoriesCollectionedgesnode || runtimeType != other.runtimeType) {
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
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$happenedOn = happenedOn;
    final lOther$happenedOn = other.happenedOn;
    if (l$happenedOn != lOther$happenedOn) {
      return false;
    }
    final l$place = place;
    final lOther$place = other.place;
    if (l$place != lOther$place) {
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
