// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteLessonProgress {
  factory VariablesMutationDeleteLessonProgress({required String programSlug}) =>
      VariablesMutationDeleteLessonProgress._({r'programSlug': programSlug});

  VariablesMutationDeleteLessonProgress._(this._$data);

  factory VariablesMutationDeleteLessonProgress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$programSlug = data['programSlug'];
    result$data['programSlug'] = (l$programSlug as String);
    return VariablesMutationDeleteLessonProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get programSlug => (_$data['programSlug'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$programSlug = programSlug;
    result$data['programSlug'] = l$programSlug;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationDeleteLessonProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$programSlug = programSlug;
    final lOther$programSlug = other.programSlug;
    if (l$programSlug != lOther$programSlug) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$programSlug = programSlug;
    return Object.hashAll([l$programSlug]);
  }
}

class MutationDeleteLessonProgress {
  MutationDeleteLessonProgress({
    required this.deleteFromLessonProgressCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteLessonProgress.fromJson(Map<String, dynamic> json) {
    final l$deleteFromLessonProgressCollection = json['deleteFromLessonProgressCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteLessonProgress(
      deleteFromLessonProgressCollection:
          MutationDeleteLessonProgressdeleteFromLessonProgressCollection.fromJson(
            (l$deleteFromLessonProgressCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteLessonProgressdeleteFromLessonProgressCollection
  deleteFromLessonProgressCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromLessonProgressCollection = deleteFromLessonProgressCollection;
    _resultData['deleteFromLessonProgressCollection'] = l$deleteFromLessonProgressCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromLessonProgressCollection = deleteFromLessonProgressCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromLessonProgressCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteLessonProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromLessonProgressCollection = deleteFromLessonProgressCollection;
    final lOther$deleteFromLessonProgressCollection = other.deleteFromLessonProgressCollection;
    if (l$deleteFromLessonProgressCollection != lOther$deleteFromLessonProgressCollection) {
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

const documentNodeMutationDeleteLessonProgress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteLessonProgress'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'programSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteFromLessonProgressCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'programSlug'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'programSlug')),
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
MutationDeleteLessonProgress _parserFnMutationDeleteLessonProgress(Map<String, dynamic> data) =>
    MutationDeleteLessonProgress.fromJson(data);
typedef OnMutationCompletedMutationDeleteLessonProgress = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteLessonProgress?,
);

class OptionsMutationDeleteLessonProgress
    extends graphql.MutationOptions<MutationDeleteLessonProgress> {
  OptionsMutationDeleteLessonProgress({
    String? operationName,
    required VariablesMutationDeleteLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteLessonProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteLessonProgress? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteLessonProgress>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteLessonProgress',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationDeleteLessonProgress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteLessonProgress,
         parserFn: _parserFnMutationDeleteLessonProgress,
       );

  final OnMutationCompletedMutationDeleteLessonProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteLessonProgress
    extends graphql.WatchQueryOptions<MutationDeleteLessonProgress> {
  WatchOptionsMutationDeleteLessonProgress({
    String? operationName,
    required VariablesMutationDeleteLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteLessonProgress? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteLessonProgress',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteLessonProgress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteLessonProgress,
       );
}

extension ClientExtensionMutationDeleteLessonProgress on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteLessonProgress>> mutateDeleteLessonProgress(
    OptionsMutationDeleteLessonProgress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteLessonProgress> watchMutationDeleteLessonProgress(
    WatchOptionsMutationDeleteLessonProgress options,
  ) => this.watchMutation(options);
}

class MutationDeleteLessonProgressdeleteFromLessonProgressCollection {
  MutationDeleteLessonProgressdeleteFromLessonProgressCollection({
    required this.affectedCount,
    this.$__typename = 'LessonProgressDeleteResponse',
  });

  factory MutationDeleteLessonProgressdeleteFromLessonProgressCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteLessonProgressdeleteFromLessonProgressCollection(
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
    if (other is! MutationDeleteLessonProgressdeleteFromLessonProgressCollection ||
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
