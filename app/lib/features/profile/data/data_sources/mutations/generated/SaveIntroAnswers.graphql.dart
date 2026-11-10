// dart format width=100
import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSaveIntroAnswers {
  factory VariablesMutationSaveIntroAnswers({
    required String profileId,
    EnumRelationshipPhase? phase,
    EnumRelationshipGoal? goal,
    List<String?>? goals,
  }) => VariablesMutationSaveIntroAnswers._({
    r'profileId': profileId,
    if (phase != null) r'phase': phase,
    if (goal != null) r'goal': goal,
    if (goals != null) r'goals': goals,
  });

  VariablesMutationSaveIntroAnswers._(this._$data);

  factory VariablesMutationSaveIntroAnswers.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    if (data.containsKey('phase')) {
      final l$phase = data['phase'];
      result$data['phase'] = l$phase == null
          ? null
          : fromJsonEnumRelationshipPhase((l$phase as String));
    }
    if (data.containsKey('goal')) {
      final l$goal = data['goal'];
      result$data['goal'] = l$goal == null
          ? null
          : fromJsonEnumRelationshipGoal((l$goal as String));
    }
    if (data.containsKey('goals')) {
      final l$goals = data['goals'];
      result$data['goals'] = (l$goals as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    return VariablesMutationSaveIntroAnswers._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  EnumRelationshipPhase? get phase => (_$data['phase'] as EnumRelationshipPhase?);

  EnumRelationshipGoal? get goal => (_$data['goal'] as EnumRelationshipGoal?);

  List<String?>? get goals => (_$data['goals'] as List<String?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    if (_$data.containsKey('phase')) {
      final l$phase = phase;
      result$data['phase'] = l$phase == null ? null : toJsonEnumRelationshipPhase(l$phase);
    }
    if (_$data.containsKey('goal')) {
      final l$goal = goal;
      result$data['goal'] = l$goal == null ? null : toJsonEnumRelationshipGoal(l$goal);
    }
    if (_$data.containsKey('goals')) {
      final l$goals = goals;
      result$data['goals'] = l$goals?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSaveIntroAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$phase = phase;
    final lOther$phase = other.phase;
    if (_$data.containsKey('phase') != other._$data.containsKey('phase')) {
      return false;
    }
    if (l$phase != lOther$phase) {
      return false;
    }
    final l$goal = goal;
    final lOther$goal = other.goal;
    if (_$data.containsKey('goal') != other._$data.containsKey('goal')) {
      return false;
    }
    if (l$goal != lOther$goal) {
      return false;
    }
    final l$goals = goals;
    final lOther$goals = other.goals;
    if (_$data.containsKey('goals') != other._$data.containsKey('goals')) {
      return false;
    }
    if (l$goals != null && lOther$goals != null) {
      if (l$goals.length != lOther$goals.length) {
        return false;
      }
      for (int i = 0; i < l$goals.length; i++) {
        final l$goals$entry = l$goals[i];
        final lOther$goals$entry = lOther$goals[i];
        if (l$goals$entry != lOther$goals$entry) {
          return false;
        }
      }
    } else if (l$goals != lOther$goals) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$phase = phase;
    final l$goal = goal;
    final l$goals = goals;
    return Object.hashAll([
      l$profileId,
      _$data.containsKey('phase') ? l$phase : const {},
      _$data.containsKey('goal') ? l$goal : const {},
      _$data.containsKey('goals')
          ? l$goals == null
                ? null
                : Object.hashAll(l$goals.map((v) => v))
          : const {},
    ]);
  }
}

class MutationSaveIntroAnswers {
  MutationSaveIntroAnswers({
    required this.updateProfileSettingsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSaveIntroAnswers.fromJson(Map<String, dynamic> json) {
    final l$updateProfileSettingsCollection = json['updateProfileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSaveIntroAnswers(
      updateProfileSettingsCollection:
          MutationSaveIntroAnswersupdateProfileSettingsCollection.fromJson(
            (l$updateProfileSettingsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSaveIntroAnswersupdateProfileSettingsCollection updateProfileSettingsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    _resultData['updateProfileSettingsCollection'] = l$updateProfileSettingsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateProfileSettingsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSaveIntroAnswers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    final lOther$updateProfileSettingsCollection = other.updateProfileSettingsCollection;
    if (l$updateProfileSettingsCollection != lOther$updateProfileSettingsCollection) {
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

const documentNodeMutationSaveIntroAnswers = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SaveIntroAnswers'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'phase')),
          type: NamedTypeNode(name: NameNode(value: 'RelationshipPhase'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'goal')),
          type: NamedTypeNode(name: NameNode(value: 'RelationshipGoal'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'goals')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateProfileSettingsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'phase'),
                      value: VariableNode(name: NameNode(value: 'phase')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'goal'),
                      value: VariableNode(name: NameNode(value: 'goal')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'goals'),
                      value: VariableNode(name: NameNode(value: 'goals')),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'profileId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'profileId')),
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
MutationSaveIntroAnswers _parserFnMutationSaveIntroAnswers(Map<String, dynamic> data) =>
    MutationSaveIntroAnswers.fromJson(data);
typedef OnMutationCompletedMutationSaveIntroAnswers = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSaveIntroAnswers?,
);

class OptionsMutationSaveIntroAnswers extends graphql.MutationOptions<MutationSaveIntroAnswers> {
  OptionsMutationSaveIntroAnswers({
    String? operationName,
    required VariablesMutationSaveIntroAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveIntroAnswers? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSaveIntroAnswers? onCompleted,
    graphql.OnMutationUpdate<MutationSaveIntroAnswers>? update,
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
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationSaveIntroAnswers(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSaveIntroAnswers,
         parserFn: _parserFnMutationSaveIntroAnswers,
       );

  final OnMutationCompletedMutationSaveIntroAnswers? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSaveIntroAnswers
    extends graphql.WatchQueryOptions<MutationSaveIntroAnswers> {
  WatchOptionsMutationSaveIntroAnswers({
    String? operationName,
    required VariablesMutationSaveIntroAnswers variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveIntroAnswers? typedOptimisticResult,
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
         document: documentNodeMutationSaveIntroAnswers,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSaveIntroAnswers,
       );
}

extension ClientExtensionMutationSaveIntroAnswers on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSaveIntroAnswers>> mutateSaveIntroAnswers(
    OptionsMutationSaveIntroAnswers options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSaveIntroAnswers> watchMutationSaveIntroAnswers(
    WatchOptionsMutationSaveIntroAnswers options,
  ) => this.watchMutation(options);
}

class MutationSaveIntroAnswersupdateProfileSettingsCollection {
  MutationSaveIntroAnswersupdateProfileSettingsCollection({
    required this.affectedCount,
    this.$__typename = 'ProfileSettingsUpdateResponse',
  });

  factory MutationSaveIntroAnswersupdateProfileSettingsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSaveIntroAnswersupdateProfileSettingsCollection(
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
    if (other is! MutationSaveIntroAnswersupdateProfileSettingsCollection ||
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
