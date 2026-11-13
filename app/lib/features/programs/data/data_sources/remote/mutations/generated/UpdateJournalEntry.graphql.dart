// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateJournalEntry {
  factory VariablesMutationUpdateJournalEntry({
    required String id,
    required String body,
    String? mood,
  }) => VariablesMutationUpdateJournalEntry._({
    r'id': id,
    r'body': body,
    if (mood != null) r'mood': mood,
  });

  VariablesMutationUpdateJournalEntry._(this._$data);

  factory VariablesMutationUpdateJournalEntry.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    if (data.containsKey('mood')) {
      final l$mood = data['mood'];
      result$data['mood'] = (l$mood as String?);
    }
    return VariablesMutationUpdateJournalEntry._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get body => (_$data['body'] as String);

  String? get mood => (_$data['mood'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$body = body;
    result$data['body'] = l$body;
    if (_$data.containsKey('mood')) {
      final l$mood = mood;
      result$data['mood'] = l$mood;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateJournalEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (_$data.containsKey('mood') != other._$data.containsKey('mood')) {
      return false;
    }
    if (l$mood != lOther$mood) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$body = body;
    final l$mood = mood;
    return Object.hashAll([l$id, l$body, _$data.containsKey('mood') ? l$mood : const {}]);
  }
}

class MutationUpdateJournalEntry {
  MutationUpdateJournalEntry({
    required this.updateJournalEntriesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateJournalEntry.fromJson(Map<String, dynamic> json) {
    final l$updateJournalEntriesCollection = json['updateJournalEntriesCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateJournalEntry(
      updateJournalEntriesCollection:
          MutationUpdateJournalEntryupdateJournalEntriesCollection.fromJson(
            (l$updateJournalEntriesCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateJournalEntryupdateJournalEntriesCollection updateJournalEntriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateJournalEntriesCollection = updateJournalEntriesCollection;
    _resultData['updateJournalEntriesCollection'] = l$updateJournalEntriesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateJournalEntriesCollection = updateJournalEntriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateJournalEntriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateJournalEntry || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateJournalEntriesCollection = updateJournalEntriesCollection;
    final lOther$updateJournalEntriesCollection = other.updateJournalEntriesCollection;
    if (l$updateJournalEntriesCollection != lOther$updateJournalEntriesCollection) {
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

const documentNodeMutationUpdateJournalEntry = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateJournalEntry'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'mood')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateJournalEntriesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'body'),
                      value: VariableNode(name: NameNode(value: 'body')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'mood'),
                      value: VariableNode(name: NameNode(value: 'mood')),
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
MutationUpdateJournalEntry _parserFnMutationUpdateJournalEntry(Map<String, dynamic> data) =>
    MutationUpdateJournalEntry.fromJson(data);
typedef OnMutationCompletedMutationUpdateJournalEntry = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateJournalEntry?,
);

class OptionsMutationUpdateJournalEntry
    extends graphql.MutationOptions<MutationUpdateJournalEntry> {
  OptionsMutationUpdateJournalEntry({
    String? operationName,
    required VariablesMutationUpdateJournalEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateJournalEntry? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateJournalEntry? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateJournalEntry>? update,
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
                 data == null ? null : _parserFnMutationUpdateJournalEntry(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateJournalEntry,
         parserFn: _parserFnMutationUpdateJournalEntry,
       );

  final OnMutationCompletedMutationUpdateJournalEntry? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateJournalEntry
    extends graphql.WatchQueryOptions<MutationUpdateJournalEntry> {
  WatchOptionsMutationUpdateJournalEntry({
    String? operationName,
    required VariablesMutationUpdateJournalEntry variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateJournalEntry? typedOptimisticResult,
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
         document: documentNodeMutationUpdateJournalEntry,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateJournalEntry,
       );
}

extension ClientExtensionMutationUpdateJournalEntry on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateJournalEntry>> mutateUpdateJournalEntry(
    OptionsMutationUpdateJournalEntry options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateJournalEntry> watchMutationUpdateJournalEntry(
    WatchOptionsMutationUpdateJournalEntry options,
  ) => this.watchMutation(options);
}

class MutationUpdateJournalEntryupdateJournalEntriesCollection {
  MutationUpdateJournalEntryupdateJournalEntriesCollection({
    required this.affectedCount,
    this.$__typename = 'JournalEntriesUpdateResponse',
  });

  factory MutationUpdateJournalEntryupdateJournalEntriesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateJournalEntryupdateJournalEntriesCollection(
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
    if (other is! MutationUpdateJournalEntryupdateJournalEntriesCollection ||
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
