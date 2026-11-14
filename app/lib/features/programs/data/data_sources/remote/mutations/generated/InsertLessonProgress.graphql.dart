// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertLessonProgress {
  factory VariablesMutationInsertLessonProgress({
    required String programSlug,
    required int lessonDay,
    required EnumLessonStatus status,
  }) => VariablesMutationInsertLessonProgress._({
    r'programSlug': programSlug,
    r'lessonDay': lessonDay,
    r'status': status,
  });

  VariablesMutationInsertLessonProgress._(this._$data);

  factory VariablesMutationInsertLessonProgress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$programSlug = data['programSlug'];
    result$data['programSlug'] = (l$programSlug as String);
    final l$lessonDay = data['lessonDay'];
    result$data['lessonDay'] = (l$lessonDay as int);
    final l$status = data['status'];
    result$data['status'] = fromJsonEnumLessonStatus((l$status as String));
    return VariablesMutationInsertLessonProgress._(result$data);
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
    if (other is! VariablesMutationInsertLessonProgress || runtimeType != other.runtimeType) {
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

class MutationInsertLessonProgress {
  MutationInsertLessonProgress({
    this.insertIntoLessonProgressCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertLessonProgress.fromJson(Map<String, dynamic> json) {
    final l$insertIntoLessonProgressCollection = json['insertIntoLessonProgressCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertLessonProgress(
      insertIntoLessonProgressCollection: l$insertIntoLessonProgressCollection == null
          ? null
          : MutationInsertLessonProgressinsertIntoLessonProgressCollection.fromJson(
              (l$insertIntoLessonProgressCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertLessonProgressinsertIntoLessonProgressCollection?
  insertIntoLessonProgressCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoLessonProgressCollection = insertIntoLessonProgressCollection;
    _resultData['insertIntoLessonProgressCollection'] = l$insertIntoLessonProgressCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoLessonProgressCollection = insertIntoLessonProgressCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoLessonProgressCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertLessonProgress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoLessonProgressCollection = insertIntoLessonProgressCollection;
    final lOther$insertIntoLessonProgressCollection = other.insertIntoLessonProgressCollection;
    if (l$insertIntoLessonProgressCollection != lOther$insertIntoLessonProgressCollection) {
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

const documentNodeMutationInsertLessonProgress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertLessonProgress'),
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
            name: NameNode(value: 'insertIntoLessonProgressCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'programSlug'),
                          value: VariableNode(name: NameNode(value: 'programSlug')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'lessonDay'),
                          value: VariableNode(name: NameNode(value: 'lessonDay')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'status'),
                          value: VariableNode(name: NameNode(value: 'status')),
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
MutationInsertLessonProgress _parserFnMutationInsertLessonProgress(Map<String, dynamic> data) =>
    MutationInsertLessonProgress.fromJson(data);
typedef OnMutationCompletedMutationInsertLessonProgress = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertLessonProgress?,
);

class OptionsMutationInsertLessonProgress
    extends graphql.MutationOptions<MutationInsertLessonProgress> {
  OptionsMutationInsertLessonProgress({
    String? operationName,
    required VariablesMutationInsertLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertLessonProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertLessonProgress? onCompleted,
    graphql.OnMutationUpdate<MutationInsertLessonProgress>? update,
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
                 data == null ? null : _parserFnMutationInsertLessonProgress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertLessonProgress,
         parserFn: _parserFnMutationInsertLessonProgress,
       );

  final OnMutationCompletedMutationInsertLessonProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertLessonProgress
    extends graphql.WatchQueryOptions<MutationInsertLessonProgress> {
  WatchOptionsMutationInsertLessonProgress({
    String? operationName,
    required VariablesMutationInsertLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertLessonProgress? typedOptimisticResult,
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
         document: documentNodeMutationInsertLessonProgress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertLessonProgress,
       );
}

extension ClientExtensionMutationInsertLessonProgress on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertLessonProgress>> mutateInsertLessonProgress(
    OptionsMutationInsertLessonProgress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertLessonProgress> watchMutationInsertLessonProgress(
    WatchOptionsMutationInsertLessonProgress options,
  ) => this.watchMutation(options);
}

class MutationInsertLessonProgressinsertIntoLessonProgressCollection {
  MutationInsertLessonProgressinsertIntoLessonProgressCollection({
    required this.affectedCount,
    this.$__typename = 'LessonProgressInsertResponse',
  });

  factory MutationInsertLessonProgressinsertIntoLessonProgressCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationInsertLessonProgressinsertIntoLessonProgressCollection(
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
    if (other is! MutationInsertLessonProgressinsertIntoLessonProgressCollection ||
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
