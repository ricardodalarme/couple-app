// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationArchiveRitual {
  factory VariablesMutationArchiveRitual({required String id, required DateTime archivedAt}) =>
      VariablesMutationArchiveRitual._({r'id': id, r'archivedAt': archivedAt});

  VariablesMutationArchiveRitual._(this._$data);

  factory VariablesMutationArchiveRitual.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$archivedAt = data['archivedAt'];
    result$data['archivedAt'] = DateTime.parse((l$archivedAt as String));
    return VariablesMutationArchiveRitual._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  DateTime get archivedAt => (_$data['archivedAt'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$archivedAt = archivedAt;
    result$data['archivedAt'] = ((v) => v.toUtc().toIso8601String())(l$archivedAt);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationArchiveRitual || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$archivedAt = archivedAt;
    final lOther$archivedAt = other.archivedAt;
    if (l$archivedAt != lOther$archivedAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$archivedAt = archivedAt;
    return Object.hashAll([l$id, l$archivedAt]);
  }
}

class MutationArchiveRitual {
  MutationArchiveRitual({required this.updateRitualsCollection, this.$__typename = 'Mutation'});

  factory MutationArchiveRitual.fromJson(Map<String, dynamic> json) {
    final l$updateRitualsCollection = json['updateRitualsCollection'];
    final l$$__typename = json['__typename'];
    return MutationArchiveRitual(
      updateRitualsCollection: MutationArchiveRitualupdateRitualsCollection.fromJson(
        (l$updateRitualsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationArchiveRitualupdateRitualsCollection updateRitualsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRitualsCollection = updateRitualsCollection;
    _resultData['updateRitualsCollection'] = l$updateRitualsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRitualsCollection = updateRitualsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRitualsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationArchiveRitual || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRitualsCollection = updateRitualsCollection;
    final lOther$updateRitualsCollection = other.updateRitualsCollection;
    if (l$updateRitualsCollection != lOther$updateRitualsCollection) {
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

const documentNodeMutationArchiveRitual = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ArchiveRitual'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'archivedAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateRitualsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'archivedAt'),
                      value: VariableNode(name: NameNode(value: 'archivedAt')),
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
MutationArchiveRitual _parserFnMutationArchiveRitual(Map<String, dynamic> data) =>
    MutationArchiveRitual.fromJson(data);
typedef OnMutationCompletedMutationArchiveRitual = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationArchiveRitual?,
);

class OptionsMutationArchiveRitual extends graphql.MutationOptions<MutationArchiveRitual> {
  OptionsMutationArchiveRitual({
    String? operationName,
    required VariablesMutationArchiveRitual variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationArchiveRitual? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationArchiveRitual? onCompleted,
    graphql.OnMutationUpdate<MutationArchiveRitual>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'ArchiveRitual',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationArchiveRitual(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationArchiveRitual,
         parserFn: _parserFnMutationArchiveRitual,
       );

  final OnMutationCompletedMutationArchiveRitual? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationArchiveRitual extends graphql.WatchQueryOptions<MutationArchiveRitual> {
  WatchOptionsMutationArchiveRitual({
    String? operationName,
    required VariablesMutationArchiveRitual variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationArchiveRitual? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'ArchiveRitual',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationArchiveRitual,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationArchiveRitual,
       );
}

extension ClientExtensionMutationArchiveRitual on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationArchiveRitual>> mutateArchiveRitual(
    OptionsMutationArchiveRitual options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationArchiveRitual> watchMutationArchiveRitual(
    WatchOptionsMutationArchiveRitual options,
  ) => this.watchMutation(options);
}

class MutationArchiveRitualupdateRitualsCollection {
  MutationArchiveRitualupdateRitualsCollection({
    required this.affectedCount,
    this.$__typename = 'RitualsUpdateResponse',
  });

  factory MutationArchiveRitualupdateRitualsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationArchiveRitualupdateRitualsCollection(
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
    if (other is! MutationArchiveRitualupdateRitualsCollection ||
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
