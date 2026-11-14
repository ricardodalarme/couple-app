// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertLoveStyleManualEntry {
  factory VariablesMutationInsertLoveStyleManualEntry({required String value}) =>
      VariablesMutationInsertLoveStyleManualEntry._({r'value': value});

  VariablesMutationInsertLoveStyleManualEntry._(this._$data);

  factory VariablesMutationInsertLoveStyleManualEntry.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    return VariablesMutationInsertLoveStyleManualEntry._(result$data);
  }

  Map<String, dynamic> _$data;

  String get value => (_$data['value'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$value = value;
    result$data['value'] = l$value;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertLoveStyleManualEntry || runtimeType != other.runtimeType) {
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
    final l$value = value;
    return Object.hashAll([l$value]);
  }
}

class MutationInsertLoveStyleManualEntry {
  MutationInsertLoveStyleManualEntry({
    this.insertIntoManualEntriesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertLoveStyleManualEntry.fromJson(Map<String, dynamic> json) {
    final l$insertIntoManualEntriesCollection = json['insertIntoManualEntriesCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertLoveStyleManualEntry(
      insertIntoManualEntriesCollection: l$insertIntoManualEntriesCollection == null
          ? null
          : MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection.fromJson(
              (l$insertIntoManualEntriesCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection?
  insertIntoManualEntriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoManualEntriesCollection = insertIntoManualEntriesCollection;
    _resultData['insertIntoManualEntriesCollection'] = l$insertIntoManualEntriesCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoManualEntriesCollection = insertIntoManualEntriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoManualEntriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertLoveStyleManualEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoManualEntriesCollection = insertIntoManualEntriesCollection;
    final lOther$insertIntoManualEntriesCollection = other.insertIntoManualEntriesCollection;
    if (l$insertIntoManualEntriesCollection != lOther$insertIntoManualEntriesCollection) {
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

const documentNodeMutationInsertLoveStyleManualEntry = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertLoveStyleManualEntry'),
      variableDefinitions: [
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
            name: NameNode(value: 'insertIntoManualEntriesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'key'),
                          value: StringValueNode(value: 'loved', isBlock: false),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: VariableNode(name: NameNode(value: 'value')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'shared'),
                          value: BooleanValueNode(value: false),
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
                  name: NameNode(value: 'records'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'value'),
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
MutationInsertLoveStyleManualEntry _parserFnMutationInsertLoveStyleManualEntry(
  Map<String, dynamic> data,
) => MutationInsertLoveStyleManualEntry.fromJson(data);
typedef OnMutationCompletedMutationInsertLoveStyleManualEntry = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertLoveStyleManualEntry?,
);

class OptionsMutationInsertLoveStyleManualEntry
    extends graphql.MutationOptions<MutationInsertLoveStyleManualEntry> {
  OptionsMutationInsertLoveStyleManualEntry({
    String? operationName,
    required VariablesMutationInsertLoveStyleManualEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertLoveStyleManualEntry? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertLoveStyleManualEntry? onCompleted,
    graphql.OnMutationUpdate<MutationInsertLoveStyleManualEntry>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InsertLoveStyleManualEntry',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationInsertLoveStyleManualEntry(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertLoveStyleManualEntry,
         parserFn: _parserFnMutationInsertLoveStyleManualEntry,
       );

  final OnMutationCompletedMutationInsertLoveStyleManualEntry? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertLoveStyleManualEntry
    extends graphql.WatchQueryOptions<MutationInsertLoveStyleManualEntry> {
  WatchOptionsMutationInsertLoveStyleManualEntry({
    String? operationName,
    required VariablesMutationInsertLoveStyleManualEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertLoveStyleManualEntry? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InsertLoveStyleManualEntry',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationInsertLoveStyleManualEntry,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertLoveStyleManualEntry,
       );
}

extension ClientExtensionMutationInsertLoveStyleManualEntry on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertLoveStyleManualEntry>> mutateInsertLoveStyleManualEntry(
    OptionsMutationInsertLoveStyleManualEntry options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertLoveStyleManualEntry>
  watchMutationInsertLoveStyleManualEntry(WatchOptionsMutationInsertLoveStyleManualEntry options) =>
      this.watchMutation(options);
}

class MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection {
  MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection({
    required this.records,
    this.$__typename = 'ManualEntriesInsertResponse',
  });

  factory MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) =>
                MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords> records;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$records = records;
    _resultData['records'] = l$records.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$records = records;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$records.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$records = records;
    final lOther$records = other.records;
    if (l$records.length != lOther$records.length) {
      return false;
    }
    for (int i = 0; i < l$records.length; i++) {
      final l$records$entry = l$records[i];
      final lOther$records$entry = lOther$records[i];
      if (l$records$entry != lOther$records$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords {
  MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords({
    required this.id,
    required this.value,
    this.$__typename = 'ManualEntries',
  });

  factory MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords(
      id: (l$id as String),
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$value, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertLoveStyleManualEntryinsertIntoManualEntriesCollectionrecords ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}
