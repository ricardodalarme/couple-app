// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryQuestionAnswers {
  factory VariablesQueryQuestionAnswers({required String questionSlug}) =>
      VariablesQueryQuestionAnswers._({r'questionSlug': questionSlug});

  VariablesQueryQuestionAnswers._(this._$data);

  factory VariablesQueryQuestionAnswers.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$questionSlug = data['questionSlug'];
    result$data['questionSlug'] = (l$questionSlug as String);
    return VariablesQueryQuestionAnswers._(result$data);
  }

  Map<String, dynamic> _$data;

  String get questionSlug => (_$data['questionSlug'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$questionSlug = questionSlug;
    result$data['questionSlug'] = l$questionSlug;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryQuestionAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$questionSlug = questionSlug;
    final lOther$questionSlug = other.questionSlug;
    if (l$questionSlug != lOther$questionSlug) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$questionSlug = questionSlug;
    return Object.hashAll([l$questionSlug]);
  }
}

class QueryQuestionAnswers {
  QueryQuestionAnswers({
    this.partnerAnswered,
    required this.questionAnswersCollection,
    this.$__typename = 'Query',
  });

  factory QueryQuestionAnswers.fromJson(Map<String, dynamic> json) {
    final l$partnerAnswered = json['partnerAnswered'];
    final l$questionAnswersCollection = json['questionAnswersCollection'];
    final l$$__typename = json['__typename'];
    return QueryQuestionAnswers(
      partnerAnswered: (l$partnerAnswered as bool?),
      questionAnswersCollection: QueryQuestionAnswersquestionAnswersCollection.fromJson(
        (l$questionAnswersCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? partnerAnswered;

  final QueryQuestionAnswersquestionAnswersCollection questionAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$partnerAnswered = partnerAnswered;
    _resultData['partnerAnswered'] = l$partnerAnswered;
    final l$questionAnswersCollection = questionAnswersCollection;
    _resultData['questionAnswersCollection'] = l$questionAnswersCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$partnerAnswered = partnerAnswered;
    final l$questionAnswersCollection = questionAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$partnerAnswered, l$questionAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryQuestionAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$partnerAnswered = partnerAnswered;
    final lOther$partnerAnswered = other.partnerAnswered;
    if (l$partnerAnswered != lOther$partnerAnswered) {
      return false;
    }
    final l$questionAnswersCollection = questionAnswersCollection;
    final lOther$questionAnswersCollection = other.questionAnswersCollection;
    if (l$questionAnswersCollection != lOther$questionAnswersCollection) {
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

const documentNodeQueryQuestionAnswers = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'QuestionAnswers'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'questionSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'partnerAnswered'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'questionSlug'),
                value: VariableNode(name: NameNode(value: 'questionSlug')),
              ),
            ],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'questionAnswersCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'questionSlug'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'questionSlug')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '10'),
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
                              name: NameNode(value: 'questionSlug'),
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
QueryQuestionAnswers _parserFnQueryQuestionAnswers(Map<String, dynamic> data) =>
    QueryQuestionAnswers.fromJson(data);
typedef OnQueryCompleteQueryQuestionAnswers = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryQuestionAnswers?,
);

class OptionsQueryQuestionAnswers extends graphql.QueryOptions<QueryQuestionAnswers> {
  OptionsQueryQuestionAnswers({
    String? operationName,
    required VariablesQueryQuestionAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryQuestionAnswers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryQuestionAnswers? onComplete,
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
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryQuestionAnswers(data)),
         onError: onError,
         document: documentNodeQueryQuestionAnswers,
         parserFn: _parserFnQueryQuestionAnswers,
       );

  final OnQueryCompleteQueryQuestionAnswers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryQuestionAnswers extends graphql.WatchQueryOptions<QueryQuestionAnswers> {
  WatchOptionsQueryQuestionAnswers({
    String? operationName,
    required VariablesQueryQuestionAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryQuestionAnswers? typedOptimisticResult,
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
         document: documentNodeQueryQuestionAnswers,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryQuestionAnswers,
       );
}

class FetchMoreOptionsQueryQuestionAnswers extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryQuestionAnswers({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryQuestionAnswers variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryQuestionAnswers,
       );
}

extension ClientExtensionQueryQuestionAnswers on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryQuestionAnswers>> queryQuestionAnswers(
    OptionsQueryQuestionAnswers options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryQuestionAnswers> watchQueryQuestionAnswers(
    WatchOptionsQueryQuestionAnswers options,
  ) => this.watchQuery(options);

  void writeQueryQuestionAnswers({
    required QueryQuestionAnswers data,
    required VariablesQueryQuestionAnswers variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryQuestionAnswers),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryQuestionAnswers? readQueryQuestionAnswers({
    required VariablesQueryQuestionAnswers variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryQuestionAnswers),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryQuestionAnswers.fromJson(result);
  }
}

class QueryQuestionAnswersquestionAnswersCollection {
  QueryQuestionAnswersquestionAnswersCollection({
    required this.edges,
    this.$__typename = 'QuestionAnswersConnection',
  });

  factory QueryQuestionAnswersquestionAnswersCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryQuestionAnswersquestionAnswersCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryQuestionAnswersquestionAnswersCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryQuestionAnswersquestionAnswersCollectionedges> edges;

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
    if (other is! QueryQuestionAnswersquestionAnswersCollection ||
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

class QueryQuestionAnswersquestionAnswersCollectionedges {
  QueryQuestionAnswersquestionAnswersCollectionedges({
    required this.node,
    this.$__typename = 'QuestionAnswersEdge',
  });

  factory QueryQuestionAnswersquestionAnswersCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryQuestionAnswersquestionAnswersCollectionedges(
      node: QueryQuestionAnswersquestionAnswersCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryQuestionAnswersquestionAnswersCollectionedgesnode node;

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
    if (other is! QueryQuestionAnswersquestionAnswersCollectionedges ||
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

class QueryQuestionAnswersquestionAnswersCollectionedgesnode {
  QueryQuestionAnswersquestionAnswersCollectionedgesnode({
    required this.id,
    required this.authorId,
    this.coupleId,
    required this.questionSlug,
    required this.body,
    this.$__typename = 'QuestionAnswers',
  });

  factory QueryQuestionAnswersquestionAnswersCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$coupleId = json['coupleId'];
    final l$questionSlug = json['questionSlug'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return QueryQuestionAnswersquestionAnswersCollectionedgesnode(
      id: (l$id as String),
      authorId: (l$authorId as String),
      coupleId: (l$coupleId as String?),
      questionSlug: (l$questionSlug as String),
      body: (l$body as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String authorId;

  final String? coupleId;

  final String questionSlug;

  final String body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$coupleId = coupleId;
    _resultData['coupleId'] = l$coupleId;
    final l$questionSlug = questionSlug;
    _resultData['questionSlug'] = l$questionSlug;
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
    final l$coupleId = coupleId;
    final l$questionSlug = questionSlug;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$authorId, l$coupleId, l$questionSlug, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryQuestionAnswersquestionAnswersCollectionedgesnode ||
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
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$questionSlug = questionSlug;
    final lOther$questionSlug = other.questionSlug;
    if (l$questionSlug != lOther$questionSlug) {
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
