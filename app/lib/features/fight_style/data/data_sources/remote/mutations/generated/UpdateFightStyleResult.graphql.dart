// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateFightStyleResult {
  factory VariablesMutationUpdateFightStyleResult({
    required String id,
    required List<String?> ranked,
  }) => VariablesMutationUpdateFightStyleResult._({r'id': id, r'ranked': ranked});

  VariablesMutationUpdateFightStyleResult._(this._$data);

  factory VariablesMutationUpdateFightStyleResult.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$ranked = data['ranked'];
    result$data['ranked'] = (l$ranked as List<dynamic>).map((e) => (e as String?)).toList();
    return VariablesMutationUpdateFightStyleResult._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  List<String?> get ranked => (_$data['ranked'] as List<String?>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$ranked = ranked;
    result$data['ranked'] = l$ranked.map((e) => e).toList();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateFightStyleResult || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$ranked = ranked;
    final lOther$ranked = other.ranked;
    if (l$ranked.length != lOther$ranked.length) {
      return false;
    }
    for (int i = 0; i < l$ranked.length; i++) {
      final l$ranked$entry = l$ranked[i];
      final lOther$ranked$entry = lOther$ranked[i];
      if (l$ranked$entry != lOther$ranked$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$ranked = ranked;
    return Object.hashAll([l$id, Object.hashAll(l$ranked.map((v) => v))]);
  }
}

class MutationUpdateFightStyleResult {
  MutationUpdateFightStyleResult({
    required this.updateQuizResultsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateFightStyleResult.fromJson(Map<String, dynamic> json) {
    final l$updateQuizResultsCollection = json['updateQuizResultsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateFightStyleResult(
      updateQuizResultsCollection:
          MutationUpdateFightStyleResultupdateQuizResultsCollection.fromJson(
            (l$updateQuizResultsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateFightStyleResultupdateQuizResultsCollection updateQuizResultsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateQuizResultsCollection = updateQuizResultsCollection;
    _resultData['updateQuizResultsCollection'] = l$updateQuizResultsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateQuizResultsCollection = updateQuizResultsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateQuizResultsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateFightStyleResult || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateQuizResultsCollection = updateQuizResultsCollection;
    final lOther$updateQuizResultsCollection = other.updateQuizResultsCollection;
    if (l$updateQuizResultsCollection != lOther$updateQuizResultsCollection) {
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

const documentNodeMutationUpdateFightStyleResult = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateFightStyleResult'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ranked')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateQuizResultsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'ranked'),
                      value: VariableNode(name: NameNode(value: 'ranked')),
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
MutationUpdateFightStyleResult _parserFnMutationUpdateFightStyleResult(Map<String, dynamic> data) =>
    MutationUpdateFightStyleResult.fromJson(data);
typedef OnMutationCompletedMutationUpdateFightStyleResult = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateFightStyleResult?,
);

class OptionsMutationUpdateFightStyleResult
    extends graphql.MutationOptions<MutationUpdateFightStyleResult> {
  OptionsMutationUpdateFightStyleResult({
    String? operationName,
    required VariablesMutationUpdateFightStyleResult variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateFightStyleResult? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateFightStyleResult? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateFightStyleResult>? update,
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
                 data == null ? null : _parserFnMutationUpdateFightStyleResult(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateFightStyleResult,
         parserFn: _parserFnMutationUpdateFightStyleResult,
       );

  final OnMutationCompletedMutationUpdateFightStyleResult? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateFightStyleResult
    extends graphql.WatchQueryOptions<MutationUpdateFightStyleResult> {
  WatchOptionsMutationUpdateFightStyleResult({
    String? operationName,
    required VariablesMutationUpdateFightStyleResult variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateFightStyleResult? typedOptimisticResult,
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
         document: documentNodeMutationUpdateFightStyleResult,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateFightStyleResult,
       );
}

extension ClientExtensionMutationUpdateFightStyleResult on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateFightStyleResult>> mutateUpdateFightStyleResult(
    OptionsMutationUpdateFightStyleResult options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateFightStyleResult> watchMutationUpdateFightStyleResult(
    WatchOptionsMutationUpdateFightStyleResult options,
  ) => this.watchMutation(options);
}

class MutationUpdateFightStyleResultupdateQuizResultsCollection {
  MutationUpdateFightStyleResultupdateQuizResultsCollection({
    required this.affectedCount,
    this.$__typename = 'QuizResultsUpdateResponse',
  });

  factory MutationUpdateFightStyleResultupdateQuizResultsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateFightStyleResultupdateQuizResultsCollection(
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
    if (other is! MutationUpdateFightStyleResultupdateQuizResultsCollection ||
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
