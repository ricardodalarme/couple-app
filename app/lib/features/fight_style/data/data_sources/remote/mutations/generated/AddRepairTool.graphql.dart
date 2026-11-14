// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddRepairTool {
  factory VariablesMutationAddRepairTool({required String id, required String note}) =>
      VariablesMutationAddRepairTool._({r'id': id, r'note': note});

  VariablesMutationAddRepairTool._(this._$data);

  factory VariablesMutationAddRepairTool.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$note = data['note'];
    result$data['note'] = (l$note as String);
    return VariablesMutationAddRepairTool._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get note => (_$data['note'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$note = note;
    result$data['note'] = l$note;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddRepairTool || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$note = note;
    return Object.hashAll([l$id, l$note]);
  }
}

class MutationAddRepairTool {
  MutationAddRepairTool({this.insertIntoRepairLearningsCollection, this.$__typename = 'Mutation'});

  factory MutationAddRepairTool.fromJson(Map<String, dynamic> json) {
    final l$insertIntoRepairLearningsCollection = json['insertIntoRepairLearningsCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddRepairTool(
      insertIntoRepairLearningsCollection: l$insertIntoRepairLearningsCollection == null
          ? null
          : MutationAddRepairToolinsertIntoRepairLearningsCollection.fromJson(
              (l$insertIntoRepairLearningsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddRepairToolinsertIntoRepairLearningsCollection?
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
    if (other is! MutationAddRepairTool || runtimeType != other.runtimeType) {
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

const documentNodeMutationAddRepairTool = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddRepairTool'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
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
                          name: NameNode(value: 'kind'),
                          value: EnumValueNode(name: NameNode(value: 'trigger')),
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
MutationAddRepairTool _parserFnMutationAddRepairTool(Map<String, dynamic> data) =>
    MutationAddRepairTool.fromJson(data);
typedef OnMutationCompletedMutationAddRepairTool = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddRepairTool?,
);

class OptionsMutationAddRepairTool extends graphql.MutationOptions<MutationAddRepairTool> {
  OptionsMutationAddRepairTool({
    String? operationName,
    required VariablesMutationAddRepairTool variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddRepairTool? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddRepairTool? onCompleted,
    graphql.OnMutationUpdate<MutationAddRepairTool>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'AddRepairTool',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationAddRepairTool(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddRepairTool,
         parserFn: _parserFnMutationAddRepairTool,
       );

  final OnMutationCompletedMutationAddRepairTool? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddRepairTool extends graphql.WatchQueryOptions<MutationAddRepairTool> {
  WatchOptionsMutationAddRepairTool({
    String? operationName,
    required VariablesMutationAddRepairTool variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddRepairTool? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'AddRepairTool',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationAddRepairTool,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddRepairTool,
       );
}

extension ClientExtensionMutationAddRepairTool on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddRepairTool>> mutateAddRepairTool(
    OptionsMutationAddRepairTool options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddRepairTool> watchMutationAddRepairTool(
    WatchOptionsMutationAddRepairTool options,
  ) => this.watchMutation(options);
}

class MutationAddRepairToolinsertIntoRepairLearningsCollection {
  MutationAddRepairToolinsertIntoRepairLearningsCollection({
    required this.affectedCount,
    this.$__typename = 'RepairLearningsInsertResponse',
  });

  factory MutationAddRepairToolinsertIntoRepairLearningsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddRepairToolinsertIntoRepairLearningsCollection(
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
    if (other is! MutationAddRepairToolinsertIntoRepairLearningsCollection ||
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
