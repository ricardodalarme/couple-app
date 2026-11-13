// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateLearnedItem {
  factory VariablesMutationUpdateLearnedItem({required String id, required String text}) =>
      VariablesMutationUpdateLearnedItem._({r'id': id, r'text': text});

  VariablesMutationUpdateLearnedItem._(this._$data);

  factory VariablesMutationUpdateLearnedItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$text = data['text'];
    result$data['text'] = (l$text as String);
    return VariablesMutationUpdateLearnedItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get text => (_$data['text'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$text = text;
    result$data['text'] = l$text;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateLearnedItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    return Object.hashAll([l$id, l$text]);
  }
}

class MutationUpdateLearnedItem {
  MutationUpdateLearnedItem({
    required this.updateLearnedItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateLearnedItem.fromJson(Map<String, dynamic> json) {
    final l$updateLearnedItemsCollection = json['updateLearnedItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateLearnedItem(
      updateLearnedItemsCollection: MutationUpdateLearnedItemupdateLearnedItemsCollection.fromJson(
        (l$updateLearnedItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateLearnedItemupdateLearnedItemsCollection updateLearnedItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLearnedItemsCollection = updateLearnedItemsCollection;
    _resultData['updateLearnedItemsCollection'] = l$updateLearnedItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLearnedItemsCollection = updateLearnedItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateLearnedItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateLearnedItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLearnedItemsCollection = updateLearnedItemsCollection;
    final lOther$updateLearnedItemsCollection = other.updateLearnedItemsCollection;
    if (l$updateLearnedItemsCollection != lOther$updateLearnedItemsCollection) {
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

const documentNodeMutationUpdateLearnedItem = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateLearnedItem'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'text')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateLearnedItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'text'),
                      value: VariableNode(name: NameNode(value: 'text')),
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
MutationUpdateLearnedItem _parserFnMutationUpdateLearnedItem(Map<String, dynamic> data) =>
    MutationUpdateLearnedItem.fromJson(data);
typedef OnMutationCompletedMutationUpdateLearnedItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateLearnedItem?,
);

class OptionsMutationUpdateLearnedItem extends graphql.MutationOptions<MutationUpdateLearnedItem> {
  OptionsMutationUpdateLearnedItem({
    String? operationName,
    required VariablesMutationUpdateLearnedItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateLearnedItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateLearnedItem? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateLearnedItem>? update,
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
                 data == null ? null : _parserFnMutationUpdateLearnedItem(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateLearnedItem,
         parserFn: _parserFnMutationUpdateLearnedItem,
       );

  final OnMutationCompletedMutationUpdateLearnedItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateLearnedItem
    extends graphql.WatchQueryOptions<MutationUpdateLearnedItem> {
  WatchOptionsMutationUpdateLearnedItem({
    String? operationName,
    required VariablesMutationUpdateLearnedItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateLearnedItem? typedOptimisticResult,
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
         document: documentNodeMutationUpdateLearnedItem,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateLearnedItem,
       );
}

extension ClientExtensionMutationUpdateLearnedItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateLearnedItem>> mutateUpdateLearnedItem(
    OptionsMutationUpdateLearnedItem options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateLearnedItem> watchMutationUpdateLearnedItem(
    WatchOptionsMutationUpdateLearnedItem options,
  ) => this.watchMutation(options);
}

class MutationUpdateLearnedItemupdateLearnedItemsCollection {
  MutationUpdateLearnedItemupdateLearnedItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LearnedItemsUpdateResponse',
  });

  factory MutationUpdateLearnedItemupdateLearnedItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateLearnedItemupdateLearnedItemsCollection(
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
    if (other is! MutationUpdateLearnedItemupdateLearnedItemsCollection ||
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

class VariablesMutationSetLearnedItemStatus {
  factory VariablesMutationSetLearnedItemStatus({required String id, required String status}) =>
      VariablesMutationSetLearnedItemStatus._({r'id': id, r'status': status});

  VariablesMutationSetLearnedItemStatus._(this._$data);

  factory VariablesMutationSetLearnedItemStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$status = data['status'];
    result$data['status'] = (l$status as String);
    return VariablesMutationSetLearnedItemStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get status => (_$data['status'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$status = status;
    result$data['status'] = l$status;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetLearnedItemStatus || runtimeType != other.runtimeType) {
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

class MutationSetLearnedItemStatus {
  MutationSetLearnedItemStatus({
    required this.updateLearnedItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetLearnedItemStatus.fromJson(Map<String, dynamic> json) {
    final l$updateLearnedItemsCollection = json['updateLearnedItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetLearnedItemStatus(
      updateLearnedItemsCollection:
          MutationSetLearnedItemStatusupdateLearnedItemsCollection.fromJson(
            (l$updateLearnedItemsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetLearnedItemStatusupdateLearnedItemsCollection updateLearnedItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLearnedItemsCollection = updateLearnedItemsCollection;
    _resultData['updateLearnedItemsCollection'] = l$updateLearnedItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLearnedItemsCollection = updateLearnedItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateLearnedItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetLearnedItemStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLearnedItemsCollection = updateLearnedItemsCollection;
    final lOther$updateLearnedItemsCollection = other.updateLearnedItemsCollection;
    if (l$updateLearnedItemsCollection != lOther$updateLearnedItemsCollection) {
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

const documentNodeMutationSetLearnedItemStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetLearnedItemStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateLearnedItemsCollection'),
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
MutationSetLearnedItemStatus _parserFnMutationSetLearnedItemStatus(Map<String, dynamic> data) =>
    MutationSetLearnedItemStatus.fromJson(data);
typedef OnMutationCompletedMutationSetLearnedItemStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetLearnedItemStatus?,
);

class OptionsMutationSetLearnedItemStatus
    extends graphql.MutationOptions<MutationSetLearnedItemStatus> {
  OptionsMutationSetLearnedItemStatus({
    String? operationName,
    required VariablesMutationSetLearnedItemStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetLearnedItemStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetLearnedItemStatus? onCompleted,
    graphql.OnMutationUpdate<MutationSetLearnedItemStatus>? update,
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
                 data == null ? null : _parserFnMutationSetLearnedItemStatus(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetLearnedItemStatus,
         parserFn: _parserFnMutationSetLearnedItemStatus,
       );

  final OnMutationCompletedMutationSetLearnedItemStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetLearnedItemStatus
    extends graphql.WatchQueryOptions<MutationSetLearnedItemStatus> {
  WatchOptionsMutationSetLearnedItemStatus({
    String? operationName,
    required VariablesMutationSetLearnedItemStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetLearnedItemStatus? typedOptimisticResult,
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
         document: documentNodeMutationSetLearnedItemStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetLearnedItemStatus,
       );
}

extension ClientExtensionMutationSetLearnedItemStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetLearnedItemStatus>> mutateSetLearnedItemStatus(
    OptionsMutationSetLearnedItemStatus options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetLearnedItemStatus> watchMutationSetLearnedItemStatus(
    WatchOptionsMutationSetLearnedItemStatus options,
  ) => this.watchMutation(options);
}

class MutationSetLearnedItemStatusupdateLearnedItemsCollection {
  MutationSetLearnedItemStatusupdateLearnedItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LearnedItemsUpdateResponse',
  });

  factory MutationSetLearnedItemStatusupdateLearnedItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetLearnedItemStatusupdateLearnedItemsCollection(
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
    if (other is! MutationSetLearnedItemStatusupdateLearnedItemsCollection ||
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
