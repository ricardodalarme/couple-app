// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteLearning {
  factory VariablesMutationDeleteLearning({required String id}) =>
      VariablesMutationDeleteLearning._({r'id': id});

  VariablesMutationDeleteLearning._(this._$data);

  factory VariablesMutationDeleteLearning.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteLearning._(result$data);
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
    if (other is! VariablesMutationDeleteLearning || runtimeType != other.runtimeType) {
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

class MutationDeleteLearning {
  MutationDeleteLearning({
    required this.deleteFromRepairLearningsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteLearning.fromJson(Map<String, dynamic> json) {
    final l$deleteFromRepairLearningsCollection = json['deleteFromRepairLearningsCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteLearning(
      deleteFromRepairLearningsCollection:
          MutationDeleteLearningdeleteFromRepairLearningsCollection.fromJson(
            (l$deleteFromRepairLearningsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteLearningdeleteFromRepairLearningsCollection
  deleteFromRepairLearningsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromRepairLearningsCollection = deleteFromRepairLearningsCollection;
    _resultData['deleteFromRepairLearningsCollection'] = l$deleteFromRepairLearningsCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromRepairLearningsCollection = deleteFromRepairLearningsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromRepairLearningsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteLearning || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromRepairLearningsCollection = deleteFromRepairLearningsCollection;
    final lOther$deleteFromRepairLearningsCollection = other.deleteFromRepairLearningsCollection;
    if (l$deleteFromRepairLearningsCollection != lOther$deleteFromRepairLearningsCollection) {
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

const documentNodeMutationDeleteLearning = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteLearning'),
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
            name: NameNode(value: 'deleteFromRepairLearningsCollection'),
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
MutationDeleteLearning _parserFnMutationDeleteLearning(Map<String, dynamic> data) =>
    MutationDeleteLearning.fromJson(data);
typedef OnMutationCompletedMutationDeleteLearning = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteLearning?,
);

class OptionsMutationDeleteLearning extends graphql.MutationOptions<MutationDeleteLearning> {
  OptionsMutationDeleteLearning({
    String? operationName,
    required VariablesMutationDeleteLearning variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteLearning? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteLearning? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteLearning>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteLearning',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteLearning(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteLearning,
         parserFn: _parserFnMutationDeleteLearning,
       );

  final OnMutationCompletedMutationDeleteLearning? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteLearning extends graphql.WatchQueryOptions<MutationDeleteLearning> {
  WatchOptionsMutationDeleteLearning({
    String? operationName,
    required VariablesMutationDeleteLearning variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteLearning? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteLearning',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteLearning,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteLearning,
       );
}

extension ClientExtensionMutationDeleteLearning on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteLearning>> mutateDeleteLearning(
    OptionsMutationDeleteLearning options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteLearning> watchMutationDeleteLearning(
    WatchOptionsMutationDeleteLearning options,
  ) => this.watchMutation(options);
}

class MutationDeleteLearningdeleteFromRepairLearningsCollection {
  MutationDeleteLearningdeleteFromRepairLearningsCollection({
    required this.affectedCount,
    this.$__typename = 'RepairLearningsDeleteResponse',
  });

  factory MutationDeleteLearningdeleteFromRepairLearningsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteLearningdeleteFromRepairLearningsCollection(
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
    if (other is! MutationDeleteLearningdeleteFromRepairLearningsCollection ||
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
