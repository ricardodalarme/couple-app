// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateRitual {
  factory VariablesMutationUpdateRitual({
    required String id,
    required String title,
    required EnumRitualCadence cadence,
    int? weekday,
    String? atTime,
    required bool reminder,
  }) => VariablesMutationUpdateRitual._({
    r'id': id,
    r'title': title,
    r'cadence': cadence,
    if (weekday != null) r'weekday': weekday,
    if (atTime != null) r'atTime': atTime,
    r'reminder': reminder,
  });

  VariablesMutationUpdateRitual._(this._$data);

  factory VariablesMutationUpdateRitual.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$cadence = data['cadence'];
    result$data['cadence'] = fromJsonEnumRitualCadence((l$cadence as String));
    if (data.containsKey('weekday')) {
      final l$weekday = data['weekday'];
      result$data['weekday'] = (l$weekday as int?);
    }
    if (data.containsKey('atTime')) {
      final l$atTime = data['atTime'];
      result$data['atTime'] = (l$atTime as String?);
    }
    final l$reminder = data['reminder'];
    result$data['reminder'] = (l$reminder as bool);
    return VariablesMutationUpdateRitual._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get title => (_$data['title'] as String);

  EnumRitualCadence get cadence => (_$data['cadence'] as EnumRitualCadence);

  int? get weekday => (_$data['weekday'] as int?);

  String? get atTime => (_$data['atTime'] as String?);

  bool get reminder => (_$data['reminder'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$title = title;
    result$data['title'] = l$title;
    final l$cadence = cadence;
    result$data['cadence'] = toJsonEnumRitualCadence(l$cadence);
    if (_$data.containsKey('weekday')) {
      final l$weekday = weekday;
      result$data['weekday'] = l$weekday;
    }
    if (_$data.containsKey('atTime')) {
      final l$atTime = atTime;
      result$data['atTime'] = l$atTime;
    }
    final l$reminder = reminder;
    result$data['reminder'] = l$reminder;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateRitual || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$cadence = cadence;
    final lOther$cadence = other.cadence;
    if (l$cadence != lOther$cadence) {
      return false;
    }
    final l$weekday = weekday;
    final lOther$weekday = other.weekday;
    if (_$data.containsKey('weekday') != other._$data.containsKey('weekday')) {
      return false;
    }
    if (l$weekday != lOther$weekday) {
      return false;
    }
    final l$atTime = atTime;
    final lOther$atTime = other.atTime;
    if (_$data.containsKey('atTime') != other._$data.containsKey('atTime')) {
      return false;
    }
    if (l$atTime != lOther$atTime) {
      return false;
    }
    final l$reminder = reminder;
    final lOther$reminder = other.reminder;
    if (l$reminder != lOther$reminder) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$cadence = cadence;
    final l$weekday = weekday;
    final l$atTime = atTime;
    final l$reminder = reminder;
    return Object.hashAll([
      l$id,
      l$title,
      l$cadence,
      _$data.containsKey('weekday') ? l$weekday : const {},
      _$data.containsKey('atTime') ? l$atTime : const {},
      l$reminder,
    ]);
  }
}

class MutationUpdateRitual {
  MutationUpdateRitual({required this.updateRitualsCollection, this.$__typename = 'Mutation'});

  factory MutationUpdateRitual.fromJson(Map<String, dynamic> json) {
    final l$updateRitualsCollection = json['updateRitualsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateRitual(
      updateRitualsCollection: MutationUpdateRitualupdateRitualsCollection.fromJson(
        (l$updateRitualsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateRitualupdateRitualsCollection updateRitualsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRitualsCollection = updateRitualsCollection;
    _resultData['updateRitualsCollection'] = l$updateRitualsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRitualsCollection = updateRitualsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRitualsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateRitual || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRitualsCollection = updateRitualsCollection;
    final lOther$updateRitualsCollection = other.updateRitualsCollection;
    if (l$updateRitualsCollection != lOther$updateRitualsCollection) {
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

const documentNodeMutationUpdateRitual = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateRitual'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cadence')),
          type: NamedTypeNode(name: NameNode(value: 'RitualCadence'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'weekday')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'atTime')),
          type: NamedTypeNode(name: NameNode(value: 'Time'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'reminder')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateRitualsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'title'),
                      value: VariableNode(name: NameNode(value: 'title')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'cadence'),
                      value: VariableNode(name: NameNode(value: 'cadence')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'weekday'),
                      value: VariableNode(name: NameNode(value: 'weekday')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'atTime'),
                      value: VariableNode(name: NameNode(value: 'atTime')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'reminder'),
                      value: VariableNode(name: NameNode(value: 'reminder')),
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
MutationUpdateRitual _parserFnMutationUpdateRitual(Map<String, dynamic> data) =>
    MutationUpdateRitual.fromJson(data);
typedef OnMutationCompletedMutationUpdateRitual = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateRitual?,
);

class OptionsMutationUpdateRitual extends graphql.MutationOptions<MutationUpdateRitual> {
  OptionsMutationUpdateRitual({
    String? operationName,
    required VariablesMutationUpdateRitual variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateRitual? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateRitual? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateRitual>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationUpdateRitual(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateRitual,
         parserFn: _parserFnMutationUpdateRitual,
       );

  final OnMutationCompletedMutationUpdateRitual? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateRitual extends graphql.WatchQueryOptions<MutationUpdateRitual> {
  WatchOptionsMutationUpdateRitual({
    String? operationName,
    required VariablesMutationUpdateRitual variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateRitual? typedOptimisticResult,
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
         document: documentNodeMutationUpdateRitual,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateRitual,
       );
}

extension ClientExtensionMutationUpdateRitual on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateRitual>> mutateUpdateRitual(
    OptionsMutationUpdateRitual options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateRitual> watchMutationUpdateRitual(
    WatchOptionsMutationUpdateRitual options,
  ) => this.watchMutation(options);
}

class MutationUpdateRitualupdateRitualsCollection {
  MutationUpdateRitualupdateRitualsCollection({
    required this.affectedCount,
    this.$__typename = 'RitualsUpdateResponse',
  });

  factory MutationUpdateRitualupdateRitualsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateRitualupdateRitualsCollection(
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
    if (other is! MutationUpdateRitualupdateRitualsCollection || runtimeType != other.runtimeType) {
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
