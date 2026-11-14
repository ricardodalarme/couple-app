// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryTodayMood {
  QueryTodayMood({this.today, required this.moodsCollection, this.$__typename = 'Query'});

  factory QueryTodayMood.fromJson(Map<String, dynamic> json) {
    final l$today = json['today'];
    final l$moodsCollection = json['moodsCollection'];
    final l$$__typename = json['__typename'];
    return QueryTodayMood(
      today: l$today == null
          ? null
          : QueryTodayMoodtoday.fromJson((l$today as Map<String, dynamic>)),
      moodsCollection: QueryTodayMoodmoodsCollection.fromJson(
        (l$moodsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryTodayMoodtoday? today;

  final QueryTodayMoodmoodsCollection moodsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$today = today;
    _resultData['today'] = l$today?.toJson();
    final l$moodsCollection = moodsCollection;
    _resultData['moodsCollection'] = l$moodsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$today = today;
    final l$moodsCollection = moodsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$today, l$moodsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayMood || runtimeType != other.runtimeType) {
      return false;
    }
    final l$today = today;
    final lOther$today = other.today;
    if (l$today != lOther$today) {
      return false;
    }
    final l$moodsCollection = moodsCollection;
    final lOther$moodsCollection = other.moodsCollection;
    if (l$moodsCollection != lOther$moodsCollection) {
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

const documentNodeQueryTodayMood = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'TodayMood'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'today'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'localDate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerName'),
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
            name: NameNode(value: 'moodsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'day'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
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
                              name: NameNode(value: 'day'),
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
                              name: NameNode(value: 'need'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'share'),
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
QueryTodayMood _parserFnQueryTodayMood(Map<String, dynamic> data) => QueryTodayMood.fromJson(data);
typedef OnQueryCompleteQueryTodayMood = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryTodayMood?,
);

class OptionsQueryTodayMood extends graphql.QueryOptions<QueryTodayMood> {
  OptionsQueryTodayMood({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryTodayMood? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryTodayMood? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'TodayMood',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryTodayMood(data)),
         onError: onError,
         document: documentNodeQueryTodayMood,
         parserFn: _parserFnQueryTodayMood,
       );

  final OnQueryCompleteQueryTodayMood? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryTodayMood extends graphql.WatchQueryOptions<QueryTodayMood> {
  WatchOptionsQueryTodayMood({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryTodayMood? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'TodayMood',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryTodayMood,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryTodayMood,
       );
}

class FetchMoreOptionsQueryTodayMood extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryTodayMood({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryTodayMood);
}

extension ClientExtensionQueryTodayMood on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryTodayMood>> queryTodayMood([
    OptionsQueryTodayMood? options,
  ]) async => await this.query(options ?? OptionsQueryTodayMood());

  graphql.ObservableQuery<QueryTodayMood> watchQueryTodayMood([
    WatchOptionsQueryTodayMood? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryTodayMood());

  void writeQueryTodayMood({required QueryTodayMood data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryTodayMood)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryTodayMood? readQueryTodayMood({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryTodayMood)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryTodayMood.fromJson(result);
  }
}

class QueryTodayMoodtoday {
  QueryTodayMoodtoday({this.localDate, this.partnerName, this.$__typename = 'TodayState'});

  factory QueryTodayMoodtoday.fromJson(Map<String, dynamic> json) {
    final l$localDate = json['localDate'];
    final l$partnerName = json['partnerName'];
    final l$$__typename = json['__typename'];
    return QueryTodayMoodtoday(
      localDate: l$localDate == null ? null : DateTime.parse((l$localDate as String)),
      partnerName: (l$partnerName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime? localDate;

  final String? partnerName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$localDate = localDate;
    _resultData['localDate'] = l$localDate == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$localDate);
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$localDate = localDate;
    final l$partnerName = partnerName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$localDate, l$partnerName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayMoodtoday || runtimeType != other.runtimeType) {
      return false;
    }
    final l$localDate = localDate;
    final lOther$localDate = other.localDate;
    if (l$localDate != lOther$localDate) {
      return false;
    }
    final l$partnerName = partnerName;
    final lOther$partnerName = other.partnerName;
    if (l$partnerName != lOther$partnerName) {
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

class QueryTodayMoodmoodsCollection {
  QueryTodayMoodmoodsCollection({required this.edges, this.$__typename = 'MoodsConnection'});

  factory QueryTodayMoodmoodsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryTodayMoodmoodsCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryTodayMoodmoodsCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryTodayMoodmoodsCollectionedges> edges;

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
    if (other is! QueryTodayMoodmoodsCollection || runtimeType != other.runtimeType) {
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

class QueryTodayMoodmoodsCollectionedges {
  QueryTodayMoodmoodsCollectionedges({required this.node, this.$__typename = 'MoodsEdge'});

  factory QueryTodayMoodmoodsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryTodayMoodmoodsCollectionedges(
      node: QueryTodayMoodmoodsCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryTodayMoodmoodsCollectionedgesnode node;

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
    if (other is! QueryTodayMoodmoodsCollectionedges || runtimeType != other.runtimeType) {
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

class QueryTodayMoodmoodsCollectionedgesnode {
  QueryTodayMoodmoodsCollectionedgesnode({
    required this.id,
    required this.day,
    required this.mood,
    this.need,
    required this.share,
    this.$__typename = 'Moods',
  });

  factory QueryTodayMoodmoodsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$day = json['day'];
    final l$mood = json['mood'];
    final l$need = json['need'];
    final l$share = json['share'];
    final l$$__typename = json['__typename'];
    return QueryTodayMoodmoodsCollectionedgesnode(
      id: (l$id as String),
      day: DateTime.parse((l$day as String)),
      mood: fromJsonEnumMood((l$mood as String)),
      need: l$need == null ? null : fromJsonEnumMoodNeed((l$need as String)),
      share: fromJsonEnumMoodShare((l$share as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime day;

  final EnumMood mood;

  final EnumMoodNeed? need;

  final EnumMoodShare share;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$day = day;
    _resultData['day'] = ((v) => v.toIso8601String().substring(0, 10))(l$day);
    final l$mood = mood;
    _resultData['mood'] = toJsonEnumMood(l$mood);
    final l$need = need;
    _resultData['need'] = l$need == null ? null : toJsonEnumMoodNeed(l$need);
    final l$share = share;
    _resultData['share'] = toJsonEnumMoodShare(l$share);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$day = day;
    final l$mood = mood;
    final l$need = need;
    final l$share = share;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$day, l$mood, l$need, l$share, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayMoodmoodsCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (l$mood != lOther$mood) {
      return false;
    }
    final l$need = need;
    final lOther$need = other.need;
    if (l$need != lOther$need) {
      return false;
    }
    final l$share = share;
    final lOther$share = other.share;
    if (l$share != lOther$share) {
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
