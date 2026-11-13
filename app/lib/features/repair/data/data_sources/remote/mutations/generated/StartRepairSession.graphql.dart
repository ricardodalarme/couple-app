// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationStartRepairSession {
  factory VariablesMutationStartRepairSession({
    required String id,
    int? intensity,
    required String path,
  }) => VariablesMutationStartRepairSession._({
    r'id': id,
    if (intensity != null) r'intensity': intensity,
    r'path': path,
  });

  VariablesMutationStartRepairSession._(this._$data);

  factory VariablesMutationStartRepairSession.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('intensity')) {
      final l$intensity = data['intensity'];
      result$data['intensity'] = (l$intensity as int?);
    }
    final l$path = data['path'];
    result$data['path'] = (l$path as String);
    return VariablesMutationStartRepairSession._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  int? get intensity => (_$data['intensity'] as int?);

  String get path => (_$data['path'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('intensity')) {
      final l$intensity = intensity;
      result$data['intensity'] = l$intensity;
    }
    final l$path = path;
    result$data['path'] = l$path;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationStartRepairSession || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$intensity = intensity;
    final lOther$intensity = other.intensity;
    if (_$data.containsKey('intensity') != other._$data.containsKey('intensity')) {
      return false;
    }
    if (l$intensity != lOther$intensity) {
      return false;
    }
    final l$path = path;
    final lOther$path = other.path;
    if (l$path != lOther$path) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$intensity = intensity;
    final l$path = path;
    return Object.hashAll([l$id, _$data.containsKey('intensity') ? l$intensity : const {}, l$path]);
  }
}

class MutationStartRepairSession {
  MutationStartRepairSession({
    this.insertIntoRepairSessionsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationStartRepairSession.fromJson(Map<String, dynamic> json) {
    final l$insertIntoRepairSessionsCollection = json['insertIntoRepairSessionsCollection'];
    final l$$__typename = json['__typename'];
    return MutationStartRepairSession(
      insertIntoRepairSessionsCollection: l$insertIntoRepairSessionsCollection == null
          ? null
          : MutationStartRepairSessioninsertIntoRepairSessionsCollection.fromJson(
              (l$insertIntoRepairSessionsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationStartRepairSessioninsertIntoRepairSessionsCollection?
  insertIntoRepairSessionsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoRepairSessionsCollection = insertIntoRepairSessionsCollection;
    _resultData['insertIntoRepairSessionsCollection'] = l$insertIntoRepairSessionsCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoRepairSessionsCollection = insertIntoRepairSessionsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoRepairSessionsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationStartRepairSession || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoRepairSessionsCollection = insertIntoRepairSessionsCollection;
    final lOther$insertIntoRepairSessionsCollection = other.insertIntoRepairSessionsCollection;
    if (l$insertIntoRepairSessionsCollection != lOther$insertIntoRepairSessionsCollection) {
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

const documentNodeMutationStartRepairSession = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'StartRepairSession'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'intensity')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'path')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoRepairSessionsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'intensity'),
                          value: VariableNode(name: NameNode(value: 'intensity')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'path'),
                          value: VariableNode(name: NameNode(value: 'path')),
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
MutationStartRepairSession _parserFnMutationStartRepairSession(Map<String, dynamic> data) =>
    MutationStartRepairSession.fromJson(data);
typedef OnMutationCompletedMutationStartRepairSession = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationStartRepairSession?,
);

class OptionsMutationStartRepairSession
    extends graphql.MutationOptions<MutationStartRepairSession> {
  OptionsMutationStartRepairSession({
    String? operationName,
    required VariablesMutationStartRepairSession variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationStartRepairSession? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationStartRepairSession? onCompleted,
    graphql.OnMutationUpdate<MutationStartRepairSession>? update,
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
                 data == null ? null : _parserFnMutationStartRepairSession(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationStartRepairSession,
         parserFn: _parserFnMutationStartRepairSession,
       );

  final OnMutationCompletedMutationStartRepairSession? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationStartRepairSession
    extends graphql.WatchQueryOptions<MutationStartRepairSession> {
  WatchOptionsMutationStartRepairSession({
    String? operationName,
    required VariablesMutationStartRepairSession variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationStartRepairSession? typedOptimisticResult,
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
         document: documentNodeMutationStartRepairSession,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationStartRepairSession,
       );
}

extension ClientExtensionMutationStartRepairSession on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationStartRepairSession>> mutateStartRepairSession(
    OptionsMutationStartRepairSession options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationStartRepairSession> watchMutationStartRepairSession(
    WatchOptionsMutationStartRepairSession options,
  ) => this.watchMutation(options);
}

class MutationStartRepairSessioninsertIntoRepairSessionsCollection {
  MutationStartRepairSessioninsertIntoRepairSessionsCollection({
    required this.affectedCount,
    this.$__typename = 'RepairSessionsInsertResponse',
  });

  factory MutationStartRepairSessioninsertIntoRepairSessionsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationStartRepairSessioninsertIntoRepairSessionsCollection(
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
    if (other is! MutationStartRepairSessioninsertIntoRepairSessionsCollection ||
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
