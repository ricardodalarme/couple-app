// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryOpenGuidedSession {
  QueryOpenGuidedSession({required this.repairSessionsCollection, this.$__typename = 'Query'});

  factory QueryOpenGuidedSession.fromJson(Map<String, dynamic> json) {
    final l$repairSessionsCollection = json['repairSessionsCollection'];
    final l$$__typename = json['__typename'];
    return QueryOpenGuidedSession(
      repairSessionsCollection: QueryOpenGuidedSessionrepairSessionsCollection.fromJson(
        (l$repairSessionsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryOpenGuidedSessionrepairSessionsCollection repairSessionsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$repairSessionsCollection = repairSessionsCollection;
    _resultData['repairSessionsCollection'] = l$repairSessionsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$repairSessionsCollection = repairSessionsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$repairSessionsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryOpenGuidedSession || runtimeType != other.runtimeType) {
      return false;
    }
    final l$repairSessionsCollection = repairSessionsCollection;
    final lOther$repairSessionsCollection = other.repairSessionsCollection;
    if (l$repairSessionsCollection != lOther$repairSessionsCollection) {
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

const documentNodeQueryOpenGuidedSession = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'OpenGuidedSession'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'repairSessionsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'path'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: EnumValueNode(name: NameNode(value: 'guided')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'completedAt'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'is'),
                            value: EnumValueNode(name: NameNode(value: 'NULL')),
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
                              name: NameNode(value: 'step'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'draft'),
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
QueryOpenGuidedSession _parserFnQueryOpenGuidedSession(Map<String, dynamic> data) =>
    QueryOpenGuidedSession.fromJson(data);
typedef OnQueryCompleteQueryOpenGuidedSession = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryOpenGuidedSession?,
);

class OptionsQueryOpenGuidedSession extends graphql.QueryOptions<QueryOpenGuidedSession> {
  OptionsQueryOpenGuidedSession({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryOpenGuidedSession? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryOpenGuidedSession? onComplete,
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
                   onComplete(data, data == null ? null : _parserFnQueryOpenGuidedSession(data)),
         onError: onError,
         document: documentNodeQueryOpenGuidedSession,
         parserFn: _parserFnQueryOpenGuidedSession,
       );

  final OnQueryCompleteQueryOpenGuidedSession? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryOpenGuidedSession extends graphql.WatchQueryOptions<QueryOpenGuidedSession> {
  WatchOptionsQueryOpenGuidedSession({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryOpenGuidedSession? typedOptimisticResult,
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
         document: documentNodeQueryOpenGuidedSession,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryOpenGuidedSession,
       );
}

class FetchMoreOptionsQueryOpenGuidedSession extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryOpenGuidedSession({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryOpenGuidedSession);
}

extension ClientExtensionQueryOpenGuidedSession on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryOpenGuidedSession>> queryOpenGuidedSession([
    OptionsQueryOpenGuidedSession? options,
  ]) async => await this.query(options ?? OptionsQueryOpenGuidedSession());

  graphql.ObservableQuery<QueryOpenGuidedSession> watchQueryOpenGuidedSession([
    WatchOptionsQueryOpenGuidedSession? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryOpenGuidedSession());

  void writeQueryOpenGuidedSession({required QueryOpenGuidedSession data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryOpenGuidedSession)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryOpenGuidedSession? readQueryOpenGuidedSession({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryOpenGuidedSession)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryOpenGuidedSession.fromJson(result);
  }
}

class QueryOpenGuidedSessionrepairSessionsCollection {
  QueryOpenGuidedSessionrepairSessionsCollection({
    required this.edges,
    this.$__typename = 'RepairSessionsConnection',
  });

  factory QueryOpenGuidedSessionrepairSessionsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryOpenGuidedSessionrepairSessionsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryOpenGuidedSessionrepairSessionsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryOpenGuidedSessionrepairSessionsCollectionedges> edges;

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
    if (other is! QueryOpenGuidedSessionrepairSessionsCollection ||
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

class QueryOpenGuidedSessionrepairSessionsCollectionedges {
  QueryOpenGuidedSessionrepairSessionsCollectionedges({
    required this.node,
    this.$__typename = 'RepairSessionsEdge',
  });

  factory QueryOpenGuidedSessionrepairSessionsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryOpenGuidedSessionrepairSessionsCollectionedges(
      node: QueryOpenGuidedSessionrepairSessionsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryOpenGuidedSessionrepairSessionsCollectionedgesnode node;

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
    if (other is! QueryOpenGuidedSessionrepairSessionsCollectionedges ||
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

class QueryOpenGuidedSessionrepairSessionsCollectionedgesnode {
  QueryOpenGuidedSessionrepairSessionsCollectionedgesnode({
    required this.id,
    required this.step,
    this.draft,
    this.$__typename = 'RepairSessions',
  });

  factory QueryOpenGuidedSessionrepairSessionsCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$step = json['step'];
    final l$draft = json['draft'];
    final l$$__typename = json['__typename'];
    return QueryOpenGuidedSessionrepairSessionsCollectionedgesnode(
      id: (l$id as String),
      step: (l$step as int),
      draft: (l$draft as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int step;

  final String? draft;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$step = step;
    _resultData['step'] = l$step;
    final l$draft = draft;
    _resultData['draft'] = l$draft;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$step = step;
    final l$draft = draft;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$step, l$draft, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryOpenGuidedSessionrepairSessionsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$step = step;
    final lOther$step = other.step;
    if (l$step != lOther$step) {
      return false;
    }
    final l$draft = draft;
    final lOther$draft = other.draft;
    if (l$draft != lOther$draft) {
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
