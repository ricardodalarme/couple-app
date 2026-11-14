// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetLogisticItemAssignee {
  factory VariablesMutationSetLogisticItemAssignee({required String id, String? assigneeId}) =>
      VariablesMutationSetLogisticItemAssignee._({
        r'id': id,
        if (assigneeId != null) r'assigneeId': assigneeId,
      });

  VariablesMutationSetLogisticItemAssignee._(this._$data);

  factory VariablesMutationSetLogisticItemAssignee.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('assigneeId')) {
      final l$assigneeId = data['assigneeId'];
      result$data['assigneeId'] = (l$assigneeId as String?);
    }
    return VariablesMutationSetLogisticItemAssignee._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get assigneeId => (_$data['assigneeId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('assigneeId')) {
      final l$assigneeId = assigneeId;
      result$data['assigneeId'] = l$assigneeId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetLogisticItemAssignee || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$assigneeId = assigneeId;
    final lOther$assigneeId = other.assigneeId;
    if (_$data.containsKey('assigneeId') != other._$data.containsKey('assigneeId')) {
      return false;
    }
    if (l$assigneeId != lOther$assigneeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$assigneeId = assigneeId;
    return Object.hashAll([l$id, _$data.containsKey('assigneeId') ? l$assigneeId : const {}]);
  }
}

class MutationSetLogisticItemAssignee {
  MutationSetLogisticItemAssignee({
    required this.updateLogisticItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetLogisticItemAssignee.fromJson(Map<String, dynamic> json) {
    final l$updateLogisticItemsCollection = json['updateLogisticItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetLogisticItemAssignee(
      updateLogisticItemsCollection:
          MutationSetLogisticItemAssigneeupdateLogisticItemsCollection.fromJson(
            (l$updateLogisticItemsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetLogisticItemAssigneeupdateLogisticItemsCollection updateLogisticItemsCollection;

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
    if (other is! MutationSetLogisticItemAssignee || runtimeType != other.runtimeType) {
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

const documentNodeMutationSetLogisticItemAssignee = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetLogisticItemAssignee'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'assigneeId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
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
                      value: VariableNode(name: NameNode(value: 'assigneeId')),
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
MutationSetLogisticItemAssignee _parserFnMutationSetLogisticItemAssignee(
  Map<String, dynamic> data,
) => MutationSetLogisticItemAssignee.fromJson(data);
typedef OnMutationCompletedMutationSetLogisticItemAssignee = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetLogisticItemAssignee?,
);

class OptionsMutationSetLogisticItemAssignee
    extends graphql.MutationOptions<MutationSetLogisticItemAssignee> {
  OptionsMutationSetLogisticItemAssignee({
    String? operationName,
    required VariablesMutationSetLogisticItemAssignee variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetLogisticItemAssignee? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetLogisticItemAssignee? onCompleted,
    graphql.OnMutationUpdate<MutationSetLogisticItemAssignee>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetLogisticItemAssignee',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSetLogisticItemAssignee(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetLogisticItemAssignee,
         parserFn: _parserFnMutationSetLogisticItemAssignee,
       );

  final OnMutationCompletedMutationSetLogisticItemAssignee? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetLogisticItemAssignee
    extends graphql.WatchQueryOptions<MutationSetLogisticItemAssignee> {
  WatchOptionsMutationSetLogisticItemAssignee({
    String? operationName,
    required VariablesMutationSetLogisticItemAssignee variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetLogisticItemAssignee? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetLogisticItemAssignee',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetLogisticItemAssignee,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetLogisticItemAssignee,
       );
}

extension ClientExtensionMutationSetLogisticItemAssignee on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetLogisticItemAssignee>> mutateSetLogisticItemAssignee(
    OptionsMutationSetLogisticItemAssignee options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetLogisticItemAssignee> watchMutationSetLogisticItemAssignee(
    WatchOptionsMutationSetLogisticItemAssignee options,
  ) => this.watchMutation(options);
}

class MutationSetLogisticItemAssigneeupdateLogisticItemsCollection {
  MutationSetLogisticItemAssigneeupdateLogisticItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LogisticItemsUpdateResponse',
  });

  factory MutationSetLogisticItemAssigneeupdateLogisticItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetLogisticItemAssigneeupdateLogisticItemsCollection(
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
    if (other is! MutationSetLogisticItemAssigneeupdateLogisticItemsCollection ||
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
