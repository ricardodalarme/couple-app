// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteJournalEntry {
  factory VariablesMutationDeleteJournalEntry({required String id}) =>
      VariablesMutationDeleteJournalEntry._({r'id': id});

  VariablesMutationDeleteJournalEntry._(this._$data);

  factory VariablesMutationDeleteJournalEntry.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteJournalEntry._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationDeleteJournalEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class MutationDeleteJournalEntry {
  MutationDeleteJournalEntry({
    required this.deleteFromJournalEntriesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteJournalEntry.fromJson(Map<String, dynamic> json) {
    final l$deleteFromJournalEntriesCollection = json['deleteFromJournalEntriesCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteJournalEntry(
      deleteFromJournalEntriesCollection:
          MutationDeleteJournalEntrydeleteFromJournalEntriesCollection.fromJson(
            (l$deleteFromJournalEntriesCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteJournalEntrydeleteFromJournalEntriesCollection
  deleteFromJournalEntriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromJournalEntriesCollection = deleteFromJournalEntriesCollection;
    _resultData['deleteFromJournalEntriesCollection'] = l$deleteFromJournalEntriesCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromJournalEntriesCollection = deleteFromJournalEntriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromJournalEntriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteJournalEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromJournalEntriesCollection = deleteFromJournalEntriesCollection;
    final lOther$deleteFromJournalEntriesCollection = other.deleteFromJournalEntriesCollection;
    if (l$deleteFromJournalEntriesCollection != lOther$deleteFromJournalEntriesCollection) {
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

const documentNodeMutationDeleteJournalEntry = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteJournalEntry'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteFromJournalEntriesCollection'),
            alias: null,
            arguments: [
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
MutationDeleteJournalEntry _parserFnMutationDeleteJournalEntry(Map<String, dynamic> data) =>
    MutationDeleteJournalEntry.fromJson(data);
typedef OnMutationCompletedMutationDeleteJournalEntry = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteJournalEntry?,
);

class OptionsMutationDeleteJournalEntry
    extends graphql.MutationOptions<MutationDeleteJournalEntry> {
  OptionsMutationDeleteJournalEntry({
    String? operationName,
    required VariablesMutationDeleteJournalEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteJournalEntry? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteJournalEntry? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteJournalEntry>? update,
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
                 data == null ? null : _parserFnMutationDeleteJournalEntry(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteJournalEntry,
         parserFn: _parserFnMutationDeleteJournalEntry,
       );

  final OnMutationCompletedMutationDeleteJournalEntry? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteJournalEntry
    extends graphql.WatchQueryOptions<MutationDeleteJournalEntry> {
  WatchOptionsMutationDeleteJournalEntry({
    String? operationName,
    required VariablesMutationDeleteJournalEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteJournalEntry? typedOptimisticResult,
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
         document: documentNodeMutationDeleteJournalEntry,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteJournalEntry,
       );
}

extension ClientExtensionMutationDeleteJournalEntry on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteJournalEntry>> mutateDeleteJournalEntry(
    OptionsMutationDeleteJournalEntry options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteJournalEntry> watchMutationDeleteJournalEntry(
    WatchOptionsMutationDeleteJournalEntry options,
  ) => this.watchMutation(options);
}

class MutationDeleteJournalEntrydeleteFromJournalEntriesCollection {
  MutationDeleteJournalEntrydeleteFromJournalEntriesCollection({
    required this.affectedCount,
    this.$__typename = 'JournalEntriesDeleteResponse',
  });

  factory MutationDeleteJournalEntrydeleteFromJournalEntriesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteJournalEntrydeleteFromJournalEntriesCollection(
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
    if (other is! MutationDeleteJournalEntrydeleteFromJournalEntriesCollection ||
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
