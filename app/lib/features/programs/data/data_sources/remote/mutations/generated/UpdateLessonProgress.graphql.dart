// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateLessonProgress {
  factory VariablesMutationUpdateLessonProgress({
    required String programSlug,
    required int lessonDay,
    required EnumLessonStatus status,
  }) => VariablesMutationUpdateLessonProgress._({
    r'programSlug': programSlug,
    r'lessonDay': lessonDay,
    r'status': status,
  });

  VariablesMutationUpdateLessonProgress._(this._$data);

  factory VariablesMutationUpdateLessonProgress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$programSlug = data['programSlug'];
    result$data['programSlug'] = (l$programSlug as String);
    final l$lessonDay = data['lessonDay'];
    result$data['lessonDay'] = (l$lessonDay as int);
    final l$status = data['status'];
    result$data['status'] = fromJsonEnumLessonStatus((l$status as String));
    return VariablesMutationUpdateLessonProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get programSlug => (_$data['programSlug'] as String);

  int get lessonDay => (_$data['lessonDay'] as int);

  EnumLessonStatus get status => (_$data['status'] as EnumLessonStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$programSlug = programSlug;
    result$data['programSlug'] = l$programSlug;
    final l$lessonDay = lessonDay;
    result$data['lessonDay'] = l$lessonDay;
    final l$status = status;
    result$data['status'] = toJsonEnumLessonStatus(l$status);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateLessonProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$programSlug = programSlug;
    final lOther$programSlug = other.programSlug;
    if (l$programSlug != lOther$programSlug) {
      return false;
    }
    final l$lessonDay = lessonDay;
    final lOther$lessonDay = other.lessonDay;
    if (l$lessonDay != lOther$lessonDay) {
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
    final l$programSlug = programSlug;
    final l$lessonDay = lessonDay;
    final l$status = status;
    return Object.hashAll([l$programSlug, l$lessonDay, l$status]);
  }
}

class MutationUpdateLessonProgress {
  MutationUpdateLessonProgress({
    required this.updateLessonProgressCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateLessonProgress.fromJson(Map<String, dynamic> json) {
    final l$updateLessonProgressCollection = json['updateLessonProgressCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateLessonProgress(
      updateLessonProgressCollection:
          MutationUpdateLessonProgressupdateLessonProgressCollection.fromJson(
            (l$updateLessonProgressCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateLessonProgressupdateLessonProgressCollection updateLessonProgressCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLessonProgressCollection = updateLessonProgressCollection;
    _resultData['updateLessonProgressCollection'] = l$updateLessonProgressCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLessonProgressCollection = updateLessonProgressCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateLessonProgressCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateLessonProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLessonProgressCollection = updateLessonProgressCollection;
    final lOther$updateLessonProgressCollection = other.updateLessonProgressCollection;
    if (l$updateLessonProgressCollection != lOther$updateLessonProgressCollection) {
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

const documentNodeMutationUpdateLessonProgress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateLessonProgress'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'programSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'lessonDay')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(name: NameNode(value: 'LessonStatus'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateLessonProgressCollection'),
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
                    ObjectFieldNode(
                      name: NameNode(value: 'lessonDay'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'lessonDay')),
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
MutationUpdateLessonProgress _parserFnMutationUpdateLessonProgress(Map<String, dynamic> data) =>
    MutationUpdateLessonProgress.fromJson(data);
typedef OnMutationCompletedMutationUpdateLessonProgress = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateLessonProgress?,
);

class OptionsMutationUpdateLessonProgress
    extends graphql.MutationOptions<MutationUpdateLessonProgress> {
  OptionsMutationUpdateLessonProgress({
    String? operationName,
    required VariablesMutationUpdateLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateLessonProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateLessonProgress? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateLessonProgress>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'UpdateLessonProgress',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationUpdateLessonProgress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateLessonProgress,
         parserFn: _parserFnMutationUpdateLessonProgress,
       );

  final OnMutationCompletedMutationUpdateLessonProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateLessonProgress
    extends graphql.WatchQueryOptions<MutationUpdateLessonProgress> {
  WatchOptionsMutationUpdateLessonProgress({
    String? operationName,
    required VariablesMutationUpdateLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateLessonProgress? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'UpdateLessonProgress',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUpdateLessonProgress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateLessonProgress,
       );
}

extension ClientExtensionMutationUpdateLessonProgress on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateLessonProgress>> mutateUpdateLessonProgress(
    OptionsMutationUpdateLessonProgress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateLessonProgress> watchMutationUpdateLessonProgress(
    WatchOptionsMutationUpdateLessonProgress options,
  ) => this.watchMutation(options);
}

class MutationUpdateLessonProgressupdateLessonProgressCollection {
  MutationUpdateLessonProgressupdateLessonProgressCollection({
    required this.affectedCount,
    this.$__typename = 'LessonProgressUpdateResponse',
  });

  factory MutationUpdateLessonProgressupdateLessonProgressCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateLessonProgressupdateLessonProgressCollection(
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
    if (other is! MutationUpdateLessonProgressupdateLessonProgressCollection ||
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
