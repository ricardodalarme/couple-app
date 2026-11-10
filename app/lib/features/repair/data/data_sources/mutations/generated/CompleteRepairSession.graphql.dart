// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationCompleteRepairSession {
  factory VariablesMutationCompleteRepairSession({
    required String id,
    String? feeling,
    required DateTime completedAt,
  }) => VariablesMutationCompleteRepairSession._({
    r'id': id,
    if (feeling != null) r'feeling': feeling,
    r'completedAt': completedAt,
  });

  VariablesMutationCompleteRepairSession._(this._$data);

  factory VariablesMutationCompleteRepairSession.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('feeling')) {
      final l$feeling = data['feeling'];
      result$data['feeling'] = (l$feeling as String?);
    }
    final l$completedAt = data['completedAt'];
    result$data['completedAt'] = DateTime.parse((l$completedAt as String));
    return VariablesMutationCompleteRepairSession._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get feeling => (_$data['feeling'] as String?);

  DateTime get completedAt => (_$data['completedAt'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('feeling')) {
      final l$feeling = feeling;
      result$data['feeling'] = l$feeling;
    }
    final l$completedAt = completedAt;
    result$data['completedAt'] = l$completedAt.toIso8601String();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationCompleteRepairSession || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$feeling = feeling;
    final lOther$feeling = other.feeling;
    if (_$data.containsKey('feeling') != other._$data.containsKey('feeling')) {
      return false;
    }
    if (l$feeling != lOther$feeling) {
      return false;
    }
    final l$completedAt = completedAt;
    final lOther$completedAt = other.completedAt;
    if (l$completedAt != lOther$completedAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$feeling = feeling;
    final l$completedAt = completedAt;
    return Object.hashAll([
      l$id,
      _$data.containsKey('feeling') ? l$feeling : const {},
      l$completedAt,
    ]);
  }
}

class MutationCompleteRepairSession {
  MutationCompleteRepairSession({
    required this.updateRepairSessionsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationCompleteRepairSession.fromJson(Map<String, dynamic> json) {
    final l$updateRepairSessionsCollection = json['updateRepairSessionsCollection'];
    final l$$__typename = json['__typename'];
    return MutationCompleteRepairSession(
      updateRepairSessionsCollection:
          MutationCompleteRepairSessionupdateRepairSessionsCollection.fromJson(
            (l$updateRepairSessionsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationCompleteRepairSessionupdateRepairSessionsCollection updateRepairSessionsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRepairSessionsCollection = updateRepairSessionsCollection;
    _resultData['updateRepairSessionsCollection'] = l$updateRepairSessionsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRepairSessionsCollection = updateRepairSessionsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRepairSessionsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationCompleteRepairSession || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRepairSessionsCollection = updateRepairSessionsCollection;
    final lOther$updateRepairSessionsCollection = other.updateRepairSessionsCollection;
    if (l$updateRepairSessionsCollection != lOther$updateRepairSessionsCollection) {
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

const documentNodeMutationCompleteRepairSession = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CompleteRepairSession'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'feeling')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'completedAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateRepairSessionsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'feelingAfter'),
                      value: VariableNode(name: NameNode(value: 'feeling')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'completedAt'),
                      value: VariableNode(name: NameNode(value: 'completedAt')),
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
MutationCompleteRepairSession _parserFnMutationCompleteRepairSession(Map<String, dynamic> data) =>
    MutationCompleteRepairSession.fromJson(data);
typedef OnMutationCompletedMutationCompleteRepairSession = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationCompleteRepairSession?,
);

class OptionsMutationCompleteRepairSession
    extends graphql.MutationOptions<MutationCompleteRepairSession> {
  OptionsMutationCompleteRepairSession({
    String? operationName,
    required VariablesMutationCompleteRepairSession variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCompleteRepairSession? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationCompleteRepairSession? onCompleted,
    graphql.OnMutationUpdate<MutationCompleteRepairSession>? update,
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
                 data == null ? null : _parserFnMutationCompleteRepairSession(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCompleteRepairSession,
         parserFn: _parserFnMutationCompleteRepairSession,
       );

  final OnMutationCompletedMutationCompleteRepairSession? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationCompleteRepairSession
    extends graphql.WatchQueryOptions<MutationCompleteRepairSession> {
  WatchOptionsMutationCompleteRepairSession({
    String? operationName,
    required VariablesMutationCompleteRepairSession variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCompleteRepairSession? typedOptimisticResult,
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
         document: documentNodeMutationCompleteRepairSession,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationCompleteRepairSession,
       );
}

extension ClientExtensionMutationCompleteRepairSession on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationCompleteRepairSession>> mutateCompleteRepairSession(
    OptionsMutationCompleteRepairSession options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationCompleteRepairSession> watchMutationCompleteRepairSession(
    WatchOptionsMutationCompleteRepairSession options,
  ) => this.watchMutation(options);
}

class MutationCompleteRepairSessionupdateRepairSessionsCollection {
  MutationCompleteRepairSessionupdateRepairSessionsCollection({
    required this.affectedCount,
    this.$__typename = 'RepairSessionsUpdateResponse',
  });

  factory MutationCompleteRepairSessionupdateRepairSessionsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationCompleteRepairSessionupdateRepairSessionsCollection(
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
    if (other is! MutationCompleteRepairSessionupdateRepairSessionsCollection ||
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
