// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteListItem {
  factory VariablesMutationDeleteListItem({required String id}) =>
      VariablesMutationDeleteListItem._({r'id': id});

  VariablesMutationDeleteListItem._(this._$data);

  factory VariablesMutationDeleteListItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteListItem._(result$data);
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
    if (other is! VariablesMutationDeleteListItem || runtimeType != other.runtimeType) {
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

class MutationDeleteListItem {
  MutationDeleteListItem({
    required this.deleteFromListItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteListItem.fromJson(Map<String, dynamic> json) {
    final l$deleteFromListItemsCollection = json['deleteFromListItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteListItem(
      deleteFromListItemsCollection: MutationDeleteListItemdeleteFromListItemsCollection.fromJson(
        (l$deleteFromListItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteListItemdeleteFromListItemsCollection deleteFromListItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromListItemsCollection = deleteFromListItemsCollection;
    _resultData['deleteFromListItemsCollection'] = l$deleteFromListItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromListItemsCollection = deleteFromListItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromListItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteListItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromListItemsCollection = deleteFromListItemsCollection;
    final lOther$deleteFromListItemsCollection = other.deleteFromListItemsCollection;
    if (l$deleteFromListItemsCollection != lOther$deleteFromListItemsCollection) {
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

const documentNodeMutationDeleteListItem = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteListItem'),
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
            name: NameNode(value: 'deleteFromListItemsCollection'),
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
MutationDeleteListItem _parserFnMutationDeleteListItem(Map<String, dynamic> data) =>
    MutationDeleteListItem.fromJson(data);
typedef OnMutationCompletedMutationDeleteListItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteListItem?,
);

class OptionsMutationDeleteListItem extends graphql.MutationOptions<MutationDeleteListItem> {
  OptionsMutationDeleteListItem({
    String? operationName,
    required VariablesMutationDeleteListItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteListItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteListItem? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteListItem>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteListItem',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteListItem(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteListItem,
         parserFn: _parserFnMutationDeleteListItem,
       );

  final OnMutationCompletedMutationDeleteListItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteListItem extends graphql.WatchQueryOptions<MutationDeleteListItem> {
  WatchOptionsMutationDeleteListItem({
    String? operationName,
    required VariablesMutationDeleteListItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteListItem? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteListItem',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteListItem,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteListItem,
       );
}

extension ClientExtensionMutationDeleteListItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteListItem>> mutateDeleteListItem(
    OptionsMutationDeleteListItem options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteListItem> watchMutationDeleteListItem(
    WatchOptionsMutationDeleteListItem options,
  ) => this.watchMutation(options);
}

class MutationDeleteListItemdeleteFromListItemsCollection {
  MutationDeleteListItemdeleteFromListItemsCollection({
    required this.affectedCount,
    this.$__typename = 'ListItemsDeleteResponse',
  });

  factory MutationDeleteListItemdeleteFromListItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteListItemdeleteFromListItemsCollection(
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
    if (other is! MutationDeleteListItemdeleteFromListItemsCollection ||
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
