// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryRituals {
  QueryRituals({required this.ritualsCollection, this.$__typename = 'Query'});

  factory QueryRituals.fromJson(Map<String, dynamic> json) {
    final l$ritualsCollection = json['ritualsCollection'];
    final l$$__typename = json['__typename'];
    return QueryRituals(
      ritualsCollection: QueryRitualsritualsCollection.fromJson(
        (l$ritualsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryRitualsritualsCollection ritualsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$ritualsCollection = ritualsCollection;
    _resultData['ritualsCollection'] = l$ritualsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$ritualsCollection = ritualsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$ritualsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryRituals || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ritualsCollection = ritualsCollection;
    final lOther$ritualsCollection = other.ritualsCollection;
    if (l$ritualsCollection != lOther$ritualsCollection) {
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

const documentNodeQueryRituals = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Rituals'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'ritualsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'archivedAt'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'is'),
                            value: EnumValueNode(name: NameNode(value: 'NULL')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
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
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'cadence'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'weekday'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'atTime'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'reminder'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'ritualLogsCollection'),
                              alias: null,
                              arguments: [
                                ArgumentNode(
                                  name: NameNode(value: 'orderBy'),
                                  value: ListValueNode(
                                    values: [
                                      ObjectValueNode(
                                        fields: [
                                          ObjectFieldNode(
                                            name: NameNode(value: 'doneOn'),
                                            value: EnumValueNode(
                                              name: NameNode(value: 'DescNullsLast'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ArgumentNode(
                                  name: NameNode(value: 'first'),
                                  value: IntValueNode(value: '1'),
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
                                                name: NameNode(value: 'doneOn'),
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
QueryRituals _parserFnQueryRituals(Map<String, dynamic> data) => QueryRituals.fromJson(data);
typedef OnQueryCompleteQueryRituals = FutureOr<void> Function(Map<String, dynamic>?, QueryRituals?);

class OptionsQueryRituals extends graphql.QueryOptions<QueryRituals> {
  OptionsQueryRituals({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryRituals? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryRituals? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'Rituals',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryRituals(data)),
         onError: onError,
         document: documentNodeQueryRituals,
         parserFn: _parserFnQueryRituals,
       );

  final OnQueryCompleteQueryRituals? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryRituals extends graphql.WatchQueryOptions<QueryRituals> {
  WatchOptionsQueryRituals({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryRituals? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'Rituals',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryRituals,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryRituals,
       );
}

class FetchMoreOptionsQueryRituals extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryRituals({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryRituals);
}

extension ClientExtensionQueryRituals on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryRituals>> queryRituals([OptionsQueryRituals? options]) async =>
      await this.query(options ?? OptionsQueryRituals());

  graphql.ObservableQuery<QueryRituals> watchQueryRituals([WatchOptionsQueryRituals? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryRituals());

  void writeQueryRituals({required QueryRituals data, bool broadcast = true}) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryRituals)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryRituals? readQueryRituals({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryRituals)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryRituals.fromJson(result);
  }
}

class QueryRitualsritualsCollection {
  QueryRitualsritualsCollection({required this.edges, this.$__typename = 'RitualsConnection'});

  factory QueryRitualsritualsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryRitualsritualsCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryRitualsritualsCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryRitualsritualsCollectionedges> edges;

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
    if (other is! QueryRitualsritualsCollection || runtimeType != other.runtimeType) {
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

class QueryRitualsritualsCollectionedges {
  QueryRitualsritualsCollectionedges({required this.node, this.$__typename = 'RitualsEdge'});

  factory QueryRitualsritualsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryRitualsritualsCollectionedges(
      node: QueryRitualsritualsCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryRitualsritualsCollectionedgesnode node;

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
    if (other is! QueryRitualsritualsCollectionedges || runtimeType != other.runtimeType) {
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

class QueryRitualsritualsCollectionedgesnode {
  QueryRitualsritualsCollectionedgesnode({
    required this.id,
    required this.title,
    required this.cadence,
    this.weekday,
    this.atTime,
    required this.reminder,
    this.ritualLogsCollection,
    this.$__typename = 'Rituals',
  });

  factory QueryRitualsritualsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$cadence = json['cadence'];
    final l$weekday = json['weekday'];
    final l$atTime = json['atTime'];
    final l$reminder = json['reminder'];
    final l$ritualLogsCollection = json['ritualLogsCollection'];
    final l$$__typename = json['__typename'];
    return QueryRitualsritualsCollectionedgesnode(
      id: (l$id as String),
      title: (l$title as String),
      cadence: fromJsonEnumRitualCadence((l$cadence as String)),
      weekday: (l$weekday as int?),
      atTime: (l$atTime as String?),
      reminder: (l$reminder as bool),
      ritualLogsCollection: l$ritualLogsCollection == null
          ? null
          : QueryRitualsritualsCollectionedgesnoderitualLogsCollection.fromJson(
              (l$ritualLogsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final EnumRitualCadence cadence;

  final int? weekday;

  final String? atTime;

  final bool reminder;

  final QueryRitualsritualsCollectionedgesnoderitualLogsCollection? ritualLogsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$cadence = cadence;
    _resultData['cadence'] = toJsonEnumRitualCadence(l$cadence);
    final l$weekday = weekday;
    _resultData['weekday'] = l$weekday;
    final l$atTime = atTime;
    _resultData['atTime'] = l$atTime;
    final l$reminder = reminder;
    _resultData['reminder'] = l$reminder;
    final l$ritualLogsCollection = ritualLogsCollection;
    _resultData['ritualLogsCollection'] = l$ritualLogsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$cadence = cadence;
    final l$weekday = weekday;
    final l$atTime = atTime;
    final l$reminder = reminder;
    final l$ritualLogsCollection = ritualLogsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$cadence,
      l$weekday,
      l$atTime,
      l$reminder,
      l$ritualLogsCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryRitualsritualsCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$cadence = cadence;
    final lOther$cadence = other.cadence;
    if (l$cadence != lOther$cadence) {
      return false;
    }
    final l$weekday = weekday;
    final lOther$weekday = other.weekday;
    if (l$weekday != lOther$weekday) {
      return false;
    }
    final l$atTime = atTime;
    final lOther$atTime = other.atTime;
    if (l$atTime != lOther$atTime) {
      return false;
    }
    final l$reminder = reminder;
    final lOther$reminder = other.reminder;
    if (l$reminder != lOther$reminder) {
      return false;
    }
    final l$ritualLogsCollection = ritualLogsCollection;
    final lOther$ritualLogsCollection = other.ritualLogsCollection;
    if (l$ritualLogsCollection != lOther$ritualLogsCollection) {
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

class QueryRitualsritualsCollectionedgesnoderitualLogsCollection {
  QueryRitualsritualsCollectionedgesnoderitualLogsCollection({
    required this.edges,
    this.$__typename = 'RitualLogsConnection',
  });

  factory QueryRitualsritualsCollectionedgesnoderitualLogsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryRitualsritualsCollectionedgesnoderitualLogsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges> edges;

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
    if (other is! QueryRitualsritualsCollectionedgesnoderitualLogsCollection ||
        runtimeType != other.runtimeType) {
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

class QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges {
  QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges({
    required this.node,
    this.$__typename = 'RitualLogsEdge',
  });

  factory QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges(
      node: QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode node;

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
    if (other is! QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedges ||
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

class QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode {
  QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode({
    required this.doneOn,
    this.$__typename = 'RitualLogs',
  });

  factory QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$doneOn = json['doneOn'];
    final l$$__typename = json['__typename'];
    return QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode(
      doneOn: DateTime.parse((l$doneOn as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime doneOn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$doneOn = doneOn;
    _resultData['doneOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$doneOn);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$doneOn = doneOn;
    final l$$__typename = $__typename;
    return Object.hashAll([l$doneOn, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryRitualsritualsCollectionedgesnoderitualLogsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$doneOn = doneOn;
    final lOther$doneOn = other.doneOn;
    if (l$doneOn != lOther$doneOn) {
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
