// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationClearLogisticItemAssignee {
  factory VariablesMutationClearLogisticItemAssignee({required String id}) =>
      VariablesMutationClearLogisticItemAssignee._({r'id': id});

  VariablesMutationClearLogisticItemAssignee._(this._$data);

  factory VariablesMutationClearLogisticItemAssignee.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationClearLogisticItemAssignee._(result$data);
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
    if (other is! VariablesMutationClearLogisticItemAssignee || runtimeType != other.runtimeType) {
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

class MutationClearLogisticItemAssignee {
  MutationClearLogisticItemAssignee({
    required this.updateLogisticItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationClearLogisticItemAssignee.fromJson(Map<String, dynamic> json) {
    final l$updateLogisticItemsCollection = json['updateLogisticItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationClearLogisticItemAssignee(
      updateLogisticItemsCollection:
          MutationClearLogisticItemAssigneeupdateLogisticItemsCollection.fromJson(
            (l$updateLogisticItemsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationClearLogisticItemAssigneeupdateLogisticItemsCollection
  updateLogisticItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLogisticItemsCollection = updateLogisticItemsCollection;
    _resultData['updateLogisticItemsCollection'] = l$updateLogisticItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLogisticItemsCollection = updateLogisticItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateLogisticItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationClearLogisticItemAssignee || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLogisticItemsCollection = updateLogisticItemsCollection;
    final lOther$updateLogisticItemsCollection = other.updateLogisticItemsCollection;
    if (l$updateLogisticItemsCollection != lOther$updateLogisticItemsCollection) {
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

const documentNodeMutationClearLogisticItemAssignee = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ClearLogisticItemAssignee'),
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
            name: NameNode(value: 'updateLogisticItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'assigneeId'),
                      value: NullValueNode(),
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
MutationClearLogisticItemAssignee _parserFnMutationClearLogisticItemAssignee(
  Map<String, dynamic> data,
) => MutationClearLogisticItemAssignee.fromJson(data);
typedef OnMutationCompletedMutationClearLogisticItemAssignee = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationClearLogisticItemAssignee?,
);

class OptionsMutationClearLogisticItemAssignee
    extends graphql.MutationOptions<MutationClearLogisticItemAssignee> {
  OptionsMutationClearLogisticItemAssignee({
    String? operationName,
    required VariablesMutationClearLogisticItemAssignee variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearLogisticItemAssignee? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationClearLogisticItemAssignee? onCompleted,
    graphql.OnMutationUpdate<MutationClearLogisticItemAssignee>? update,
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
                 data == null ? null : _parserFnMutationClearLogisticItemAssignee(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationClearLogisticItemAssignee,
         parserFn: _parserFnMutationClearLogisticItemAssignee,
       );

  final OnMutationCompletedMutationClearLogisticItemAssignee? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationClearLogisticItemAssignee
    extends graphql.WatchQueryOptions<MutationClearLogisticItemAssignee> {
  WatchOptionsMutationClearLogisticItemAssignee({
    String? operationName,
    required VariablesMutationClearLogisticItemAssignee variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearLogisticItemAssignee? typedOptimisticResult,
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
         document: documentNodeMutationClearLogisticItemAssignee,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationClearLogisticItemAssignee,
       );
}

extension ClientExtensionMutationClearLogisticItemAssignee on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationClearLogisticItemAssignee>> mutateClearLogisticItemAssignee(
    OptionsMutationClearLogisticItemAssignee options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationClearLogisticItemAssignee> watchMutationClearLogisticItemAssignee(
    WatchOptionsMutationClearLogisticItemAssignee options,
  ) => this.watchMutation(options);
}

class MutationClearLogisticItemAssigneeupdateLogisticItemsCollection {
  MutationClearLogisticItemAssigneeupdateLogisticItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LogisticItemsUpdateResponse',
  });

  factory MutationClearLogisticItemAssigneeupdateLogisticItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationClearLogisticItemAssigneeupdateLogisticItemsCollection(
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
    if (other is! MutationClearLogisticItemAssigneeupdateLogisticItemsCollection ||
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
