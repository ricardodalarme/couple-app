// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertQuestionAnswer {
  factory VariablesMutationInsertQuestionAnswer({
    required String questionSlug,
    required String body,
    String? coupleId,
  }) => VariablesMutationInsertQuestionAnswer._({
    r'questionSlug': questionSlug,
    r'body': body,
    if (coupleId != null) r'coupleId': coupleId,
  });

  VariablesMutationInsertQuestionAnswer._(this._$data);

  factory VariablesMutationInsertQuestionAnswer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$questionSlug = data['questionSlug'];
    result$data['questionSlug'] = (l$questionSlug as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationInsertQuestionAnswer._(result$data);
  }

  Map<String, dynamic> _$data;

  String get questionSlug => (_$data['questionSlug'] as String);

  String get body => (_$data['body'] as String);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$questionSlug = questionSlug;
    result$data['questionSlug'] = l$questionSlug;
    final l$body = body;
    result$data['body'] = l$body;
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertQuestionAnswer || runtimeType != other.runtimeType) {
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
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (_$data.containsKey('coupleId') != other._$data.containsKey('coupleId')) {
      return false;
    }
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$questionSlug = questionSlug;
    final l$body = body;
    final l$coupleId = coupleId;
    return Object.hashAll([
      l$questionSlug,
      l$body,
      _$data.containsKey('coupleId') ? l$coupleId : const {},
    ]);
  }
}

class MutationInsertQuestionAnswer {
  MutationInsertQuestionAnswer({
    this.insertIntoQuestionAnswersCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertQuestionAnswer.fromJson(Map<String, dynamic> json) {
    final l$insertIntoQuestionAnswersCollection = json['insertIntoQuestionAnswersCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertQuestionAnswer(
      insertIntoQuestionAnswersCollection: l$insertIntoQuestionAnswersCollection == null
          ? null
          : MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection.fromJson(
              (l$insertIntoQuestionAnswersCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection?
  insertIntoQuestionAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoQuestionAnswersCollection = insertIntoQuestionAnswersCollection;
    _resultData['insertIntoQuestionAnswersCollection'] = l$insertIntoQuestionAnswersCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoQuestionAnswersCollection = insertIntoQuestionAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoQuestionAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertQuestionAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoQuestionAnswersCollection = insertIntoQuestionAnswersCollection;
    final lOther$insertIntoQuestionAnswersCollection = other.insertIntoQuestionAnswersCollection;
    if (l$insertIntoQuestionAnswersCollection != lOther$insertIntoQuestionAnswersCollection) {
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

const documentNodeMutationInsertQuestionAnswer = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertQuestionAnswer'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'questionSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoQuestionAnswersCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'questionSlug'),
                          value: VariableNode(name: NameNode(value: 'questionSlug')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'body'),
                          value: VariableNode(name: NameNode(value: 'body')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
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
                  name: NameNode(value: 'records'),
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
  ],
);
MutationInsertQuestionAnswer _parserFnMutationInsertQuestionAnswer(Map<String, dynamic> data) =>
    MutationInsertQuestionAnswer.fromJson(data);
typedef OnMutationCompletedMutationInsertQuestionAnswer = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertQuestionAnswer?,
);

class OptionsMutationInsertQuestionAnswer
    extends graphql.MutationOptions<MutationInsertQuestionAnswer> {
  OptionsMutationInsertQuestionAnswer({
    String? operationName,
    required VariablesMutationInsertQuestionAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertQuestionAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertQuestionAnswer? onCompleted,
    graphql.OnMutationUpdate<MutationInsertQuestionAnswer>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InsertQuestionAnswer',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationInsertQuestionAnswer(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertQuestionAnswer,
         parserFn: _parserFnMutationInsertQuestionAnswer,
       );

  final OnMutationCompletedMutationInsertQuestionAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertQuestionAnswer
    extends graphql.WatchQueryOptions<MutationInsertQuestionAnswer> {
  WatchOptionsMutationInsertQuestionAnswer({
    String? operationName,
    required VariablesMutationInsertQuestionAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertQuestionAnswer? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InsertQuestionAnswer',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationInsertQuestionAnswer,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertQuestionAnswer,
       );
}

extension ClientExtensionMutationInsertQuestionAnswer on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertQuestionAnswer>> mutateInsertQuestionAnswer(
    OptionsMutationInsertQuestionAnswer options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertQuestionAnswer> watchMutationInsertQuestionAnswer(
    WatchOptionsMutationInsertQuestionAnswer options,
  ) => this.watchMutation(options);
}

class MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection {
  MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection({
    required this.records,
    this.$__typename = 'QuestionAnswersInsertResponse',
  });

  factory MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords> records;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$records = records;
    _resultData['records'] = l$records.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$records = records;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$records.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$records = records;
    final lOther$records = other.records;
    if (l$records.length != lOther$records.length) {
      return false;
    }
    for (int i = 0; i < l$records.length; i++) {
      final l$records$entry = l$records[i];
      final lOther$records$entry = lOther$records[i];
      if (l$records$entry != lOther$records$entry) {
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

class MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords {
  MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords({
    required this.id,
    this.coupleId,
    required this.questionSlug,
    required this.body,
    this.$__typename = 'QuestionAnswers',
  });

  factory MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$coupleId = json['coupleId'];
    final l$questionSlug = json['questionSlug'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords(
      id: (l$id as String),
      coupleId: (l$coupleId as String?),
      questionSlug: (l$questionSlug as String),
      body: (l$body as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? coupleId;

  final String questionSlug;

  final String body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$coupleId = coupleId;
    final l$questionSlug = questionSlug;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$coupleId, l$questionSlug, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertQuestionAnswerinsertIntoQuestionAnswersCollectionrecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
