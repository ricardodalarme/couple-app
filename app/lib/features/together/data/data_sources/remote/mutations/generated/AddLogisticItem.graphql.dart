// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddLogisticItem {
  factory VariablesMutationAddLogisticItem({
    required String id,
    required String title,
    String? assigneeId,
    String? coupleId,
  }) => VariablesMutationAddLogisticItem._({
    r'id': id,
    r'title': title,
    if (assigneeId != null) r'assigneeId': assigneeId,
    if (coupleId != null) r'coupleId': coupleId,
  });

  VariablesMutationAddLogisticItem._(this._$data);

  factory VariablesMutationAddLogisticItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    if (data.containsKey('assigneeId')) {
      final l$assigneeId = data['assigneeId'];
      result$data['assigneeId'] = (l$assigneeId as String?);
    }
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationAddLogisticItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get title => (_$data['title'] as String);

  String? get assigneeId => (_$data['assigneeId'] as String?);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$title = title;
    result$data['title'] = l$title;
    if (_$data.containsKey('assigneeId')) {
      final l$assigneeId = assigneeId;
      result$data['assigneeId'] = l$assigneeId;
    }
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddLogisticItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$assigneeId = assigneeId;
    final lOther$assigneeId = other.assigneeId;
    if (_$data.containsKey('assigneeId') != other._$data.containsKey('assigneeId')) {
      return false;
    }
    if (l$assigneeId != lOther$assigneeId) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (_$data.containsKey('coupleId') != other._$data.containsKey('coupleId')) {
      return false;
    }
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$assigneeId = assigneeId;
    final l$coupleId = coupleId;
    return Object.hashAll([
      l$id,
      l$title,
      _$data.containsKey('assigneeId') ? l$assigneeId : const {},
      _$data.containsKey('coupleId') ? l$coupleId : const {},
    ]);
  }
}

class MutationAddLogisticItem {
  MutationAddLogisticItem({this.insertIntoLogisticItemsCollection, this.$__typename = 'Mutation'});

  factory MutationAddLogisticItem.fromJson(Map<String, dynamic> json) {
    final l$insertIntoLogisticItemsCollection = json['insertIntoLogisticItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddLogisticItem(
      insertIntoLogisticItemsCollection: l$insertIntoLogisticItemsCollection == null
          ? null
          : MutationAddLogisticIteminsertIntoLogisticItemsCollection.fromJson(
              (l$insertIntoLogisticItemsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddLogisticIteminsertIntoLogisticItemsCollection? insertIntoLogisticItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoLogisticItemsCollection = insertIntoLogisticItemsCollection;
    _resultData['insertIntoLogisticItemsCollection'] = l$insertIntoLogisticItemsCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoLogisticItemsCollection = insertIntoLogisticItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoLogisticItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddLogisticItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoLogisticItemsCollection = insertIntoLogisticItemsCollection;
    final lOther$insertIntoLogisticItemsCollection = other.insertIntoLogisticItemsCollection;
    if (l$insertIntoLogisticItemsCollection != lOther$insertIntoLogisticItemsCollection) {
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

const documentNodeMutationAddLogisticItem = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddLogisticItem'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
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
          variable: VariableNode(name: NameNode(value: 'assigneeId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoLogisticItemsCollection'),
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
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'assigneeId'),
                          value: VariableNode(name: NameNode(value: 'assigneeId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
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
MutationAddLogisticItem _parserFnMutationAddLogisticItem(Map<String, dynamic> data) =>
    MutationAddLogisticItem.fromJson(data);
typedef OnMutationCompletedMutationAddLogisticItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddLogisticItem?,
);

class OptionsMutationAddLogisticItem extends graphql.MutationOptions<MutationAddLogisticItem> {
  OptionsMutationAddLogisticItem({
    String? operationName,
    required VariablesMutationAddLogisticItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddLogisticItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddLogisticItem? onCompleted,
    graphql.OnMutationUpdate<MutationAddLogisticItem>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationAddLogisticItem(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddLogisticItem,
         parserFn: _parserFnMutationAddLogisticItem,
       );

  final OnMutationCompletedMutationAddLogisticItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddLogisticItem
    extends graphql.WatchQueryOptions<MutationAddLogisticItem> {
  WatchOptionsMutationAddLogisticItem({
    String? operationName,
    required VariablesMutationAddLogisticItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddLogisticItem? typedOptimisticResult,
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
         document: documentNodeMutationAddLogisticItem,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddLogisticItem,
       );
}

extension ClientExtensionMutationAddLogisticItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddLogisticItem>> mutateAddLogisticItem(
    OptionsMutationAddLogisticItem options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddLogisticItem> watchMutationAddLogisticItem(
    WatchOptionsMutationAddLogisticItem options,
  ) => this.watchMutation(options);
}

class MutationAddLogisticIteminsertIntoLogisticItemsCollection {
  MutationAddLogisticIteminsertIntoLogisticItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LogisticItemsInsertResponse',
  });

  factory MutationAddLogisticIteminsertIntoLogisticItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddLogisticIteminsertIntoLogisticItemsCollection(
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
    if (other is! MutationAddLogisticIteminsertIntoLogisticItemsCollection ||
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
