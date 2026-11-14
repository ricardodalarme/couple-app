// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationCompleteRitual {
  factory VariablesMutationCompleteRitual({required String ritualId, required DateTime doneOn}) =>
      VariablesMutationCompleteRitual._({r'ritualId': ritualId, r'doneOn': doneOn});

  VariablesMutationCompleteRitual._(this._$data);

  factory VariablesMutationCompleteRitual.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ritualId = data['ritualId'];
    result$data['ritualId'] = (l$ritualId as String);
    final l$doneOn = data['doneOn'];
    result$data['doneOn'] = DateTime.parse((l$doneOn as String));
    return VariablesMutationCompleteRitual._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ritualId => (_$data['ritualId'] as String);

  DateTime get doneOn => (_$data['doneOn'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ritualId = ritualId;
    result$data['ritualId'] = l$ritualId;
    final l$doneOn = doneOn;
    result$data['doneOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$doneOn);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationCompleteRitual || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ritualId = ritualId;
    final lOther$ritualId = other.ritualId;
    if (l$ritualId != lOther$ritualId) {
      return false;
    }
    final l$doneOn = doneOn;
    final lOther$doneOn = other.doneOn;
    if (l$doneOn != lOther$doneOn) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ritualId = ritualId;
    final l$doneOn = doneOn;
    return Object.hashAll([l$ritualId, l$doneOn]);
  }
}

class MutationCompleteRitual {
  MutationCompleteRitual({this.insertIntoRitualLogsCollection, this.$__typename = 'Mutation'});

  factory MutationCompleteRitual.fromJson(Map<String, dynamic> json) {
    final l$insertIntoRitualLogsCollection = json['insertIntoRitualLogsCollection'];
    final l$$__typename = json['__typename'];
    return MutationCompleteRitual(
      insertIntoRitualLogsCollection: l$insertIntoRitualLogsCollection == null
          ? null
          : MutationCompleteRitualinsertIntoRitualLogsCollection.fromJson(
              (l$insertIntoRitualLogsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationCompleteRitualinsertIntoRitualLogsCollection? insertIntoRitualLogsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoRitualLogsCollection = insertIntoRitualLogsCollection;
    _resultData['insertIntoRitualLogsCollection'] = l$insertIntoRitualLogsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoRitualLogsCollection = insertIntoRitualLogsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoRitualLogsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationCompleteRitual || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoRitualLogsCollection = insertIntoRitualLogsCollection;
    final lOther$insertIntoRitualLogsCollection = other.insertIntoRitualLogsCollection;
    if (l$insertIntoRitualLogsCollection != lOther$insertIntoRitualLogsCollection) {
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

const documentNodeMutationCompleteRitual = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CompleteRitual'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ritualId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'doneOn')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoRitualLogsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'ritualId'),
                          value: VariableNode(name: NameNode(value: 'ritualId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'doneOn'),
                          value: VariableNode(name: NameNode(value: 'doneOn')),
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
MutationCompleteRitual _parserFnMutationCompleteRitual(Map<String, dynamic> data) =>
    MutationCompleteRitual.fromJson(data);
typedef OnMutationCompletedMutationCompleteRitual = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationCompleteRitual?,
);

class OptionsMutationCompleteRitual extends graphql.MutationOptions<MutationCompleteRitual> {
  OptionsMutationCompleteRitual({
    String? operationName,
    required VariablesMutationCompleteRitual variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCompleteRitual? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationCompleteRitual? onCompleted,
    graphql.OnMutationUpdate<MutationCompleteRitual>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'CompleteRitual',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationCompleteRitual(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationCompleteRitual,
         parserFn: _parserFnMutationCompleteRitual,
       );

  final OnMutationCompletedMutationCompleteRitual? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationCompleteRitual extends graphql.WatchQueryOptions<MutationCompleteRitual> {
  WatchOptionsMutationCompleteRitual({
    String? operationName,
    required VariablesMutationCompleteRitual variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCompleteRitual? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'CompleteRitual',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationCompleteRitual,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationCompleteRitual,
       );
}

extension ClientExtensionMutationCompleteRitual on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationCompleteRitual>> mutateCompleteRitual(
    OptionsMutationCompleteRitual options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationCompleteRitual> watchMutationCompleteRitual(
    WatchOptionsMutationCompleteRitual options,
  ) => this.watchMutation(options);
}

class MutationCompleteRitualinsertIntoRitualLogsCollection {
  MutationCompleteRitualinsertIntoRitualLogsCollection({
    required this.affectedCount,
    this.$__typename = 'RitualLogsInsertResponse',
  });

  factory MutationCompleteRitualinsertIntoRitualLogsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationCompleteRitualinsertIntoRitualLogsCollection(
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
    if (other is! MutationCompleteRitualinsertIntoRitualLogsCollection ||
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
