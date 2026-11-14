// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetListItemStatus {
  factory VariablesMutationSetListItemStatus({
    required String id,
    required EnumListItemStatus status,
  }) => VariablesMutationSetListItemStatus._({r'id': id, r'status': status});

  VariablesMutationSetListItemStatus._(this._$data);

  factory VariablesMutationSetListItemStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$status = data['status'];
    result$data['status'] = fromJsonEnumListItemStatus((l$status as String));
    return VariablesMutationSetListItemStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  EnumListItemStatus get status => (_$data['status'] as EnumListItemStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$status = status;
    result$data['status'] = toJsonEnumListItemStatus(l$status);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetListItemStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    return Object.hashAll([l$id, l$status]);
  }
}

class MutationSetListItemStatus {
  MutationSetListItemStatus({
    required this.updateListItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetListItemStatus.fromJson(Map<String, dynamic> json) {
    final l$updateListItemsCollection = json['updateListItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetListItemStatus(
      updateListItemsCollection: MutationSetListItemStatusupdateListItemsCollection.fromJson(
        (l$updateListItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetListItemStatusupdateListItemsCollection updateListItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateListItemsCollection = updateListItemsCollection;
    _resultData['updateListItemsCollection'] = l$updateListItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateListItemsCollection = updateListItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateListItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetListItemStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateListItemsCollection = updateListItemsCollection;
    final lOther$updateListItemsCollection = other.updateListItemsCollection;
    if (l$updateListItemsCollection != lOther$updateListItemsCollection) {
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

const documentNodeMutationSetListItemStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetListItemStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(name: NameNode(value: 'ListItemStatus'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateListItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'status'),
                      value: VariableNode(name: NameNode(value: 'status')),
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
MutationSetListItemStatus _parserFnMutationSetListItemStatus(Map<String, dynamic> data) =>
    MutationSetListItemStatus.fromJson(data);
typedef OnMutationCompletedMutationSetListItemStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetListItemStatus?,
);

class OptionsMutationSetListItemStatus extends graphql.MutationOptions<MutationSetListItemStatus> {
  OptionsMutationSetListItemStatus({
    String? operationName,
    required VariablesMutationSetListItemStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetListItemStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetListItemStatus? onCompleted,
    graphql.OnMutationUpdate<MutationSetListItemStatus>? update,
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
                 data == null ? null : _parserFnMutationSetListItemStatus(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetListItemStatus,
         parserFn: _parserFnMutationSetListItemStatus,
       );

  final OnMutationCompletedMutationSetListItemStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetListItemStatus
    extends graphql.WatchQueryOptions<MutationSetListItemStatus> {
  WatchOptionsMutationSetListItemStatus({
    String? operationName,
    required VariablesMutationSetListItemStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetListItemStatus? typedOptimisticResult,
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
         document: documentNodeMutationSetListItemStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetListItemStatus,
       );
}

extension ClientExtensionMutationSetListItemStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetListItemStatus>> mutateSetListItemStatus(
    OptionsMutationSetListItemStatus options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetListItemStatus> watchMutationSetListItemStatus(
    WatchOptionsMutationSetListItemStatus options,
  ) => this.watchMutation(options);
}

class MutationSetListItemStatusupdateListItemsCollection {
  MutationSetListItemStatusupdateListItemsCollection({
    required this.affectedCount,
    this.$__typename = 'ListItemsUpdateResponse',
  });

  factory MutationSetListItemStatusupdateListItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetListItemStatusupdateListItemsCollection(
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
    if (other is! MutationSetListItemStatusupdateListItemsCollection ||
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
