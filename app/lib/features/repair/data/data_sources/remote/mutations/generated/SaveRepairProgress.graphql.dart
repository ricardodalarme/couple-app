// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSaveRepairProgress {
  factory VariablesMutationSaveRepairProgress({
    required String id,
    required int step,
    String? draft,
  }) => VariablesMutationSaveRepairProgress._({
    r'id': id,
    r'step': step,
    if (draft != null) r'draft': draft,
  });

  VariablesMutationSaveRepairProgress._(this._$data);

  factory VariablesMutationSaveRepairProgress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$step = data['step'];
    result$data['step'] = (l$step as int);
    if (data.containsKey('draft')) {
      final l$draft = data['draft'];
      result$data['draft'] = (l$draft as String?);
    }
    return VariablesMutationSaveRepairProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  int get step => (_$data['step'] as int);

  String? get draft => (_$data['draft'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$step = step;
    result$data['step'] = l$step;
    if (_$data.containsKey('draft')) {
      final l$draft = draft;
      result$data['draft'] = l$draft;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSaveRepairProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$step = step;
    final lOther$step = other.step;
    if (l$step != lOther$step) {
      return false;
    }
    final l$draft = draft;
    final lOther$draft = other.draft;
    if (_$data.containsKey('draft') != other._$data.containsKey('draft')) {
      return false;
    }
    if (l$draft != lOther$draft) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$step = step;
    final l$draft = draft;
    return Object.hashAll([l$id, l$step, _$data.containsKey('draft') ? l$draft : const {}]);
  }
}

class MutationSaveRepairProgress {
  MutationSaveRepairProgress({
    required this.updateRepairSessionsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSaveRepairProgress.fromJson(Map<String, dynamic> json) {
    final l$updateRepairSessionsCollection = json['updateRepairSessionsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSaveRepairProgress(
      updateRepairSessionsCollection:
          MutationSaveRepairProgressupdateRepairSessionsCollection.fromJson(
            (l$updateRepairSessionsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSaveRepairProgressupdateRepairSessionsCollection updateRepairSessionsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRepairSessionsCollection = updateRepairSessionsCollection;
    _resultData['updateRepairSessionsCollection'] = l$updateRepairSessionsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRepairSessionsCollection = updateRepairSessionsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRepairSessionsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSaveRepairProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRepairSessionsCollection = updateRepairSessionsCollection;
    final lOther$updateRepairSessionsCollection = other.updateRepairSessionsCollection;
    if (l$updateRepairSessionsCollection != lOther$updateRepairSessionsCollection) {
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

const documentNodeMutationSaveRepairProgress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SaveRepairProgress'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'step')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'draft')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateRepairSessionsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'step'),
                      value: VariableNode(name: NameNode(value: 'step')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'draft'),
                      value: VariableNode(name: NameNode(value: 'draft')),
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
MutationSaveRepairProgress _parserFnMutationSaveRepairProgress(Map<String, dynamic> data) =>
    MutationSaveRepairProgress.fromJson(data);
typedef OnMutationCompletedMutationSaveRepairProgress = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSaveRepairProgress?,
);

class OptionsMutationSaveRepairProgress
    extends graphql.MutationOptions<MutationSaveRepairProgress> {
  OptionsMutationSaveRepairProgress({
    String? operationName,
    required VariablesMutationSaveRepairProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveRepairProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSaveRepairProgress? onCompleted,
    graphql.OnMutationUpdate<MutationSaveRepairProgress>? update,
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
                 data == null ? null : _parserFnMutationSaveRepairProgress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSaveRepairProgress,
         parserFn: _parserFnMutationSaveRepairProgress,
       );

  final OnMutationCompletedMutationSaveRepairProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSaveRepairProgress
    extends graphql.WatchQueryOptions<MutationSaveRepairProgress> {
  WatchOptionsMutationSaveRepairProgress({
    String? operationName,
    required VariablesMutationSaveRepairProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveRepairProgress? typedOptimisticResult,
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
         document: documentNodeMutationSaveRepairProgress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSaveRepairProgress,
       );
}

extension ClientExtensionMutationSaveRepairProgress on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSaveRepairProgress>> mutateSaveRepairProgress(
    OptionsMutationSaveRepairProgress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSaveRepairProgress> watchMutationSaveRepairProgress(
    WatchOptionsMutationSaveRepairProgress options,
  ) => this.watchMutation(options);
}

class MutationSaveRepairProgressupdateRepairSessionsCollection {
  MutationSaveRepairProgressupdateRepairSessionsCollection({
    required this.affectedCount,
    this.$__typename = 'RepairSessionsUpdateResponse',
  });

  factory MutationSaveRepairProgressupdateRepairSessionsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSaveRepairProgressupdateRepairSessionsCollection(
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
    if (other is! MutationSaveRepairProgressupdateRepairSessionsCollection ||
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
