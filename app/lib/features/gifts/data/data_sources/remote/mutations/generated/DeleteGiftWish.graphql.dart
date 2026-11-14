// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteGiftWish {
  factory VariablesMutationDeleteGiftWish({required String id}) =>
      VariablesMutationDeleteGiftWish._({r'id': id});

  VariablesMutationDeleteGiftWish._(this._$data);

  factory VariablesMutationDeleteGiftWish.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteGiftWish._(result$data);
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
    if (other is! VariablesMutationDeleteGiftWish || runtimeType != other.runtimeType) {
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

class MutationDeleteGiftWish {
  MutationDeleteGiftWish({
    required this.deleteFromGiftIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteGiftWish.fromJson(Map<String, dynamic> json) {
    final l$deleteFromGiftIdeasCollection = json['deleteFromGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteGiftWish(
      deleteFromGiftIdeasCollection: MutationDeleteGiftWishdeleteFromGiftIdeasCollection.fromJson(
        (l$deleteFromGiftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteGiftWishdeleteFromGiftIdeasCollection deleteFromGiftIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromGiftIdeasCollection = deleteFromGiftIdeasCollection;
    _resultData['deleteFromGiftIdeasCollection'] = l$deleteFromGiftIdeasCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromGiftIdeasCollection = deleteFromGiftIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromGiftIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteGiftWish || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromGiftIdeasCollection = deleteFromGiftIdeasCollection;
    final lOther$deleteFromGiftIdeasCollection = other.deleteFromGiftIdeasCollection;
    if (l$deleteFromGiftIdeasCollection != lOther$deleteFromGiftIdeasCollection) {
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

const documentNodeMutationDeleteGiftWish = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteGiftWish'),
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
            name: NameNode(value: 'deleteFromGiftIdeasCollection'),
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
MutationDeleteGiftWish _parserFnMutationDeleteGiftWish(Map<String, dynamic> data) =>
    MutationDeleteGiftWish.fromJson(data);
typedef OnMutationCompletedMutationDeleteGiftWish = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteGiftWish?,
);

class OptionsMutationDeleteGiftWish extends graphql.MutationOptions<MutationDeleteGiftWish> {
  OptionsMutationDeleteGiftWish({
    String? operationName,
    required VariablesMutationDeleteGiftWish variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteGiftWish? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteGiftWish? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteGiftWish>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteGiftWish',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteGiftWish(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteGiftWish,
         parserFn: _parserFnMutationDeleteGiftWish,
       );

  final OnMutationCompletedMutationDeleteGiftWish? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteGiftWish extends graphql.WatchQueryOptions<MutationDeleteGiftWish> {
  WatchOptionsMutationDeleteGiftWish({
    String? operationName,
    required VariablesMutationDeleteGiftWish variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteGiftWish? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteGiftWish',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteGiftWish,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteGiftWish,
       );
}

extension ClientExtensionMutationDeleteGiftWish on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteGiftWish>> mutateDeleteGiftWish(
    OptionsMutationDeleteGiftWish options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteGiftWish> watchMutationDeleteGiftWish(
    WatchOptionsMutationDeleteGiftWish options,
  ) => this.watchMutation(options);
}

class MutationDeleteGiftWishdeleteFromGiftIdeasCollection {
  MutationDeleteGiftWishdeleteFromGiftIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'GiftIdeasDeleteResponse',
  });

  factory MutationDeleteGiftWishdeleteFromGiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteGiftWishdeleteFromGiftIdeasCollection(
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
    if (other is! MutationDeleteGiftWishdeleteFromGiftIdeasCollection ||
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
