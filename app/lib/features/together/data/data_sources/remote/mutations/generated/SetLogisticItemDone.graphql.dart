// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetLogisticItemDone {
  factory VariablesMutationSetLogisticItemDone({required String id, DateTime? doneAt}) =>
      VariablesMutationSetLogisticItemDone._({r'id': id, if (doneAt != null) r'doneAt': doneAt});

  VariablesMutationSetLogisticItemDone._(this._$data);

  factory VariablesMutationSetLogisticItemDone.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('doneAt')) {
      final l$doneAt = data['doneAt'];
      result$data['doneAt'] = l$doneAt == null ? null : DateTime.parse((l$doneAt as String));
    }
    return VariablesMutationSetLogisticItemDone._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  DateTime? get doneAt => (_$data['doneAt'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('doneAt')) {
      final l$doneAt = doneAt;
      result$data['doneAt'] = l$doneAt == null
          ? null
          : ((v) => v.toUtc().toIso8601String())(l$doneAt);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetLogisticItemDone || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$doneAt = doneAt;
    final lOther$doneAt = other.doneAt;
    if (_$data.containsKey('doneAt') != other._$data.containsKey('doneAt')) {
      return false;
    }
    if (l$doneAt != lOther$doneAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$doneAt = doneAt;
    return Object.hashAll([l$id, _$data.containsKey('doneAt') ? l$doneAt : const {}]);
  }
}

class MutationSetLogisticItemDone {
  MutationSetLogisticItemDone({
    required this.updateLogisticItemsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetLogisticItemDone.fromJson(Map<String, dynamic> json) {
    final l$updateLogisticItemsCollection = json['updateLogisticItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetLogisticItemDone(
      updateLogisticItemsCollection:
          MutationSetLogisticItemDoneupdateLogisticItemsCollection.fromJson(
            (l$updateLogisticItemsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetLogisticItemDoneupdateLogisticItemsCollection updateLogisticItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLogisticItemsCollection = updateLogisticItemsCollection;
    _resultData['updateLogisticItemsCollection'] = l$updateLogisticItemsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLogisticItemsCollection = updateLogisticItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateLogisticItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetLogisticItemDone || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLogisticItemsCollection = updateLogisticItemsCollection;
    final lOther$updateLogisticItemsCollection = other.updateLogisticItemsCollection;
    if (l$updateLogisticItemsCollection != lOther$updateLogisticItemsCollection) {
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

const documentNodeMutationSetLogisticItemDone = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetLogisticItemDone'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'doneAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateLogisticItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'doneAt'),
                      value: VariableNode(name: NameNode(value: 'doneAt')),
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
MutationSetLogisticItemDone _parserFnMutationSetLogisticItemDone(Map<String, dynamic> data) =>
    MutationSetLogisticItemDone.fromJson(data);
typedef OnMutationCompletedMutationSetLogisticItemDone = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetLogisticItemDone?,
);

class OptionsMutationSetLogisticItemDone
    extends graphql.MutationOptions<MutationSetLogisticItemDone> {
  OptionsMutationSetLogisticItemDone({
    String? operationName,
    required VariablesMutationSetLogisticItemDone variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetLogisticItemDone? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetLogisticItemDone? onCompleted,
    graphql.OnMutationUpdate<MutationSetLogisticItemDone>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetLogisticItemDone',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSetLogisticItemDone(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetLogisticItemDone,
         parserFn: _parserFnMutationSetLogisticItemDone,
       );

  final OnMutationCompletedMutationSetLogisticItemDone? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetLogisticItemDone
    extends graphql.WatchQueryOptions<MutationSetLogisticItemDone> {
  WatchOptionsMutationSetLogisticItemDone({
    String? operationName,
    required VariablesMutationSetLogisticItemDone variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetLogisticItemDone? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetLogisticItemDone',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetLogisticItemDone,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetLogisticItemDone,
       );
}

extension ClientExtensionMutationSetLogisticItemDone on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetLogisticItemDone>> mutateSetLogisticItemDone(
    OptionsMutationSetLogisticItemDone options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetLogisticItemDone> watchMutationSetLogisticItemDone(
    WatchOptionsMutationSetLogisticItemDone options,
  ) => this.watchMutation(options);
}

class MutationSetLogisticItemDoneupdateLogisticItemsCollection {
  MutationSetLogisticItemDoneupdateLogisticItemsCollection({
    required this.affectedCount,
    this.$__typename = 'LogisticItemsUpdateResponse',
  });

  factory MutationSetLogisticItemDoneupdateLogisticItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetLogisticItemDoneupdateLogisticItemsCollection(
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
    if (other is! MutationSetLogisticItemDoneupdateLogisticItemsCollection ||
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
