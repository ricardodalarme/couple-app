// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteQuestionAnswer {
  factory VariablesMutationDeleteQuestionAnswer({required String id}) =>
      VariablesMutationDeleteQuestionAnswer._({r'id': id});

  VariablesMutationDeleteQuestionAnswer._(this._$data);

  factory VariablesMutationDeleteQuestionAnswer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteQuestionAnswer._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationDeleteQuestionAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class MutationDeleteQuestionAnswer {
  MutationDeleteQuestionAnswer({
    required this.deleteFromQuestionAnswersCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteQuestionAnswer.fromJson(Map<String, dynamic> json) {
    final l$deleteFromQuestionAnswersCollection = json['deleteFromQuestionAnswersCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteQuestionAnswer(
      deleteFromQuestionAnswersCollection:
          MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection.fromJson(
            (l$deleteFromQuestionAnswersCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection
  deleteFromQuestionAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromQuestionAnswersCollection = deleteFromQuestionAnswersCollection;
    _resultData['deleteFromQuestionAnswersCollection'] = l$deleteFromQuestionAnswersCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromQuestionAnswersCollection = deleteFromQuestionAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromQuestionAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteQuestionAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromQuestionAnswersCollection = deleteFromQuestionAnswersCollection;
    final lOther$deleteFromQuestionAnswersCollection = other.deleteFromQuestionAnswersCollection;
    if (l$deleteFromQuestionAnswersCollection != lOther$deleteFromQuestionAnswersCollection) {
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

const documentNodeMutationDeleteQuestionAnswer = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteQuestionAnswer'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteFromQuestionAnswersCollection'),
            alias: null,
            arguments: [
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
              ArgumentNode(
                name: NameNode(value: 'atMost'),
                value: IntValueNode(value: '1'),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'affectedCount'),
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
  ],
);
MutationDeleteQuestionAnswer _parserFnMutationDeleteQuestionAnswer(Map<String, dynamic> data) =>
    MutationDeleteQuestionAnswer.fromJson(data);
typedef OnMutationCompletedMutationDeleteQuestionAnswer = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteQuestionAnswer?,
);

class OptionsMutationDeleteQuestionAnswer
    extends graphql.MutationOptions<MutationDeleteQuestionAnswer> {
  OptionsMutationDeleteQuestionAnswer({
    String? operationName,
    required VariablesMutationDeleteQuestionAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteQuestionAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteQuestionAnswer? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteQuestionAnswer>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteQuestionAnswer',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationDeleteQuestionAnswer(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteQuestionAnswer,
         parserFn: _parserFnMutationDeleteQuestionAnswer,
       );

  final OnMutationCompletedMutationDeleteQuestionAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteQuestionAnswer
    extends graphql.WatchQueryOptions<MutationDeleteQuestionAnswer> {
  WatchOptionsMutationDeleteQuestionAnswer({
    String? operationName,
    required VariablesMutationDeleteQuestionAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteQuestionAnswer? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteQuestionAnswer',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteQuestionAnswer,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteQuestionAnswer,
       );
}

extension ClientExtensionMutationDeleteQuestionAnswer on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteQuestionAnswer>> mutateDeleteQuestionAnswer(
    OptionsMutationDeleteQuestionAnswer options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteQuestionAnswer> watchMutationDeleteQuestionAnswer(
    WatchOptionsMutationDeleteQuestionAnswer options,
  ) => this.watchMutation(options);
}

class MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection {
  MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection({
    required this.affectedCount,
    this.$__typename = 'QuestionAnswersDeleteResponse',
  });

  factory MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection(
      affectedCount: (l$affectedCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int affectedCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affectedCount = affectedCount;
    _resultData['affectedCount'] = l$affectedCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affectedCount = affectedCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$affectedCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteQuestionAnswerdeleteFromQuestionAnswersCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affectedCount = affectedCount;
    final lOther$affectedCount = other.affectedCount;
    if (l$affectedCount != lOther$affectedCount) {
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
