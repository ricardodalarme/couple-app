// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertCheckinAnswer {
  factory VariablesMutationInsertCheckinAnswer({
    required String coupleId,
    required DateTime weekStart,
    required int question,
    required String body,
  }) => VariablesMutationInsertCheckinAnswer._({
    r'coupleId': coupleId,
    r'weekStart': weekStart,
    r'question': question,
    r'body': body,
  });

  VariablesMutationInsertCheckinAnswer._(this._$data);

  factory VariablesMutationInsertCheckinAnswer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$coupleId = data['coupleId'];
    result$data['coupleId'] = (l$coupleId as String);
    final l$weekStart = data['weekStart'];
    result$data['weekStart'] = DateTime.parse((l$weekStart as String));
    final l$question = data['question'];
    result$data['question'] = (l$question as int);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    return VariablesMutationInsertCheckinAnswer._(result$data);
  }

  Map<String, dynamic> _$data;

  String get coupleId => (_$data['coupleId'] as String);

  DateTime get weekStart => (_$data['weekStart'] as DateTime);

  int get question => (_$data['question'] as int);

  String get body => (_$data['body'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$coupleId = coupleId;
    result$data['coupleId'] = l$coupleId;
    final l$weekStart = weekStart;
    result$data['weekStart'] = ((v) => v.toIso8601String().substring(0, 10))(l$weekStart);
    final l$question = question;
    result$data['question'] = l$question;
    final l$body = body;
    result$data['body'] = l$body;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertCheckinAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$coupleId = coupleId;
    final l$weekStart = weekStart;
    final l$question = question;
    final l$body = body;
    return Object.hashAll([l$coupleId, l$weekStart, l$question, l$body]);
  }
}

class MutationInsertCheckinAnswer {
  MutationInsertCheckinAnswer({
    this.insertIntoCheckinAnswersCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertCheckinAnswer.fromJson(Map<String, dynamic> json) {
    final l$insertIntoCheckinAnswersCollection = json['insertIntoCheckinAnswersCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertCheckinAnswer(
      insertIntoCheckinAnswersCollection: l$insertIntoCheckinAnswersCollection == null
          ? null
          : MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection.fromJson(
              (l$insertIntoCheckinAnswersCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection?
  insertIntoCheckinAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoCheckinAnswersCollection = insertIntoCheckinAnswersCollection;
    _resultData['insertIntoCheckinAnswersCollection'] = l$insertIntoCheckinAnswersCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoCheckinAnswersCollection = insertIntoCheckinAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoCheckinAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertCheckinAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoCheckinAnswersCollection = insertIntoCheckinAnswersCollection;
    final lOther$insertIntoCheckinAnswersCollection = other.insertIntoCheckinAnswersCollection;
    if (l$insertIntoCheckinAnswersCollection != lOther$insertIntoCheckinAnswersCollection) {
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

const documentNodeMutationInsertCheckinAnswer = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertCheckinAnswer'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'weekStart')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'question')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoCheckinAnswersCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'weekStart'),
                          value: VariableNode(name: NameNode(value: 'weekStart')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'question'),
                          value: VariableNode(name: NameNode(value: 'question')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'body'),
                          value: VariableNode(name: NameNode(value: 'body')),
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
  ],
);
MutationInsertCheckinAnswer _parserFnMutationInsertCheckinAnswer(Map<String, dynamic> data) =>
    MutationInsertCheckinAnswer.fromJson(data);
typedef OnMutationCompletedMutationInsertCheckinAnswer = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertCheckinAnswer?,
);

class OptionsMutationInsertCheckinAnswer
    extends graphql.MutationOptions<MutationInsertCheckinAnswer> {
  OptionsMutationInsertCheckinAnswer({
    String? operationName,
    required VariablesMutationInsertCheckinAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertCheckinAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertCheckinAnswer? onCompleted,
    graphql.OnMutationUpdate<MutationInsertCheckinAnswer>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationInsertCheckinAnswer(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertCheckinAnswer,
         parserFn: _parserFnMutationInsertCheckinAnswer,
       );

  final OnMutationCompletedMutationInsertCheckinAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertCheckinAnswer
    extends graphql.WatchQueryOptions<MutationInsertCheckinAnswer> {
  WatchOptionsMutationInsertCheckinAnswer({
    String? operationName,
    required VariablesMutationInsertCheckinAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertCheckinAnswer? typedOptimisticResult,
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
         document: documentNodeMutationInsertCheckinAnswer,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertCheckinAnswer,
       );
}

extension ClientExtensionMutationInsertCheckinAnswer on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertCheckinAnswer>> mutateInsertCheckinAnswer(
    OptionsMutationInsertCheckinAnswer options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertCheckinAnswer> watchMutationInsertCheckinAnswer(
    WatchOptionsMutationInsertCheckinAnswer options,
  ) => this.watchMutation(options);
}

class MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection {
  MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection({
    required this.records,
    this.$__typename = 'CheckinAnswersInsertResponse',
  });

  factory MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords> records;

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
    if (other is! MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollection ||
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

class MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords {
  MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords({
    required this.id,
    required this.authorId,
    required this.weekStart,
    required this.question,
    required this.body,
    this.$__typename = 'CheckinAnswers',
  });

  factory MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$weekStart = json['weekStart'];
    final l$question = json['question'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords(
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
    if (other is! MutationInsertCheckinAnswerinsertIntoCheckinAnswersCollectionrecords ||
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
