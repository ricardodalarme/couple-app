// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetDateIdeaStatus {
  factory VariablesMutationSetDateIdeaStatus({
    required String id,
    required EnumDateIdeaStatus status,
  }) => VariablesMutationSetDateIdeaStatus._({r'id': id, r'status': status});

  VariablesMutationSetDateIdeaStatus._(this._$data);

  factory VariablesMutationSetDateIdeaStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$status = data['status'];
    result$data['status'] = fromJsonEnumDateIdeaStatus((l$status as String));
    return VariablesMutationSetDateIdeaStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  EnumDateIdeaStatus get status => (_$data['status'] as EnumDateIdeaStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$status = status;
    result$data['status'] = toJsonEnumDateIdeaStatus(l$status);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetDateIdeaStatus || runtimeType != other.runtimeType) {
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

class MutationSetDateIdeaStatus {
  MutationSetDateIdeaStatus({
    required this.updateSavedDateIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetDateIdeaStatus.fromJson(Map<String, dynamic> json) {
    final l$updateSavedDateIdeasCollection = json['updateSavedDateIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetDateIdeaStatus(
      updateSavedDateIdeasCollection:
          MutationSetDateIdeaStatusupdateSavedDateIdeasCollection.fromJson(
            (l$updateSavedDateIdeasCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetDateIdeaStatusupdateSavedDateIdeasCollection updateSavedDateIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateSavedDateIdeasCollection = updateSavedDateIdeasCollection;
    _resultData['updateSavedDateIdeasCollection'] = l$updateSavedDateIdeasCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateSavedDateIdeasCollection = updateSavedDateIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateSavedDateIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetDateIdeaStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateSavedDateIdeasCollection = updateSavedDateIdeasCollection;
    final lOther$updateSavedDateIdeasCollection = other.updateSavedDateIdeasCollection;
    if (l$updateSavedDateIdeasCollection != lOther$updateSavedDateIdeasCollection) {
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

const documentNodeMutationSetDateIdeaStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetDateIdeaStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(name: NameNode(value: 'DateIdeaStatus'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateSavedDateIdeasCollection'),
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
MutationSetDateIdeaStatus _parserFnMutationSetDateIdeaStatus(Map<String, dynamic> data) =>
    MutationSetDateIdeaStatus.fromJson(data);
typedef OnMutationCompletedMutationSetDateIdeaStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetDateIdeaStatus?,
);

class OptionsMutationSetDateIdeaStatus extends graphql.MutationOptions<MutationSetDateIdeaStatus> {
  OptionsMutationSetDateIdeaStatus({
    String? operationName,
    required VariablesMutationSetDateIdeaStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetDateIdeaStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetDateIdeaStatus? onCompleted,
    graphql.OnMutationUpdate<MutationSetDateIdeaStatus>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetDateIdeaStatus',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSetDateIdeaStatus(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetDateIdeaStatus,
         parserFn: _parserFnMutationSetDateIdeaStatus,
       );

  final OnMutationCompletedMutationSetDateIdeaStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetDateIdeaStatus
    extends graphql.WatchQueryOptions<MutationSetDateIdeaStatus> {
  WatchOptionsMutationSetDateIdeaStatus({
    String? operationName,
    required VariablesMutationSetDateIdeaStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetDateIdeaStatus? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetDateIdeaStatus',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetDateIdeaStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetDateIdeaStatus,
       );
}

extension ClientExtensionMutationSetDateIdeaStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetDateIdeaStatus>> mutateSetDateIdeaStatus(
    OptionsMutationSetDateIdeaStatus options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetDateIdeaStatus> watchMutationSetDateIdeaStatus(
    WatchOptionsMutationSetDateIdeaStatus options,
  ) => this.watchMutation(options);
}

class MutationSetDateIdeaStatusupdateSavedDateIdeasCollection {
  MutationSetDateIdeaStatusupdateSavedDateIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'SavedDateIdeasUpdateResponse',
  });

  factory MutationSetDateIdeaStatusupdateSavedDateIdeasCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetDateIdeaStatusupdateSavedDateIdeasCollection(
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
    if (other is! MutationSetDateIdeaStatusupdateSavedDateIdeasCollection ||
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
