// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateLoveStyleManualEntry {
  factory VariablesMutationUpdateLoveStyleManualEntry({
    required String id,
    required String value,
  }) => VariablesMutationUpdateLoveStyleManualEntry._({r'id': id, r'value': value});

  VariablesMutationUpdateLoveStyleManualEntry._(this._$data);

  factory VariablesMutationUpdateLoveStyleManualEntry.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    return VariablesMutationUpdateLoveStyleManualEntry._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get value => (_$data['value'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$value = value;
    result$data['value'] = l$value;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateLoveStyleManualEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$value = value;
    return Object.hashAll([l$id, l$value]);
  }
}

class MutationUpdateLoveStyleManualEntry {
  MutationUpdateLoveStyleManualEntry({
    required this.updateManualEntriesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateLoveStyleManualEntry.fromJson(Map<String, dynamic> json) {
    final l$updateManualEntriesCollection = json['updateManualEntriesCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateLoveStyleManualEntry(
      updateManualEntriesCollection:
          MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection.fromJson(
            (l$updateManualEntriesCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection
  updateManualEntriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateManualEntriesCollection = updateManualEntriesCollection;
    _resultData['updateManualEntriesCollection'] = l$updateManualEntriesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateManualEntriesCollection = updateManualEntriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateManualEntriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateLoveStyleManualEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateManualEntriesCollection = updateManualEntriesCollection;
    final lOther$updateManualEntriesCollection = other.updateManualEntriesCollection;
    if (l$updateManualEntriesCollection != lOther$updateManualEntriesCollection) {
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

const documentNodeMutationUpdateLoveStyleManualEntry = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateLoveStyleManualEntry'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'value')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateManualEntriesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'value'),
                      value: VariableNode(name: NameNode(value: 'value')),
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
MutationUpdateLoveStyleManualEntry _parserFnMutationUpdateLoveStyleManualEntry(
  Map<String, dynamic> data,
) => MutationUpdateLoveStyleManualEntry.fromJson(data);
typedef OnMutationCompletedMutationUpdateLoveStyleManualEntry = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateLoveStyleManualEntry?,
);

class OptionsMutationUpdateLoveStyleManualEntry
    extends graphql.MutationOptions<MutationUpdateLoveStyleManualEntry> {
  OptionsMutationUpdateLoveStyleManualEntry({
    String? operationName,
    required VariablesMutationUpdateLoveStyleManualEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateLoveStyleManualEntry? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateLoveStyleManualEntry? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateLoveStyleManualEntry>? update,
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
                 data == null ? null : _parserFnMutationUpdateLoveStyleManualEntry(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateLoveStyleManualEntry,
         parserFn: _parserFnMutationUpdateLoveStyleManualEntry,
       );

  final OnMutationCompletedMutationUpdateLoveStyleManualEntry? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateLoveStyleManualEntry
    extends graphql.WatchQueryOptions<MutationUpdateLoveStyleManualEntry> {
  WatchOptionsMutationUpdateLoveStyleManualEntry({
    String? operationName,
    required VariablesMutationUpdateLoveStyleManualEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateLoveStyleManualEntry? typedOptimisticResult,
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
         document: documentNodeMutationUpdateLoveStyleManualEntry,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateLoveStyleManualEntry,
       );
}

extension ClientExtensionMutationUpdateLoveStyleManualEntry on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateLoveStyleManualEntry>> mutateUpdateLoveStyleManualEntry(
    OptionsMutationUpdateLoveStyleManualEntry options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateLoveStyleManualEntry>
  watchMutationUpdateLoveStyleManualEntry(WatchOptionsMutationUpdateLoveStyleManualEntry options) =>
      this.watchMutation(options);
}

class MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection {
  MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection({
    required this.affectedCount,
    this.$__typename = 'ManualEntriesUpdateResponse',
  });

  factory MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection(
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
    if (other is! MutationUpdateLoveStyleManualEntryupdateManualEntriesCollection ||
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
