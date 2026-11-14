// dart format width=100
import '../../fragments/generated/ListItemFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationReorderListItems {
  factory VariablesMutationReorderListItems({
    required String listId,
    required List<String> itemIds,
  }) => VariablesMutationReorderListItems._({r'listId': listId, r'itemIds': itemIds});

  VariablesMutationReorderListItems._(this._$data);

  factory VariablesMutationReorderListItems.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$listId = data['listId'];
    result$data['listId'] = (l$listId as String);
    final l$itemIds = data['itemIds'];
    result$data['itemIds'] = (l$itemIds as List<dynamic>).map((e) => (e as String)).toList();
    return VariablesMutationReorderListItems._(result$data);
  }

  Map<String, dynamic> _$data;

  String get listId => (_$data['listId'] as String);

  List<String> get itemIds => (_$data['itemIds'] as List<String>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$listId = listId;
    result$data['listId'] = l$listId;
    final l$itemIds = itemIds;
    result$data['itemIds'] = l$itemIds.map((e) => e).toList();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationReorderListItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$listId = listId;
    final lOther$listId = other.listId;
    if (l$listId != lOther$listId) {
      return false;
    }
    final l$itemIds = itemIds;
    final lOther$itemIds = other.itemIds;
    if (l$itemIds.length != lOther$itemIds.length) {
      return false;
    }
    for (int i = 0; i < l$itemIds.length; i++) {
      final l$itemIds$entry = l$itemIds[i];
      final lOther$itemIds$entry = lOther$itemIds[i];
      if (l$itemIds$entry != lOther$itemIds$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$listId = listId;
    final l$itemIds = itemIds;
    return Object.hashAll([l$listId, Object.hashAll(l$itemIds.map((v) => v))]);
  }
}

class MutationReorderListItems {
  MutationReorderListItems({this.reorderListItems, this.$__typename = 'Mutation'});

  factory MutationReorderListItems.fromJson(Map<String, dynamic> json) {
    final l$reorderListItems = json['reorderListItems'];
    final l$$__typename = json['__typename'];
    return MutationReorderListItems(
      reorderListItems: l$reorderListItems == null
          ? null
          : MutationReorderListItemsreorderListItems.fromJson(
              (l$reorderListItems as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationReorderListItemsreorderListItems? reorderListItems;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reorderListItems = reorderListItems;
    _resultData['reorderListItems'] = l$reorderListItems?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reorderListItems = reorderListItems;
    final l$$__typename = $__typename;
    return Object.hashAll([l$reorderListItems, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationReorderListItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$reorderListItems = reorderListItems;
    final lOther$reorderListItems = other.reorderListItems;
    if (l$reorderListItems != lOther$reorderListItems) {
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

const documentNodeMutationReorderListItems = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ReorderListItems'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'listId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'itemIds')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'reorderListItems'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'listId'),
                value: VariableNode(name: NameNode(value: 'listId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'itemIds'),
                value: VariableNode(name: NameNode(value: 'itemIds')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FragmentSpreadNode(
                              name: NameNode(value: 'ListItemFragment'),
                              directives: [],
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
    fragmentDefinitionListItemFragment,
  ],
);
MutationReorderListItems _parserFnMutationReorderListItems(Map<String, dynamic> data) =>
    MutationReorderListItems.fromJson(data);
typedef OnMutationCompletedMutationReorderListItems = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationReorderListItems?,
);

class OptionsMutationReorderListItems extends graphql.MutationOptions<MutationReorderListItems> {
  OptionsMutationReorderListItems({
    String? operationName,
    required VariablesMutationReorderListItems variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationReorderListItems? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationReorderListItems? onCompleted,
    graphql.OnMutationUpdate<MutationReorderListItems>? update,
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
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationReorderListItems(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationReorderListItems,
         parserFn: _parserFnMutationReorderListItems,
       );

  final OnMutationCompletedMutationReorderListItems? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationReorderListItems
    extends graphql.WatchQueryOptions<MutationReorderListItems> {
  WatchOptionsMutationReorderListItems({
    String? operationName,
    required VariablesMutationReorderListItems variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationReorderListItems? typedOptimisticResult,
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
         document: documentNodeMutationReorderListItems,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationReorderListItems,
       );
}

extension ClientExtensionMutationReorderListItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationReorderListItems>> mutateReorderListItems(
    OptionsMutationReorderListItems options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationReorderListItems> watchMutationReorderListItems(
    WatchOptionsMutationReorderListItems options,
  ) => this.watchMutation(options);
}

class MutationReorderListItemsreorderListItems {
  MutationReorderListItemsreorderListItems({
    required this.edges,
    this.$__typename = 'ListItemsConnection',
  });

  factory MutationReorderListItemsreorderListItems.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return MutationReorderListItemsreorderListItems(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                MutationReorderListItemsreorderListItemsedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationReorderListItemsreorderListItemsedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationReorderListItemsreorderListItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class MutationReorderListItemsreorderListItemsedges {
  MutationReorderListItemsreorderListItemsedges({
    required this.node,
    this.$__typename = 'ListItemsEdge',
  });

  factory MutationReorderListItemsreorderListItemsedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return MutationReorderListItemsreorderListItemsedges(
      node: FragmentListItemFragment.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentListItemFragment node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationReorderListItemsreorderListItemsedges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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
