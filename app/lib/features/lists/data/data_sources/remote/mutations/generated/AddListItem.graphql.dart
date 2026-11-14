// dart format width=100
import '../../fragments/generated/ListItemFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddListItem {
  factory VariablesMutationAddListItem({
    required String id,
    required String listId,
    required String title,
    required int position,
  }) => VariablesMutationAddListItem._({
    r'id': id,
    r'listId': listId,
    r'title': title,
    r'position': position,
  });

  VariablesMutationAddListItem._(this._$data);

  factory VariablesMutationAddListItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$listId = data['listId'];
    result$data['listId'] = (l$listId as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$position = data['position'];
    result$data['position'] = (l$position as int);
    return VariablesMutationAddListItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get listId => (_$data['listId'] as String);

  String get title => (_$data['title'] as String);

  int get position => (_$data['position'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$listId = listId;
    result$data['listId'] = l$listId;
    final l$title = title;
    result$data['title'] = l$title;
    final l$position = position;
    result$data['position'] = l$position;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddListItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$listId = listId;
    final lOther$listId = other.listId;
    if (l$listId != lOther$listId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$listId = listId;
    final l$title = title;
    final l$position = position;
    return Object.hashAll([l$id, l$listId, l$title, l$position]);
  }
}

class MutationAddListItem {
  MutationAddListItem({this.insertIntoListItemsCollection, this.$__typename = 'Mutation'});

  factory MutationAddListItem.fromJson(Map<String, dynamic> json) {
    final l$insertIntoListItemsCollection = json['insertIntoListItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddListItem(
      insertIntoListItemsCollection: l$insertIntoListItemsCollection == null
          ? null
          : MutationAddListIteminsertIntoListItemsCollection.fromJson(
              (l$insertIntoListItemsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddListIteminsertIntoListItemsCollection? insertIntoListItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoListItemsCollection = insertIntoListItemsCollection;
    _resultData['insertIntoListItemsCollection'] = l$insertIntoListItemsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoListItemsCollection = insertIntoListItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoListItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddListItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoListItemsCollection = insertIntoListItemsCollection;
    final lOther$insertIntoListItemsCollection = other.insertIntoListItemsCollection;
    if (l$insertIntoListItemsCollection != lOther$insertIntoListItemsCollection) {
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

const documentNodeMutationAddListItem = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddListItem'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'listId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'position')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoListItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'listId'),
                          value: VariableNode(name: NameNode(value: 'listId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'position'),
                          value: VariableNode(name: NameNode(value: 'position')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'status'),
                          value: EnumValueNode(name: NameNode(value: 'dream')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'records'),
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
    fragmentDefinitionListItemFragment,
  ],
);
MutationAddListItem _parserFnMutationAddListItem(Map<String, dynamic> data) =>
    MutationAddListItem.fromJson(data);
typedef OnMutationCompletedMutationAddListItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddListItem?,
);

class OptionsMutationAddListItem extends graphql.MutationOptions<MutationAddListItem> {
  OptionsMutationAddListItem({
    String? operationName,
    required VariablesMutationAddListItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddListItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddListItem? onCompleted,
    graphql.OnMutationUpdate<MutationAddListItem>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationAddListItem(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddListItem,
         parserFn: _parserFnMutationAddListItem,
       );

  final OnMutationCompletedMutationAddListItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddListItem extends graphql.WatchQueryOptions<MutationAddListItem> {
  WatchOptionsMutationAddListItem({
    String? operationName,
    required VariablesMutationAddListItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddListItem? typedOptimisticResult,
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
         document: documentNodeMutationAddListItem,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddListItem,
       );
}

extension ClientExtensionMutationAddListItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddListItem>> mutateAddListItem(
    OptionsMutationAddListItem options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddListItem> watchMutationAddListItem(
    WatchOptionsMutationAddListItem options,
  ) => this.watchMutation(options);
}

class MutationAddListIteminsertIntoListItemsCollection {
  MutationAddListIteminsertIntoListItemsCollection({
    required this.records,
    this.$__typename = 'ListItemsInsertResponse',
  });

  factory MutationAddListIteminsertIntoListItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationAddListIteminsertIntoListItemsCollection(
      records: (l$records as List<dynamic>)
          .map((e) => FragmentListItemFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<FragmentListItemFragment> records;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$records = records;
    _resultData['records'] = l$records.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$records = records;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$records.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddListIteminsertIntoListItemsCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$records = records;
    final lOther$records = other.records;
    if (l$records.length != lOther$records.length) {
      return false;
    }
    for (int i = 0; i < l$records.length; i++) {
      final l$records$entry = l$records[i];
      final lOther$records$entry = lOther$records[i];
      if (l$records$entry != lOther$records$entry) {
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
