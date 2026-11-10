// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateCheckinAnswer {
  factory VariablesMutationUpdateCheckinAnswer({required String id, required String body}) =>
      VariablesMutationUpdateCheckinAnswer._({r'id': id, r'body': body});

  VariablesMutationUpdateCheckinAnswer._(this._$data);

  factory VariablesMutationUpdateCheckinAnswer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    return VariablesMutationUpdateCheckinAnswer._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get body => (_$data['body'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$body = body;
    result$data['body'] = l$body;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateCheckinAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$body = body;
    return Object.hashAll([l$id, l$body]);
  }
}

class MutationUpdateCheckinAnswer {
  MutationUpdateCheckinAnswer({
    required this.updateCheckinAnswersCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateCheckinAnswer.fromJson(Map<String, dynamic> json) {
    final l$updateCheckinAnswersCollection = json['updateCheckinAnswersCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateCheckinAnswer(
      updateCheckinAnswersCollection:
          MutationUpdateCheckinAnswerupdateCheckinAnswersCollection.fromJson(
            (l$updateCheckinAnswersCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateCheckinAnswerupdateCheckinAnswersCollection updateCheckinAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCheckinAnswersCollection = updateCheckinAnswersCollection;
    _resultData['updateCheckinAnswersCollection'] = l$updateCheckinAnswersCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCheckinAnswersCollection = updateCheckinAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateCheckinAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateCheckinAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCheckinAnswersCollection = updateCheckinAnswersCollection;
    final lOther$updateCheckinAnswersCollection = other.updateCheckinAnswersCollection;
    if (l$updateCheckinAnswersCollection != lOther$updateCheckinAnswersCollection) {
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

const documentNodeMutationUpdateCheckinAnswer = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateCheckinAnswer'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
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
            name: NameNode(value: 'updateCheckinAnswersCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'body'),
                      value: VariableNode(name: NameNode(value: 'body')),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'id'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'id')),
                          ),
                        ],
                      ),
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
MutationUpdateCheckinAnswer _parserFnMutationUpdateCheckinAnswer(Map<String, dynamic> data) =>
    MutationUpdateCheckinAnswer.fromJson(data);
typedef OnMutationCompletedMutationUpdateCheckinAnswer = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateCheckinAnswer?,
);

class OptionsMutationUpdateCheckinAnswer
    extends graphql.MutationOptions<MutationUpdateCheckinAnswer> {
  OptionsMutationUpdateCheckinAnswer({
    String? operationName,
    required VariablesMutationUpdateCheckinAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateCheckinAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateCheckinAnswer? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateCheckinAnswer>? update,
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
                 data == null ? null : _parserFnMutationUpdateCheckinAnswer(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateCheckinAnswer,
         parserFn: _parserFnMutationUpdateCheckinAnswer,
       );

  final OnMutationCompletedMutationUpdateCheckinAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateCheckinAnswer
    extends graphql.WatchQueryOptions<MutationUpdateCheckinAnswer> {
  WatchOptionsMutationUpdateCheckinAnswer({
    String? operationName,
    required VariablesMutationUpdateCheckinAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateCheckinAnswer? typedOptimisticResult,
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
         document: documentNodeMutationUpdateCheckinAnswer,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateCheckinAnswer,
       );
}

extension ClientExtensionMutationUpdateCheckinAnswer on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateCheckinAnswer>> mutateUpdateCheckinAnswer(
    OptionsMutationUpdateCheckinAnswer options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateCheckinAnswer> watchMutationUpdateCheckinAnswer(
    WatchOptionsMutationUpdateCheckinAnswer options,
  ) => this.watchMutation(options);
}

class MutationUpdateCheckinAnswerupdateCheckinAnswersCollection {
  MutationUpdateCheckinAnswerupdateCheckinAnswersCollection({
    required this.records,
    this.$__typename = 'CheckinAnswersUpdateResponse',
  });

  factory MutationUpdateCheckinAnswerupdateCheckinAnswersCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationUpdateCheckinAnswerupdateCheckinAnswersCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords> records;

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
    if (other is! MutationUpdateCheckinAnswerupdateCheckinAnswersCollection ||
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

class MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords {
  MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords({
    required this.id,
    required this.authorId,
    required this.weekStart,
    required this.question,
    required this.body,
    this.$__typename = 'CheckinAnswers',
  });

  factory MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$weekStart = json['weekStart'];
    final l$question = json['question'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords(
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
    if (other is! MutationUpdateCheckinAnswerupdateCheckinAnswersCollectionrecords ||
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
