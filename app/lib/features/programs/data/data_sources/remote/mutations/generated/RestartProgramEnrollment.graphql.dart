// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationRestartProgramEnrollment {
  factory VariablesMutationRestartProgramEnrollment({required String programSlug}) =>
      VariablesMutationRestartProgramEnrollment._({r'programSlug': programSlug});

  VariablesMutationRestartProgramEnrollment._(this._$data);

  factory VariablesMutationRestartProgramEnrollment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$programSlug = data['programSlug'];
    result$data['programSlug'] = (l$programSlug as String);
    return VariablesMutationRestartProgramEnrollment._(result$data);
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
    if (other is! VariablesMutationRestartProgramEnrollment || runtimeType != other.runtimeType) {
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

class MutationRestartProgramEnrollment {
  MutationRestartProgramEnrollment({
    required this.updateProgramEnrollmentsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationRestartProgramEnrollment.fromJson(Map<String, dynamic> json) {
    final l$updateProgramEnrollmentsCollection = json['updateProgramEnrollmentsCollection'];
    final l$$__typename = json['__typename'];
    return MutationRestartProgramEnrollment(
      updateProgramEnrollmentsCollection:
          MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection.fromJson(
            (l$updateProgramEnrollmentsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection
  updateProgramEnrollmentsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateProgramEnrollmentsCollection = updateProgramEnrollmentsCollection;
    _resultData['updateProgramEnrollmentsCollection'] = l$updateProgramEnrollmentsCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateProgramEnrollmentsCollection = updateProgramEnrollmentsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateProgramEnrollmentsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRestartProgramEnrollment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateProgramEnrollmentsCollection = updateProgramEnrollmentsCollection;
    final lOther$updateProgramEnrollmentsCollection = other.updateProgramEnrollmentsCollection;
    if (l$updateProgramEnrollmentsCollection != lOther$updateProgramEnrollmentsCollection) {
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

const documentNodeMutationRestartProgramEnrollment = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RestartProgramEnrollment'),
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
            name: NameNode(value: 'updateProgramEnrollmentsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'currentDay'),
                      value: IntValueNode(value: '1'),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'completedAt'),
                      value: NullValueNode(),
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
MutationRestartProgramEnrollment _parserFnMutationRestartProgramEnrollment(
  Map<String, dynamic> data,
) => MutationRestartProgramEnrollment.fromJson(data);
typedef OnMutationCompletedMutationRestartProgramEnrollment = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationRestartProgramEnrollment?,
);

class OptionsMutationRestartProgramEnrollment
    extends graphql.MutationOptions<MutationRestartProgramEnrollment> {
  OptionsMutationRestartProgramEnrollment({
    String? operationName,
    required VariablesMutationRestartProgramEnrollment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRestartProgramEnrollment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationRestartProgramEnrollment? onCompleted,
    graphql.OnMutationUpdate<MutationRestartProgramEnrollment>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RestartProgramEnrollment',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationRestartProgramEnrollment(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRestartProgramEnrollment,
         parserFn: _parserFnMutationRestartProgramEnrollment,
       );

  final OnMutationCompletedMutationRestartProgramEnrollment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationRestartProgramEnrollment
    extends graphql.WatchQueryOptions<MutationRestartProgramEnrollment> {
  WatchOptionsMutationRestartProgramEnrollment({
    String? operationName,
    required VariablesMutationRestartProgramEnrollment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRestartProgramEnrollment? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RestartProgramEnrollment',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRestartProgramEnrollment,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationRestartProgramEnrollment,
       );
}

extension ClientExtensionMutationRestartProgramEnrollment on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationRestartProgramEnrollment>> mutateRestartProgramEnrollment(
    OptionsMutationRestartProgramEnrollment options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationRestartProgramEnrollment> watchMutationRestartProgramEnrollment(
    WatchOptionsMutationRestartProgramEnrollment options,
  ) => this.watchMutation(options);
}

class MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection {
  MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection({
    required this.affectedCount,
    this.$__typename = 'ProgramEnrollmentsUpdateResponse',
  });

  factory MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection(
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
    if (other is! MutationRestartProgramEnrollmentupdateProgramEnrollmentsCollection ||
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
