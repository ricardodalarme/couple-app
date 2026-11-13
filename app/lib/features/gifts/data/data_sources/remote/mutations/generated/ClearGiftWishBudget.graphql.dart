// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationClearGiftWishBudget {
  factory VariablesMutationClearGiftWishBudget({required String id}) =>
      VariablesMutationClearGiftWishBudget._({r'id': id});

  VariablesMutationClearGiftWishBudget._(this._$data);

  factory VariablesMutationClearGiftWishBudget.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationClearGiftWishBudget._(result$data);
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
    if (other is! VariablesMutationClearGiftWishBudget || runtimeType != other.runtimeType) {
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

class MutationClearGiftWishBudget {
  MutationClearGiftWishBudget({
    required this.updateGiftIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationClearGiftWishBudget.fromJson(Map<String, dynamic> json) {
    final l$updateGiftIdeasCollection = json['updateGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationClearGiftWishBudget(
      updateGiftIdeasCollection: MutationClearGiftWishBudgetupdateGiftIdeasCollection.fromJson(
        (l$updateGiftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationClearGiftWishBudgetupdateGiftIdeasCollection updateGiftIdeasCollection;

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
    if (other is! MutationClearGiftWishBudget || runtimeType != other.runtimeType) {
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

const documentNodeMutationClearGiftWishBudget = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ClearGiftWishBudget'),
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
            name: NameNode(value: 'updateGiftIdeasCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'budget'),
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
MutationClearGiftWishBudget _parserFnMutationClearGiftWishBudget(Map<String, dynamic> data) =>
    MutationClearGiftWishBudget.fromJson(data);
typedef OnMutationCompletedMutationClearGiftWishBudget = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationClearGiftWishBudget?,
);

class OptionsMutationClearGiftWishBudget
    extends graphql.MutationOptions<MutationClearGiftWishBudget> {
  OptionsMutationClearGiftWishBudget({
    String? operationName,
    required VariablesMutationClearGiftWishBudget variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearGiftWishBudget? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationClearGiftWishBudget? onCompleted,
    graphql.OnMutationUpdate<MutationClearGiftWishBudget>? update,
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
                 data == null ? null : _parserFnMutationClearGiftWishBudget(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationClearGiftWishBudget,
         parserFn: _parserFnMutationClearGiftWishBudget,
       );

  final OnMutationCompletedMutationClearGiftWishBudget? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationClearGiftWishBudget
    extends graphql.WatchQueryOptions<MutationClearGiftWishBudget> {
  WatchOptionsMutationClearGiftWishBudget({
    String? operationName,
    required VariablesMutationClearGiftWishBudget variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearGiftWishBudget? typedOptimisticResult,
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
         document: documentNodeMutationClearGiftWishBudget,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationClearGiftWishBudget,
       );
}

extension ClientExtensionMutationClearGiftWishBudget on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationClearGiftWishBudget>> mutateClearGiftWishBudget(
    OptionsMutationClearGiftWishBudget options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationClearGiftWishBudget> watchMutationClearGiftWishBudget(
    WatchOptionsMutationClearGiftWishBudget options,
  ) => this.watchMutation(options);
}

class MutationClearGiftWishBudgetupdateGiftIdeasCollection {
  MutationClearGiftWishBudgetupdateGiftIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'GiftIdeasUpdateResponse',
  });

  factory MutationClearGiftWishBudgetupdateGiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationClearGiftWishBudgetupdateGiftIdeasCollection(
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
    if (other is! MutationClearGiftWishBudgetupdateGiftIdeasCollection ||
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
