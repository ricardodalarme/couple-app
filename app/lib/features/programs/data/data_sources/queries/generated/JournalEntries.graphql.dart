// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryJournalEntries {
  QueryJournalEntries({required this.journalEntriesCollection, this.$__typename = 'Query'});

  factory QueryJournalEntries.fromJson(Map<String, dynamic> json) {
    final l$journalEntriesCollection = json['journalEntriesCollection'];
    final l$$__typename = json['__typename'];
    return QueryJournalEntries(
      journalEntriesCollection: QueryJournalEntriesjournalEntriesCollection.fromJson(
        (l$journalEntriesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryJournalEntriesjournalEntriesCollection journalEntriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$journalEntriesCollection = journalEntriesCollection;
    _resultData['journalEntriesCollection'] = l$journalEntriesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$journalEntriesCollection = journalEntriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$journalEntriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryJournalEntries || runtimeType != other.runtimeType) {
      return false;
    }
    final l$journalEntriesCollection = journalEntriesCollection;
    final lOther$journalEntriesCollection = other.journalEntriesCollection;
    if (l$journalEntriesCollection != lOther$journalEntriesCollection) {
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

const documentNodeQueryJournalEntries = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'JournalEntries'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'journalEntriesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'entryDate'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'createdAt'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '100'),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
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
                              name: NameNode(value: 'entryDate'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'body'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'mood'),
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
QueryJournalEntries _parserFnQueryJournalEntries(Map<String, dynamic> data) =>
    QueryJournalEntries.fromJson(data);
typedef OnQueryCompleteQueryJournalEntries = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryJournalEntries?,
);

class OptionsQueryJournalEntries extends graphql.QueryOptions<QueryJournalEntries> {
  OptionsQueryJournalEntries({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryJournalEntries? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryJournalEntries? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryJournalEntries(data)),
         onError: onError,
         document: documentNodeQueryJournalEntries,
         parserFn: _parserFnQueryJournalEntries,
       );

  final OnQueryCompleteQueryJournalEntries? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryJournalEntries extends graphql.WatchQueryOptions<QueryJournalEntries> {
  WatchOptionsQueryJournalEntries({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryJournalEntries? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryJournalEntries,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryJournalEntries,
       );
}

class FetchMoreOptionsQueryJournalEntries extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryJournalEntries({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryJournalEntries);
}

extension ClientExtensionQueryJournalEntries on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryJournalEntries>> queryJournalEntries([
    OptionsQueryJournalEntries? options,
  ]) async => await this.query(options ?? OptionsQueryJournalEntries());

  graphql.ObservableQuery<QueryJournalEntries> watchQueryJournalEntries([
    WatchOptionsQueryJournalEntries? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryJournalEntries());

  void writeQueryJournalEntries({required QueryJournalEntries data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryJournalEntries)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryJournalEntries? readQueryJournalEntries({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryJournalEntries)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryJournalEntries.fromJson(result);
  }
}

class QueryJournalEntriesjournalEntriesCollection {
  QueryJournalEntriesjournalEntriesCollection({
    required this.edges,
    this.$__typename = 'JournalEntriesConnection',
  });

  factory QueryJournalEntriesjournalEntriesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryJournalEntriesjournalEntriesCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryJournalEntriesjournalEntriesCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryJournalEntriesjournalEntriesCollectionedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryJournalEntriesjournalEntriesCollection || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
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

class QueryJournalEntriesjournalEntriesCollectionedges {
  QueryJournalEntriesjournalEntriesCollectionedges({
    required this.node,
    this.$__typename = 'JournalEntriesEdge',
  });

  factory QueryJournalEntriesjournalEntriesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryJournalEntriesjournalEntriesCollectionedges(
      node: QueryJournalEntriesjournalEntriesCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryJournalEntriesjournalEntriesCollectionedgesnode node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryJournalEntriesjournalEntriesCollectionedges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

class QueryJournalEntriesjournalEntriesCollectionedgesnode {
  QueryJournalEntriesjournalEntriesCollectionedgesnode({
    required this.id,
    required this.entryDate,
    required this.body,
    this.mood,
    this.$__typename = 'JournalEntries',
  });

  factory QueryJournalEntriesjournalEntriesCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entryDate = json['entryDate'];
    final l$body = json['body'];
    final l$mood = json['mood'];
    final l$$__typename = json['__typename'];
    return QueryJournalEntriesjournalEntriesCollectionedgesnode(
      id: (l$id as String),
      entryDate: DateTime.parse((l$entryDate as String)),
      body: (l$body as String),
      mood: (l$mood as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime entryDate;

  final String body;

  final String? mood;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entryDate = entryDate;
    _resultData['entryDate'] = ((v) => v.toIso8601String().substring(0, 10))(l$entryDate);
    final l$body = body;
    _resultData['body'] = l$body;
    final l$mood = mood;
    _resultData['mood'] = l$mood;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entryDate = entryDate;
    final l$body = body;
    final l$mood = mood;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$entryDate, l$body, l$mood, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryJournalEntriesjournalEntriesCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entryDate = entryDate;
    final lOther$entryDate = other.entryDate;
    if (l$entryDate != lOther$entryDate) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (l$mood != lOther$mood) {
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
