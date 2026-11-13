// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertProgramEnrollment {
  factory VariablesMutationInsertProgramEnrollment({
    required String programSlug,
    required int currentDay,
    DateTime? completedAt,
  }) => VariablesMutationInsertProgramEnrollment._({
    r'programSlug': programSlug,
    r'currentDay': currentDay,
    if (completedAt != null) r'completedAt': completedAt,
  });

  VariablesMutationInsertProgramEnrollment._(this._$data);

  factory VariablesMutationInsertProgramEnrollment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$programSlug = data['programSlug'];
    result$data['programSlug'] = (l$programSlug as String);
    final l$currentDay = data['currentDay'];
    result$data['currentDay'] = (l$currentDay as int);
    if (data.containsKey('completedAt')) {
      final l$completedAt = data['completedAt'];
      result$data['completedAt'] = l$completedAt == null
          ? null
          : DateTime.parse((l$completedAt as String));
    }
    return VariablesMutationInsertProgramEnrollment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get programSlug => (_$data['programSlug'] as String);

  int get currentDay => (_$data['currentDay'] as int);

  DateTime? get completedAt => (_$data['completedAt'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$programSlug = programSlug;
    result$data['programSlug'] = l$programSlug;
    final l$currentDay = currentDay;
    result$data['currentDay'] = l$currentDay;
    if (_$data.containsKey('completedAt')) {
      final l$completedAt = completedAt;
      result$data['completedAt'] = l$completedAt == null
          ? null
          : ((v) => v.toUtc().toIso8601String())(l$completedAt);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertProgramEnrollment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$programSlug = programSlug;
    final lOther$programSlug = other.programSlug;
    if (l$programSlug != lOther$programSlug) {
      return false;
    }
    final l$currentDay = currentDay;
    final lOther$currentDay = other.currentDay;
    if (l$currentDay != lOther$currentDay) {
      return false;
    }
    final l$completedAt = completedAt;
    final lOther$completedAt = other.completedAt;
    if (_$data.containsKey('completedAt') != other._$data.containsKey('completedAt')) {
      return false;
    }
    if (l$completedAt != lOther$completedAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$programSlug = programSlug;
    final l$currentDay = currentDay;
    final l$completedAt = completedAt;
    return Object.hashAll([
      l$programSlug,
      l$currentDay,
      _$data.containsKey('completedAt') ? l$completedAt : const {},
    ]);
  }
}

class MutationInsertProgramEnrollment {
  MutationInsertProgramEnrollment({
    this.insertIntoProgramEnrollmentsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertProgramEnrollment.fromJson(Map<String, dynamic> json) {
    final l$insertIntoProgramEnrollmentsCollection = json['insertIntoProgramEnrollmentsCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertProgramEnrollment(
      insertIntoProgramEnrollmentsCollection: l$insertIntoProgramEnrollmentsCollection == null
          ? null
          : MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection.fromJson(
              (l$insertIntoProgramEnrollmentsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection?
  insertIntoProgramEnrollmentsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoProgramEnrollmentsCollection = insertIntoProgramEnrollmentsCollection;
    _resultData['insertIntoProgramEnrollmentsCollection'] = l$insertIntoProgramEnrollmentsCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoProgramEnrollmentsCollection = insertIntoProgramEnrollmentsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoProgramEnrollmentsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertProgramEnrollment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoProgramEnrollmentsCollection = insertIntoProgramEnrollmentsCollection;
    final lOther$insertIntoProgramEnrollmentsCollection =
        other.insertIntoProgramEnrollmentsCollection;
    if (l$insertIntoProgramEnrollmentsCollection != lOther$insertIntoProgramEnrollmentsCollection) {
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

const documentNodeMutationInsertProgramEnrollment = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertProgramEnrollment'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'programSlug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'currentDay')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'completedAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoProgramEnrollmentsCollection'),
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
                          name: NameNode(value: 'currentDay'),
                          value: VariableNode(name: NameNode(value: 'currentDay')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'completedAt'),
                          value: VariableNode(name: NameNode(value: 'completedAt')),
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
MutationInsertProgramEnrollment _parserFnMutationInsertProgramEnrollment(
  Map<String, dynamic> data,
) => MutationInsertProgramEnrollment.fromJson(data);
typedef OnMutationCompletedMutationInsertProgramEnrollment = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertProgramEnrollment?,
);

class OptionsMutationInsertProgramEnrollment
    extends graphql.MutationOptions<MutationInsertProgramEnrollment> {
  OptionsMutationInsertProgramEnrollment({
    String? operationName,
    required VariablesMutationInsertProgramEnrollment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertProgramEnrollment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertProgramEnrollment? onCompleted,
    graphql.OnMutationUpdate<MutationInsertProgramEnrollment>? update,
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
                 data == null ? null : _parserFnMutationInsertProgramEnrollment(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertProgramEnrollment,
         parserFn: _parserFnMutationInsertProgramEnrollment,
       );

  final OnMutationCompletedMutationInsertProgramEnrollment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertProgramEnrollment
    extends graphql.WatchQueryOptions<MutationInsertProgramEnrollment> {
  WatchOptionsMutationInsertProgramEnrollment({
    String? operationName,
    required VariablesMutationInsertProgramEnrollment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertProgramEnrollment? typedOptimisticResult,
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
         document: documentNodeMutationInsertProgramEnrollment,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertProgramEnrollment,
       );
}

extension ClientExtensionMutationInsertProgramEnrollment on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertProgramEnrollment>> mutateInsertProgramEnrollment(
    OptionsMutationInsertProgramEnrollment options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertProgramEnrollment> watchMutationInsertProgramEnrollment(
    WatchOptionsMutationInsertProgramEnrollment options,
  ) => this.watchMutation(options);
}

class MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection {
  MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection({
    required this.affectedCount,
    this.$__typename = 'ProgramEnrollmentsInsertResponse',
  });

  factory MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection(
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
    if (other is! MutationInsertProgramEnrollmentinsertIntoProgramEnrollmentsCollection ||
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
