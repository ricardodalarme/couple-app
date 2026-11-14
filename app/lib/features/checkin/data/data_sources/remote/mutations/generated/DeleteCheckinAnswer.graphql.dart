// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteCheckinAnswer {
  factory VariablesMutationDeleteCheckinAnswer({required String id}) =>
      VariablesMutationDeleteCheckinAnswer._({r'id': id});

  VariablesMutationDeleteCheckinAnswer._(this._$data);

  factory VariablesMutationDeleteCheckinAnswer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteCheckinAnswer._(result$data);
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
    if (other is! VariablesMutationDeleteCheckinAnswer || runtimeType != other.runtimeType) {
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

class MutationDeleteCheckinAnswer {
  MutationDeleteCheckinAnswer({
    required this.deleteFromCheckinAnswersCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteCheckinAnswer.fromJson(Map<String, dynamic> json) {
    final l$deleteFromCheckinAnswersCollection = json['deleteFromCheckinAnswersCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteCheckinAnswer(
      deleteFromCheckinAnswersCollection:
          MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection.fromJson(
            (l$deleteFromCheckinAnswersCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection
  deleteFromCheckinAnswersCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromCheckinAnswersCollection = deleteFromCheckinAnswersCollection;
    _resultData['deleteFromCheckinAnswersCollection'] = l$deleteFromCheckinAnswersCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromCheckinAnswersCollection = deleteFromCheckinAnswersCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromCheckinAnswersCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteCheckinAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromCheckinAnswersCollection = deleteFromCheckinAnswersCollection;
    final lOther$deleteFromCheckinAnswersCollection = other.deleteFromCheckinAnswersCollection;
    if (l$deleteFromCheckinAnswersCollection != lOther$deleteFromCheckinAnswersCollection) {
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

const documentNodeMutationDeleteCheckinAnswer = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteCheckinAnswer'),
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
            name: NameNode(value: 'deleteFromCheckinAnswersCollection'),
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
MutationDeleteCheckinAnswer _parserFnMutationDeleteCheckinAnswer(Map<String, dynamic> data) =>
    MutationDeleteCheckinAnswer.fromJson(data);
typedef OnMutationCompletedMutationDeleteCheckinAnswer = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteCheckinAnswer?,
);

class OptionsMutationDeleteCheckinAnswer
    extends graphql.MutationOptions<MutationDeleteCheckinAnswer> {
  OptionsMutationDeleteCheckinAnswer({
    String? operationName,
    required VariablesMutationDeleteCheckinAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteCheckinAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteCheckinAnswer? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteCheckinAnswer>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteCheckinAnswer',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationDeleteCheckinAnswer(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteCheckinAnswer,
         parserFn: _parserFnMutationDeleteCheckinAnswer,
       );

  final OnMutationCompletedMutationDeleteCheckinAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteCheckinAnswer
    extends graphql.WatchQueryOptions<MutationDeleteCheckinAnswer> {
  WatchOptionsMutationDeleteCheckinAnswer({
    String? operationName,
    required VariablesMutationDeleteCheckinAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteCheckinAnswer? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteCheckinAnswer',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteCheckinAnswer,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteCheckinAnswer,
       );
}

extension ClientExtensionMutationDeleteCheckinAnswer on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteCheckinAnswer>> mutateDeleteCheckinAnswer(
    OptionsMutationDeleteCheckinAnswer options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteCheckinAnswer> watchMutationDeleteCheckinAnswer(
    WatchOptionsMutationDeleteCheckinAnswer options,
  ) => this.watchMutation(options);
}

class MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection {
  MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection({
    required this.affectedCount,
    this.$__typename = 'CheckinAnswersDeleteResponse',
  });

  factory MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection(
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
    if (other is! MutationDeleteCheckinAnswerdeleteFromCheckinAnswersCollection ||
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
