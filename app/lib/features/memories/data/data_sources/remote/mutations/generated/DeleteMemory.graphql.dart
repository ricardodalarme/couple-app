// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteMemory {
  factory VariablesMutationDeleteMemory({required String id}) =>
      VariablesMutationDeleteMemory._({r'id': id});

  VariablesMutationDeleteMemory._(this._$data);

  factory VariablesMutationDeleteMemory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteMemory._(result$data);
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
    if (other is! VariablesMutationDeleteMemory || runtimeType != other.runtimeType) {
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

class MutationDeleteMemory {
  MutationDeleteMemory({required this.deleteFromMemoriesCollection, this.$__typename = 'Mutation'});

  factory MutationDeleteMemory.fromJson(Map<String, dynamic> json) {
    final l$deleteFromMemoriesCollection = json['deleteFromMemoriesCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteMemory(
      deleteFromMemoriesCollection: MutationDeleteMemorydeleteFromMemoriesCollection.fromJson(
        (l$deleteFromMemoriesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteMemorydeleteFromMemoriesCollection deleteFromMemoriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromMemoriesCollection = deleteFromMemoriesCollection;
    _resultData['deleteFromMemoriesCollection'] = l$deleteFromMemoriesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromMemoriesCollection = deleteFromMemoriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromMemoriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteMemory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromMemoriesCollection = deleteFromMemoriesCollection;
    final lOther$deleteFromMemoriesCollection = other.deleteFromMemoriesCollection;
    if (l$deleteFromMemoriesCollection != lOther$deleteFromMemoriesCollection) {
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

const documentNodeMutationDeleteMemory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteMemory'),
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
            name: NameNode(value: 'deleteFromMemoriesCollection'),
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
MutationDeleteMemory _parserFnMutationDeleteMemory(Map<String, dynamic> data) =>
    MutationDeleteMemory.fromJson(data);
typedef OnMutationCompletedMutationDeleteMemory = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteMemory?,
);

class OptionsMutationDeleteMemory extends graphql.MutationOptions<MutationDeleteMemory> {
  OptionsMutationDeleteMemory({
    String? operationName,
    required VariablesMutationDeleteMemory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteMemory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteMemory? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteMemory>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteMemory',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteMemory(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMemory,
         parserFn: _parserFnMutationDeleteMemory,
       );

  final OnMutationCompletedMutationDeleteMemory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteMemory extends graphql.WatchQueryOptions<MutationDeleteMemory> {
  WatchOptionsMutationDeleteMemory({
    String? operationName,
    required VariablesMutationDeleteMemory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteMemory? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteMemory',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteMemory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteMemory,
       );
}

extension ClientExtensionMutationDeleteMemory on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteMemory>> mutateDeleteMemory(
    OptionsMutationDeleteMemory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteMemory> watchMutationDeleteMemory(
    WatchOptionsMutationDeleteMemory options,
  ) => this.watchMutation(options);
}

class MutationDeleteMemorydeleteFromMemoriesCollection {
  MutationDeleteMemorydeleteFromMemoriesCollection({
    required this.affectedCount,
    this.$__typename = 'MemoriesDeleteResponse',
  });

  factory MutationDeleteMemorydeleteFromMemoriesCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteMemorydeleteFromMemoriesCollection(
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
    if (other is! MutationDeleteMemorydeleteFromMemoriesCollection ||
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
