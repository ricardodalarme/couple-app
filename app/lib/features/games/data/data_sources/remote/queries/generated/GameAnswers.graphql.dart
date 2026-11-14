// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryGameAnswers {
  factory VariablesQueryGameAnswers({required String sessionId}) =>
      VariablesQueryGameAnswers._({r'sessionId': sessionId});

  VariablesQueryGameAnswers._(this._$data);

  factory VariablesQueryGameAnswers.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$sessionId = data['sessionId'];
    result$data['sessionId'] = (l$sessionId as String);
    return VariablesQueryGameAnswers._(result$data);
  }

  Map<String, dynamic> _$data;

  String get sessionId => (_$data['sessionId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$sessionId = sessionId;
    result$data['sessionId'] = l$sessionId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryGameAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sessionId = sessionId;
    return Object.hashAll([l$sessionId]);
  }
}

class QueryGameAnswers {
  QueryGameAnswers({required this.gameAnswersCollection, this.$__typename = 'Query'});

  factory QueryGameAnswers.fromJson(Map<String, dynamic> json) {
    final l$gameAnswersCollection = json['gameAnswersCollection'];
    final l$$__typename = json['__typename'];
    return QueryGameAnswers(
      gameAnswersCollection: QueryGameAnswersgameAnswersCollection.fromJson(
        (l$gameAnswersCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGameAnswersgameAnswersCollection gameAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gameAnswersCollection = gameAnswersCollection;
    _resultData['gameAnswersCollection'] = l$gameAnswersCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gameAnswersCollection = gameAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$gameAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGameAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$gameAnswersCollection = gameAnswersCollection;
    final lOther$gameAnswersCollection = other.gameAnswersCollection;
    if (l$gameAnswersCollection != lOther$gameAnswersCollection) {
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

const documentNodeQueryGameAnswers = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GameAnswers'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'sessionId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'gameAnswersCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'sessionId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'sessionId')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '120'),
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
                              name: NameNode(value: 'isMine'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'idx'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'answer'),
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
QueryGameAnswers _parserFnQueryGameAnswers(Map<String, dynamic> data) =>
    QueryGameAnswers.fromJson(data);
typedef OnQueryCompleteQueryGameAnswers = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryGameAnswers?,
);

class OptionsQueryGameAnswers extends graphql.QueryOptions<QueryGameAnswers> {
  OptionsQueryGameAnswers({
    String? operationName,
    required VariablesQueryGameAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGameAnswers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryGameAnswers? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryGameAnswers(data)),
         onError: onError,
         document: documentNodeQueryGameAnswers,
         parserFn: _parserFnQueryGameAnswers,
       );

  final OnQueryCompleteQueryGameAnswers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryGameAnswers extends graphql.WatchQueryOptions<QueryGameAnswers> {
  WatchOptionsQueryGameAnswers({
    String? operationName,
    required VariablesQueryGameAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGameAnswers? typedOptimisticResult,
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
         document: documentNodeQueryGameAnswers,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryGameAnswers,
       );
}

class FetchMoreOptionsQueryGameAnswers extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryGameAnswers({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryGameAnswers variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGameAnswers,
       );
}

extension ClientExtensionQueryGameAnswers on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryGameAnswers>> queryGameAnswers(
    OptionsQueryGameAnswers options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryGameAnswers> watchQueryGameAnswers(
    WatchOptionsQueryGameAnswers options,
  ) => this.watchQuery(options);

  void writeQueryGameAnswers({
    required QueryGameAnswers data,
    required VariablesQueryGameAnswers variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGameAnswers),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryGameAnswers? readQueryGameAnswers({
    required VariablesQueryGameAnswers variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGameAnswers),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryGameAnswers.fromJson(result);
  }
}

class QueryGameAnswersgameAnswersCollection {
  QueryGameAnswersgameAnswersCollection({
    required this.edges,
    this.$__typename = 'GameAnswersConnection',
  });

  factory QueryGameAnswersgameAnswersCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryGameAnswersgameAnswersCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryGameAnswersgameAnswersCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryGameAnswersgameAnswersCollectionedges> edges;

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
    if (other is! QueryGameAnswersgameAnswersCollection || runtimeType != other.runtimeType) {
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

class QueryGameAnswersgameAnswersCollectionedges {
  QueryGameAnswersgameAnswersCollectionedges({
    required this.node,
    this.$__typename = 'GameAnswersEdge',
  });

  factory QueryGameAnswersgameAnswersCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryGameAnswersgameAnswersCollectionedges(
      node: QueryGameAnswersgameAnswersCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGameAnswersgameAnswersCollectionedgesnode node;

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
    if (other is! QueryGameAnswersgameAnswersCollectionedges || runtimeType != other.runtimeType) {
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

class QueryGameAnswersgameAnswersCollectionedgesnode {
  QueryGameAnswersgameAnswersCollectionedgesnode({
    this.isMine,
    required this.idx,
    required this.answer,
    this.$__typename = 'GameAnswers',
  });

  factory QueryGameAnswersgameAnswersCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$isMine = json['isMine'];
    final l$idx = json['idx'];
    final l$answer = json['answer'];
    final l$$__typename = json['__typename'];
    return QueryGameAnswersgameAnswersCollectionedgesnode(
      isMine: (l$isMine as bool?),
      idx: (l$idx as int),
      answer: (l$answer as String),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? isMine;

  final int idx;

  final String answer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$idx = idx;
    _resultData['idx'] = l$idx;
    final l$answer = answer;
    _resultData['answer'] = l$answer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$isMine = isMine;
    final l$idx = idx;
    final l$answer = answer;
    final l$$__typename = $__typename;
    return Object.hashAll([l$isMine, l$idx, l$answer, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGameAnswersgameAnswersCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$idx = idx;
    final lOther$idx = other.idx;
    if (l$idx != lOther$idx) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
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
