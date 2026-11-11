// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationClearGiftWishVisibility {
  factory VariablesMutationClearGiftWishVisibility({required String id}) =>
      VariablesMutationClearGiftWishVisibility._({r'id': id});

  VariablesMutationClearGiftWishVisibility._(this._$data);

  factory VariablesMutationClearGiftWishVisibility.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationClearGiftWishVisibility._(result$data);
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
    if (other is! VariablesMutationClearGiftWishVisibility || runtimeType != other.runtimeType) {
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

class MutationClearGiftWishVisibility {
  MutationClearGiftWishVisibility({
    required this.updateGiftIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationClearGiftWishVisibility.fromJson(Map<String, dynamic> json) {
    final l$updateGiftIdeasCollection = json['updateGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationClearGiftWishVisibility(
      updateGiftIdeasCollection: MutationClearGiftWishVisibilityupdateGiftIdeasCollection.fromJson(
        (l$updateGiftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationClearGiftWishVisibilityupdateGiftIdeasCollection updateGiftIdeasCollection;

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
    if (other is! MutationClearGiftWishVisibility || runtimeType != other.runtimeType) {
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

const documentNodeMutationClearGiftWishVisibility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ClearGiftWishVisibility'),
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
                      name: NameNode(value: 'coupleId'),
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
MutationClearGiftWishVisibility _parserFnMutationClearGiftWishVisibility(
  Map<String, dynamic> data,
) => MutationClearGiftWishVisibility.fromJson(data);
typedef OnMutationCompletedMutationClearGiftWishVisibility = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationClearGiftWishVisibility?,
);

class OptionsMutationClearGiftWishVisibility
    extends graphql.MutationOptions<MutationClearGiftWishVisibility> {
  OptionsMutationClearGiftWishVisibility({
    String? operationName,
    required VariablesMutationClearGiftWishVisibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearGiftWishVisibility? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationClearGiftWishVisibility? onCompleted,
    graphql.OnMutationUpdate<MutationClearGiftWishVisibility>? update,
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
                 data == null ? null : _parserFnMutationClearGiftWishVisibility(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationClearGiftWishVisibility,
         parserFn: _parserFnMutationClearGiftWishVisibility,
       );

  final OnMutationCompletedMutationClearGiftWishVisibility? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationClearGiftWishVisibility
    extends graphql.WatchQueryOptions<MutationClearGiftWishVisibility> {
  WatchOptionsMutationClearGiftWishVisibility({
    String? operationName,
    required VariablesMutationClearGiftWishVisibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearGiftWishVisibility? typedOptimisticResult,
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
         document: documentNodeMutationClearGiftWishVisibility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationClearGiftWishVisibility,
       );
}

extension ClientExtensionMutationClearGiftWishVisibility on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationClearGiftWishVisibility>> mutateClearGiftWishVisibility(
    OptionsMutationClearGiftWishVisibility options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationClearGiftWishVisibility> watchMutationClearGiftWishVisibility(
    WatchOptionsMutationClearGiftWishVisibility options,
  ) => this.watchMutation(options);
}

class MutationClearGiftWishVisibilityupdateGiftIdeasCollection {
  MutationClearGiftWishVisibilityupdateGiftIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'GiftIdeasUpdateResponse',
  });

  factory MutationClearGiftWishVisibilityupdateGiftIdeasCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationClearGiftWishVisibilityupdateGiftIdeasCollection(
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
    if (other is! MutationClearGiftWishVisibilityupdateGiftIdeasCollection ||
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
