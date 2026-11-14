// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteCapsule {
  factory VariablesMutationDeleteCapsule({required String id}) =>
      VariablesMutationDeleteCapsule._({r'id': id});

  VariablesMutationDeleteCapsule._(this._$data);

  factory VariablesMutationDeleteCapsule.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteCapsule._(result$data);
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
    if (other is! VariablesMutationDeleteCapsule || runtimeType != other.runtimeType) {
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

class MutationDeleteCapsule {
  MutationDeleteCapsule({
    required this.deleteFromCapsulesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteCapsule.fromJson(Map<String, dynamic> json) {
    final l$deleteFromCapsulesCollection = json['deleteFromCapsulesCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteCapsule(
      deleteFromCapsulesCollection: MutationDeleteCapsuledeleteFromCapsulesCollection.fromJson(
        (l$deleteFromCapsulesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteCapsuledeleteFromCapsulesCollection deleteFromCapsulesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromCapsulesCollection = deleteFromCapsulesCollection;
    _resultData['deleteFromCapsulesCollection'] = l$deleteFromCapsulesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromCapsulesCollection = deleteFromCapsulesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromCapsulesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteCapsule || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromCapsulesCollection = deleteFromCapsulesCollection;
    final lOther$deleteFromCapsulesCollection = other.deleteFromCapsulesCollection;
    if (l$deleteFromCapsulesCollection != lOther$deleteFromCapsulesCollection) {
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

const documentNodeMutationDeleteCapsule = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteCapsule'),
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
            name: NameNode(value: 'deleteFromCapsulesCollection'),
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
MutationDeleteCapsule _parserFnMutationDeleteCapsule(Map<String, dynamic> data) =>
    MutationDeleteCapsule.fromJson(data);
typedef OnMutationCompletedMutationDeleteCapsule = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteCapsule?,
);

class OptionsMutationDeleteCapsule extends graphql.MutationOptions<MutationDeleteCapsule> {
  OptionsMutationDeleteCapsule({
    String? operationName,
    required VariablesMutationDeleteCapsule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteCapsule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteCapsule? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteCapsule>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteCapsule',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteCapsule(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteCapsule,
         parserFn: _parserFnMutationDeleteCapsule,
       );

  final OnMutationCompletedMutationDeleteCapsule? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteCapsule extends graphql.WatchQueryOptions<MutationDeleteCapsule> {
  WatchOptionsMutationDeleteCapsule({
    String? operationName,
    required VariablesMutationDeleteCapsule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteCapsule? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteCapsule',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteCapsule,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteCapsule,
       );
}

extension ClientExtensionMutationDeleteCapsule on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteCapsule>> mutateDeleteCapsule(
    OptionsMutationDeleteCapsule options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteCapsule> watchMutationDeleteCapsule(
    WatchOptionsMutationDeleteCapsule options,
  ) => this.watchMutation(options);
}

class MutationDeleteCapsuledeleteFromCapsulesCollection {
  MutationDeleteCapsuledeleteFromCapsulesCollection({
    required this.affectedCount,
    this.$__typename = 'CapsulesDeleteResponse',
  });

  factory MutationDeleteCapsuledeleteFromCapsulesCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteCapsuledeleteFromCapsulesCollection(
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
    if (other is! MutationDeleteCapsuledeleteFromCapsulesCollection ||
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
