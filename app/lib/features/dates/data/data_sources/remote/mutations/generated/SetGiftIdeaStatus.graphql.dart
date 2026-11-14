// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetGiftIdeaStatus {
  factory VariablesMutationSetGiftIdeaStatus({
    required String id,
    required EnumGiftIdeaStatus status,
  }) => VariablesMutationSetGiftIdeaStatus._({r'id': id, r'status': status});

  VariablesMutationSetGiftIdeaStatus._(this._$data);

  factory VariablesMutationSetGiftIdeaStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$status = data['status'];
    result$data['status'] = fromJsonEnumGiftIdeaStatus((l$status as String));
    return VariablesMutationSetGiftIdeaStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  EnumGiftIdeaStatus get status => (_$data['status'] as EnumGiftIdeaStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$status = status;
    result$data['status'] = toJsonEnumGiftIdeaStatus(l$status);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetGiftIdeaStatus || runtimeType != other.runtimeType) {
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

class MutationSetGiftIdeaStatus {
  MutationSetGiftIdeaStatus({
    required this.updateGiftIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetGiftIdeaStatus.fromJson(Map<String, dynamic> json) {
    final l$updateGiftIdeasCollection = json['updateGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetGiftIdeaStatus(
      updateGiftIdeasCollection: MutationSetGiftIdeaStatusupdateGiftIdeasCollection.fromJson(
        (l$updateGiftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetGiftIdeaStatusupdateGiftIdeasCollection updateGiftIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateGiftIdeasCollection = updateGiftIdeasCollection;
    _resultData['updateGiftIdeasCollection'] = l$updateGiftIdeasCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateGiftIdeasCollection = updateGiftIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateGiftIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetGiftIdeaStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateGiftIdeasCollection = updateGiftIdeasCollection;
    final lOther$updateGiftIdeasCollection = other.updateGiftIdeasCollection;
    if (l$updateGiftIdeasCollection != lOther$updateGiftIdeasCollection) {
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

const documentNodeMutationSetGiftIdeaStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetGiftIdeaStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(name: NameNode(value: 'GiftIdeaStatus'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateGiftIdeasCollection'),
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
MutationSetGiftIdeaStatus _parserFnMutationSetGiftIdeaStatus(Map<String, dynamic> data) =>
    MutationSetGiftIdeaStatus.fromJson(data);
typedef OnMutationCompletedMutationSetGiftIdeaStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetGiftIdeaStatus?,
);

class OptionsMutationSetGiftIdeaStatus extends graphql.MutationOptions<MutationSetGiftIdeaStatus> {
  OptionsMutationSetGiftIdeaStatus({
    String? operationName,
    required VariablesMutationSetGiftIdeaStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetGiftIdeaStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetGiftIdeaStatus? onCompleted,
    graphql.OnMutationUpdate<MutationSetGiftIdeaStatus>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetGiftIdeaStatus',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSetGiftIdeaStatus(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetGiftIdeaStatus,
         parserFn: _parserFnMutationSetGiftIdeaStatus,
       );

  final OnMutationCompletedMutationSetGiftIdeaStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetGiftIdeaStatus
    extends graphql.WatchQueryOptions<MutationSetGiftIdeaStatus> {
  WatchOptionsMutationSetGiftIdeaStatus({
    String? operationName,
    required VariablesMutationSetGiftIdeaStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetGiftIdeaStatus? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetGiftIdeaStatus',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetGiftIdeaStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetGiftIdeaStatus,
       );
}

extension ClientExtensionMutationSetGiftIdeaStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetGiftIdeaStatus>> mutateSetGiftIdeaStatus(
    OptionsMutationSetGiftIdeaStatus options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetGiftIdeaStatus> watchMutationSetGiftIdeaStatus(
    WatchOptionsMutationSetGiftIdeaStatus options,
  ) => this.watchMutation(options);
}

class MutationSetGiftIdeaStatusupdateGiftIdeasCollection {
  MutationSetGiftIdeaStatusupdateGiftIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'GiftIdeasUpdateResponse',
  });

  factory MutationSetGiftIdeaStatusupdateGiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetGiftIdeaStatusupdateGiftIdeasCollection(
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
    if (other is! MutationSetGiftIdeaStatusupdateGiftIdeasCollection ||
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
