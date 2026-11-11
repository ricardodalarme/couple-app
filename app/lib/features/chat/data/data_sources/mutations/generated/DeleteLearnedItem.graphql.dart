// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteLearnedItem {
  factory VariablesMutationDeleteLearnedItem({required String id}) =>
      VariablesMutationDeleteLearnedItem._({r'id': id});

  VariablesMutationDeleteLearnedItem._(this._$data);

  factory VariablesMutationDeleteLearnedItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteLearnedItem._(result$data);
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
    if (other is! VariablesMutationDeleteLearnedItem || runtimeType != other.runtimeType) {
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

class MutationDeleteLearnedItem {
  MutationDeleteLearnedItem({
    required this.deleteFromLearnedItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteLearnedItem.fromJson(Map<String, dynamic> json) {
    final l$deleteFromLearnedItemsCollection = json['deleteFromLearnedItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteLearnedItem(
      deleteFromLearnedItemsCollection:
          MutationDeleteLearnedItemdeleteFromLearnedItemsCollection.fromJson(
            (l$deleteFromLearnedItemsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteLearnedItemdeleteFromLearnedItemsCollection deleteFromLearnedItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromLearnedItemsCollection = deleteFromLearnedItemsCollection;
    _resultData['deleteFromLearnedItemsCollection'] = l$deleteFromLearnedItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromLearnedItemsCollection = deleteFromLearnedItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromLearnedItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteLearnedItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromLearnedItemsCollection = deleteFromLearnedItemsCollection;
    final lOther$deleteFromLearnedItemsCollection = other.deleteFromLearnedItemsCollection;
    if (l$deleteFromLearnedItemsCollection != lOther$deleteFromLearnedItemsCollection) {
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

const documentNodeMutationDeleteLearnedItem = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteLearnedItem'),
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
            name: NameNode(value: 'deleteFromLearnedItemsCollection'),
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
MutationDeleteLearnedItem _parserFnMutationDeleteLearnedItem(Map<String, dynamic> data) =>
    MutationDeleteLearnedItem.fromJson(data);
typedef OnMutationCompletedMutationDeleteLearnedItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteLearnedItem?,
);

class OptionsMutationDeleteLearnedItem extends graphql.MutationOptions<MutationDeleteLearnedItem> {
  OptionsMutationDeleteLearnedItem({
    String? operationName,
    required VariablesMutationDeleteLearnedItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteLearnedItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteLearnedItem? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteLearnedItem>? update,
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
                 data == null ? null : _parserFnMutationDeleteLearnedItem(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteLearnedItem,
         parserFn: _parserFnMutationDeleteLearnedItem,
       );

  final OnMutationCompletedMutationDeleteLearnedItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteLearnedItem
    extends graphql.WatchQueryOptions<MutationDeleteLearnedItem> {
  WatchOptionsMutationDeleteLearnedItem({
    String? operationName,
    required VariablesMutationDeleteLearnedItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteLearnedItem? typedOptimisticResult,
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
         document: documentNodeMutationDeleteLearnedItem,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteLearnedItem,
       );
}

extension ClientExtensionMutationDeleteLearnedItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteLearnedItem>> mutateDeleteLearnedItem(
    OptionsMutationDeleteLearnedItem options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteLearnedItem> watchMutationDeleteLearnedItem(
    WatchOptionsMutationDeleteLearnedItem options,
  ) => this.watchMutation(options);
}

class MutationDeleteLearnedItemdeleteFromLearnedItemsCollection {
  MutationDeleteLearnedItemdeleteFromLearnedItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LearnedItemsDeleteResponse',
  });

  factory MutationDeleteLearnedItemdeleteFromLearnedItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteLearnedItemdeleteFromLearnedItemsCollection(
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
    if (other is! MutationDeleteLearnedItemdeleteFromLearnedItemsCollection ||
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
