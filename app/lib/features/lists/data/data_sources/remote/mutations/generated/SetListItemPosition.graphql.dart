// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetListItemPosition {
  factory VariablesMutationSetListItemPosition({required String id, required int position}) =>
      VariablesMutationSetListItemPosition._({r'id': id, r'position': position});

  VariablesMutationSetListItemPosition._(this._$data);

  factory VariablesMutationSetListItemPosition.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$position = data['position'];
    result$data['position'] = (l$position as int);
    return VariablesMutationSetListItemPosition._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  int get position => (_$data['position'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$position = position;
    result$data['position'] = l$position;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetListItemPosition || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$position = position;
    return Object.hashAll([l$id, l$position]);
  }
}

class MutationSetListItemPosition {
  MutationSetListItemPosition({
    required this.updateListItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetListItemPosition.fromJson(Map<String, dynamic> json) {
    final l$updateListItemsCollection = json['updateListItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetListItemPosition(
      updateListItemsCollection: MutationSetListItemPositionupdateListItemsCollection.fromJson(
        (l$updateListItemsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetListItemPositionupdateListItemsCollection updateListItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateListItemsCollection = updateListItemsCollection;
    _resultData['updateListItemsCollection'] = l$updateListItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateListItemsCollection = updateListItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateListItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetListItemPosition || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateListItemsCollection = updateListItemsCollection;
    final lOther$updateListItemsCollection = other.updateListItemsCollection;
    if (l$updateListItemsCollection != lOther$updateListItemsCollection) {
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

const documentNodeMutationSetListItemPosition = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetListItemPosition'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
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
            name: NameNode(value: 'updateListItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'position'),
                      value: VariableNode(name: NameNode(value: 'position')),
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
MutationSetListItemPosition _parserFnMutationSetListItemPosition(Map<String, dynamic> data) =>
    MutationSetListItemPosition.fromJson(data);
typedef OnMutationCompletedMutationSetListItemPosition = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetListItemPosition?,
);

class OptionsMutationSetListItemPosition
    extends graphql.MutationOptions<MutationSetListItemPosition> {
  OptionsMutationSetListItemPosition({
    String? operationName,
    required VariablesMutationSetListItemPosition variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetListItemPosition? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetListItemPosition? onCompleted,
    graphql.OnMutationUpdate<MutationSetListItemPosition>? update,
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
                 data == null ? null : _parserFnMutationSetListItemPosition(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetListItemPosition,
         parserFn: _parserFnMutationSetListItemPosition,
       );

  final OnMutationCompletedMutationSetListItemPosition? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetListItemPosition
    extends graphql.WatchQueryOptions<MutationSetListItemPosition> {
  WatchOptionsMutationSetListItemPosition({
    String? operationName,
    required VariablesMutationSetListItemPosition variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetListItemPosition? typedOptimisticResult,
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
         document: documentNodeMutationSetListItemPosition,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetListItemPosition,
       );
}

extension ClientExtensionMutationSetListItemPosition on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetListItemPosition>> mutateSetListItemPosition(
    OptionsMutationSetListItemPosition options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetListItemPosition> watchMutationSetListItemPosition(
    WatchOptionsMutationSetListItemPosition options,
  ) => this.watchMutation(options);
}

class MutationSetListItemPositionupdateListItemsCollection {
  MutationSetListItemPositionupdateListItemsCollection({
    required this.affectedCount,
    this.$__typename = 'ListItemsUpdateResponse',
  });

  factory MutationSetListItemPositionupdateListItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetListItemPositionupdateListItemsCollection(
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
    if (other is! MutationSetListItemPositionupdateListItemsCollection ||
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
