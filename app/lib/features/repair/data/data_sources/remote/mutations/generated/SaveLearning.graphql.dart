// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSaveLearning {
  factory VariablesMutationSaveLearning({
    required String id,
    String? sessionId,
    required EnumRepairLearningKind kind,
    required String note,
  }) => VariablesMutationSaveLearning._({
    r'id': id,
    if (sessionId != null) r'sessionId': sessionId,
    r'kind': kind,
    r'note': note,
  });

  VariablesMutationSaveLearning._(this._$data);

  factory VariablesMutationSaveLearning.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('sessionId')) {
      final l$sessionId = data['sessionId'];
      result$data['sessionId'] = (l$sessionId as String?);
    }
    final l$kind = data['kind'];
    result$data['kind'] = fromJsonEnumRepairLearningKind((l$kind as String));
    final l$note = data['note'];
    result$data['note'] = (l$note as String);
    return VariablesMutationSaveLearning._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get sessionId => (_$data['sessionId'] as String?);

  EnumRepairLearningKind get kind => (_$data['kind'] as EnumRepairLearningKind);

  String get note => (_$data['note'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('sessionId')) {
      final l$sessionId = sessionId;
      result$data['sessionId'] = l$sessionId;
    }
    final l$kind = kind;
    result$data['kind'] = toJsonEnumRepairLearningKind(l$kind);
    final l$note = note;
    result$data['note'] = l$note;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSaveLearning || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (_$data.containsKey('sessionId') != other._$data.containsKey('sessionId')) {
      return false;
    }
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$sessionId = sessionId;
    final l$kind = kind;
    final l$note = note;
    return Object.hashAll([
      l$id,
      _$data.containsKey('sessionId') ? l$sessionId : const {},
      l$kind,
      l$note,
    ]);
  }
}

class MutationSaveLearning {
  MutationSaveLearning({this.insertIntoRepairLearningsCollection, this.$__typename = 'Mutation'});

  factory MutationSaveLearning.fromJson(Map<String, dynamic> json) {
    final l$insertIntoRepairLearningsCollection = json['insertIntoRepairLearningsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSaveLearning(
      insertIntoRepairLearningsCollection: l$insertIntoRepairLearningsCollection == null
          ? null
          : MutationSaveLearninginsertIntoRepairLearningsCollection.fromJson(
              (l$insertIntoRepairLearningsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSaveLearninginsertIntoRepairLearningsCollection?
  insertIntoRepairLearningsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoRepairLearningsCollection = insertIntoRepairLearningsCollection;
    _resultData['insertIntoRepairLearningsCollection'] = l$insertIntoRepairLearningsCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoRepairLearningsCollection = insertIntoRepairLearningsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoRepairLearningsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSaveLearning || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoRepairLearningsCollection = insertIntoRepairLearningsCollection;
    final lOther$insertIntoRepairLearningsCollection = other.insertIntoRepairLearningsCollection;
    if (l$insertIntoRepairLearningsCollection != lOther$insertIntoRepairLearningsCollection) {
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

const documentNodeMutationSaveLearning = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SaveLearning'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'sessionId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'RepairLearningKind'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'note')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoRepairLearningsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'repairSessionId'),
                          value: VariableNode(name: NameNode(value: 'sessionId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'kind'),
                          value: VariableNode(name: NameNode(value: 'kind')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'note'),
                          value: VariableNode(name: NameNode(value: 'note')),
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
MutationSaveLearning _parserFnMutationSaveLearning(Map<String, dynamic> data) =>
    MutationSaveLearning.fromJson(data);
typedef OnMutationCompletedMutationSaveLearning = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSaveLearning?,
);

class OptionsMutationSaveLearning extends graphql.MutationOptions<MutationSaveLearning> {
  OptionsMutationSaveLearning({
    String? operationName,
    required VariablesMutationSaveLearning variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveLearning? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSaveLearning? onCompleted,
    graphql.OnMutationUpdate<MutationSaveLearning>? update,
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
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationSaveLearning(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSaveLearning,
         parserFn: _parserFnMutationSaveLearning,
       );

  final OnMutationCompletedMutationSaveLearning? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSaveLearning extends graphql.WatchQueryOptions<MutationSaveLearning> {
  WatchOptionsMutationSaveLearning({
    String? operationName,
    required VariablesMutationSaveLearning variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveLearning? typedOptimisticResult,
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
         document: documentNodeMutationSaveLearning,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSaveLearning,
       );
}

extension ClientExtensionMutationSaveLearning on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSaveLearning>> mutateSaveLearning(
    OptionsMutationSaveLearning options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSaveLearning> watchMutationSaveLearning(
    WatchOptionsMutationSaveLearning options,
  ) => this.watchMutation(options);
}

class MutationSaveLearninginsertIntoRepairLearningsCollection {
  MutationSaveLearninginsertIntoRepairLearningsCollection({
    required this.affectedCount,
    this.$__typename = 'RepairLearningsInsertResponse',
  });

  factory MutationSaveLearninginsertIntoRepairLearningsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSaveLearninginsertIntoRepairLearningsCollection(
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
    if (other is! MutationSaveLearninginsertIntoRepairLearningsCollection ||
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
