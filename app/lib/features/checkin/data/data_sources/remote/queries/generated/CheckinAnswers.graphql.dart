// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryCheckinAnswers {
  factory VariablesQueryCheckinAnswers({required DateTime weekStart, required String coupleId}) =>
      VariablesQueryCheckinAnswers._({r'weekStart': weekStart, r'coupleId': coupleId});

  VariablesQueryCheckinAnswers._(this._$data);

  factory VariablesQueryCheckinAnswers.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$weekStart = data['weekStart'];
    result$data['weekStart'] = DateTime.parse((l$weekStart as String));
    final l$coupleId = data['coupleId'];
    result$data['coupleId'] = (l$coupleId as String);
    return VariablesQueryCheckinAnswers._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime get weekStart => (_$data['weekStart'] as DateTime);

  String get coupleId => (_$data['coupleId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$weekStart = weekStart;
    result$data['weekStart'] = ((v) => v.toIso8601String().substring(0, 10))(l$weekStart);
    final l$coupleId = coupleId;
    result$data['coupleId'] = l$coupleId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryCheckinAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$weekStart = weekStart;
    final lOther$weekStart = other.weekStart;
    if (l$weekStart != lOther$weekStart) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$weekStart = weekStart;
    final l$coupleId = coupleId;
    return Object.hashAll([l$weekStart, l$coupleId]);
  }
}

class QueryCheckinAnswers {
  QueryCheckinAnswers({required this.checkinAnswersCollection, this.$__typename = 'Query'});

  factory QueryCheckinAnswers.fromJson(Map<String, dynamic> json) {
    final l$checkinAnswersCollection = json['checkinAnswersCollection'];
    final l$$__typename = json['__typename'];
    return QueryCheckinAnswers(
      checkinAnswersCollection: QueryCheckinAnswerscheckinAnswersCollection.fromJson(
        (l$checkinAnswersCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCheckinAnswerscheckinAnswersCollection checkinAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkinAnswersCollection = checkinAnswersCollection;
    _resultData['checkinAnswersCollection'] = l$checkinAnswersCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkinAnswersCollection = checkinAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$checkinAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCheckinAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkinAnswersCollection = checkinAnswersCollection;
    final lOther$checkinAnswersCollection = other.checkinAnswersCollection;
    if (l$checkinAnswersCollection != lOther$checkinAnswersCollection) {
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

const documentNodeQueryCheckinAnswers = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CheckinAnswers'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'weekStart')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'checkinAnswersCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'weekStart'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'weekStart')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'coupleId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'coupleId')),
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
                          name: NameNode(value: 'question'),
                          value: EnumValueNode(name: NameNode(value: 'AscNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
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
                              name: NameNode(value: 'weekStart'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'question'),
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
QueryCheckinAnswers _parserFnQueryCheckinAnswers(Map<String, dynamic> data) =>
    QueryCheckinAnswers.fromJson(data);
typedef OnQueryCompleteQueryCheckinAnswers = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryCheckinAnswers?,
);

class OptionsQueryCheckinAnswers extends graphql.QueryOptions<QueryCheckinAnswers> {
  OptionsQueryCheckinAnswers({
    String? operationName,
    required VariablesQueryCheckinAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCheckinAnswers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryCheckinAnswers? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryCheckinAnswers(data)),
         onError: onError,
         document: documentNodeQueryCheckinAnswers,
         parserFn: _parserFnQueryCheckinAnswers,
       );

  final OnQueryCompleteQueryCheckinAnswers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryCheckinAnswers extends graphql.WatchQueryOptions<QueryCheckinAnswers> {
  WatchOptionsQueryCheckinAnswers({
    String? operationName,
    required VariablesQueryCheckinAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCheckinAnswers? typedOptimisticResult,
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
         document: documentNodeQueryCheckinAnswers,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryCheckinAnswers,
       );
}

class FetchMoreOptionsQueryCheckinAnswers extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryCheckinAnswers({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryCheckinAnswers variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryCheckinAnswers,
       );
}

extension ClientExtensionQueryCheckinAnswers on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryCheckinAnswers>> queryCheckinAnswers(
    OptionsQueryCheckinAnswers options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryCheckinAnswers> watchQueryCheckinAnswers(
    WatchOptionsQueryCheckinAnswers options,
  ) => this.watchQuery(options);

  void writeQueryCheckinAnswers({
    required QueryCheckinAnswers data,
    required VariablesQueryCheckinAnswers variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryCheckinAnswers),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryCheckinAnswers? readQueryCheckinAnswers({
    required VariablesQueryCheckinAnswers variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryCheckinAnswers),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryCheckinAnswers.fromJson(result);
  }
}

class QueryCheckinAnswerscheckinAnswersCollection {
  QueryCheckinAnswerscheckinAnswersCollection({
    required this.edges,
    this.$__typename = 'CheckinAnswersConnection',
  });

  factory QueryCheckinAnswerscheckinAnswersCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryCheckinAnswerscheckinAnswersCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryCheckinAnswerscheckinAnswersCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryCheckinAnswerscheckinAnswersCollectionedges> edges;

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
    if (other is! QueryCheckinAnswerscheckinAnswersCollection || runtimeType != other.runtimeType) {
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

class QueryCheckinAnswerscheckinAnswersCollectionedges {
  QueryCheckinAnswerscheckinAnswersCollectionedges({
    required this.node,
    this.$__typename = 'CheckinAnswersEdge',
  });

  factory QueryCheckinAnswerscheckinAnswersCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryCheckinAnswerscheckinAnswersCollectionedges(
      node: QueryCheckinAnswerscheckinAnswersCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCheckinAnswerscheckinAnswersCollectionedgesnode node;

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
    if (other is! QueryCheckinAnswerscheckinAnswersCollectionedges ||
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

class QueryCheckinAnswerscheckinAnswersCollectionedgesnode {
  QueryCheckinAnswerscheckinAnswersCollectionedgesnode({
    required this.id,
    required this.authorId,
    required this.weekStart,
    required this.question,
    required this.body,
    this.$__typename = 'CheckinAnswers',
  });

  factory QueryCheckinAnswerscheckinAnswersCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$weekStart = json['weekStart'];
    final l$question = json['question'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return QueryCheckinAnswerscheckinAnswersCollectionedgesnode(
      id: (l$id as String),
      authorId: (l$authorId as String),
      weekStart: DateTime.parse((l$weekStart as String)),
      question: (l$question as int),
      body: (l$body as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String authorId;

  final DateTime weekStart;

  final int question;

  final String body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$weekStart = weekStart;
    _resultData['weekStart'] = ((v) => v.toIso8601String().substring(0, 10))(l$weekStart);
    final l$question = question;
    _resultData['question'] = l$question;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$authorId = authorId;
    final l$weekStart = weekStart;
    final l$question = question;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$authorId, l$weekStart, l$question, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCheckinAnswerscheckinAnswersCollectionedgesnode ||
        runtimeType != other.runtimeType) {
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
    final l$weekStart = weekStart;
    final lOther$weekStart = other.weekStart;
    if (l$weekStart != lOther$weekStart) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
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
