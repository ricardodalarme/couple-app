// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryTodayHome {
  QueryTodayHome({
    this.today,
    this.question,
    this.idea,
    this.partnerMoodToday,
    required this.myMood,
    this.$__typename = 'Query',
  });

  factory QueryTodayHome.fromJson(Map<String, dynamic> json) {
    final l$today = json['today'];
    final l$question = json['question'];
    final l$idea = json['idea'];
    final l$partnerMoodToday = json['partnerMoodToday'];
    final l$myMood = json['myMood'];
    final l$$__typename = json['__typename'];
    return QueryTodayHome(
      today: l$today == null
          ? null
          : QueryTodayHometoday.fromJson((l$today as Map<String, dynamic>)),
      question: l$question == null
          ? null
          : QueryTodayHomequestion.fromJson((l$question as Map<String, dynamic>)),
      idea: l$idea == null ? null : QueryTodayHomeidea.fromJson((l$idea as Map<String, dynamic>)),
      partnerMoodToday: l$partnerMoodToday == null
          ? null
          : QueryTodayHomepartnerMoodToday.fromJson((l$partnerMoodToday as Map<String, dynamic>)),
      myMood: QueryTodayHomemyMood.fromJson((l$myMood as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryTodayHometoday? today;

  final QueryTodayHomequestion? question;

  final QueryTodayHomeidea? idea;

  final QueryTodayHomepartnerMoodToday? partnerMoodToday;

  final QueryTodayHomemyMood myMood;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$today = today;
    _resultData['today'] = l$today?.toJson();
    final l$question = question;
    _resultData['question'] = l$question?.toJson();
    final l$idea = idea;
    _resultData['idea'] = l$idea?.toJson();
    final l$partnerMoodToday = partnerMoodToday;
    _resultData['partnerMoodToday'] = l$partnerMoodToday?.toJson();
    final l$myMood = myMood;
    _resultData['myMood'] = l$myMood.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$today = today;
    final l$question = question;
    final l$idea = idea;
    final l$partnerMoodToday = partnerMoodToday;
    final l$myMood = myMood;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$today,
      l$question,
      l$idea,
      l$partnerMoodToday,
      l$myMood,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayHome || runtimeType != other.runtimeType) {
      return false;
    }
    final l$today = today;
    final lOther$today = other.today;
    if (l$today != lOther$today) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$idea = idea;
    final lOther$idea = other.idea;
    if (l$idea != lOther$idea) {
      return false;
    }
    final l$partnerMoodToday = partnerMoodToday;
    final lOther$partnerMoodToday = other.partnerMoodToday;
    if (l$partnerMoodToday != lOther$partnerMoodToday) {
      return false;
    }
    final l$myMood = myMood;
    final lOther$myMood = other.myMood;
    if (l$myMood != lOther$myMood) {
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

const documentNodeQueryTodayHome = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'TodayHome'),
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
                  name: NameNode(value: 'isPaired'),
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
                  name: NameNode(value: 'localDate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardStatus'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'unopenedCards'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slipsThisWeek'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slipsTotal'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hasPendingInvite'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'togetherSince'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'pauseIsMine'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'pauseReturnAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hasPlus'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'unseenSignals'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slipDays'),
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
            name: NameNode(value: 'dailyContent'),
            alias: NameNode(value: 'question'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: StringValueNode(value: 'question', isBlock: false),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'slug'),
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
                  name: NameNode(value: 'tags'),
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
            name: NameNode(value: 'dailyContent'),
            alias: NameNode(value: 'idea'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: StringValueNode(value: 'daily_idea', isBlock: false),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'slug'),
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
                  name: NameNode(value: 'body'),
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
            name: NameNode(value: 'partnerMoodToday'),
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
            alias: NameNode(value: 'myMood'),
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
QueryTodayHome _parserFnQueryTodayHome(Map<String, dynamic> data) => QueryTodayHome.fromJson(data);
typedef OnQueryCompleteQueryTodayHome = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryTodayHome?,
);

class OptionsQueryTodayHome extends graphql.QueryOptions<QueryTodayHome> {
  OptionsQueryTodayHome({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryTodayHome? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryTodayHome? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'TodayHome',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryTodayHome(data)),
         onError: onError,
         document: documentNodeQueryTodayHome,
         parserFn: _parserFnQueryTodayHome,
       );

  final OnQueryCompleteQueryTodayHome? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryTodayHome extends graphql.WatchQueryOptions<QueryTodayHome> {
  WatchOptionsQueryTodayHome({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryTodayHome? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'TodayHome',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryTodayHome,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryTodayHome,
       );
}

class FetchMoreOptionsQueryTodayHome extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryTodayHome({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryTodayHome);
}

extension ClientExtensionQueryTodayHome on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryTodayHome>> queryTodayHome([
    OptionsQueryTodayHome? options,
  ]) async => await this.query(options ?? OptionsQueryTodayHome());

  graphql.ObservableQuery<QueryTodayHome> watchQueryTodayHome([
    WatchOptionsQueryTodayHome? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryTodayHome());

  void writeQueryTodayHome({required QueryTodayHome data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryTodayHome)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryTodayHome? readQueryTodayHome({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryTodayHome)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryTodayHome.fromJson(result);
  }
}

class QueryTodayHometoday {
  QueryTodayHometoday({
    this.isPaired,
    this.partnerName,
    this.localDate,
    this.cardStatus,
    this.unopenedCards,
    this.slipsThisWeek,
    this.slipsTotal,
    this.hasPendingInvite,
    this.togetherSince,
    this.pauseIsMine,
    this.pauseReturnAt,
    this.hasPlus,
    this.unseenSignals,
    this.slipDays,
    this.$__typename = 'TodayState',
  });

  factory QueryTodayHometoday.fromJson(Map<String, dynamic> json) {
    final l$isPaired = json['isPaired'];
    final l$partnerName = json['partnerName'];
    final l$localDate = json['localDate'];
    final l$cardStatus = json['cardStatus'];
    final l$unopenedCards = json['unopenedCards'];
    final l$slipsThisWeek = json['slipsThisWeek'];
    final l$slipsTotal = json['slipsTotal'];
    final l$hasPendingInvite = json['hasPendingInvite'];
    final l$togetherSince = json['togetherSince'];
    final l$pauseIsMine = json['pauseIsMine'];
    final l$pauseReturnAt = json['pauseReturnAt'];
    final l$hasPlus = json['hasPlus'];
    final l$unseenSignals = json['unseenSignals'];
    final l$slipDays = json['slipDays'];
    final l$$__typename = json['__typename'];
    return QueryTodayHometoday(
      isPaired: (l$isPaired as bool?),
      partnerName: (l$partnerName as String?),
      localDate: l$localDate == null ? null : DateTime.parse((l$localDate as String)),
      cardStatus: (l$cardStatus as String?),
      unopenedCards: (l$unopenedCards as int?),
      slipsThisWeek: (l$slipsThisWeek as int?),
      slipsTotal: (l$slipsTotal as int?),
      hasPendingInvite: (l$hasPendingInvite as bool?),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      pauseIsMine: (l$pauseIsMine as bool?),
      pauseReturnAt: l$pauseReturnAt == null ? null : DateTime.parse((l$pauseReturnAt as String)),
      hasPlus: (l$hasPlus as bool?),
      unseenSignals: (l$unseenSignals as int?),
      slipDays: (l$slipDays as List<dynamic>?)
          ?.map((e) => e == null ? null : DateTime.parse((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? isPaired;

  final String? partnerName;

  final DateTime? localDate;

  final String? cardStatus;

  final int? unopenedCards;

  final int? slipsThisWeek;

  final int? slipsTotal;

  final bool? hasPendingInvite;

  final DateTime? togetherSince;

  final bool? pauseIsMine;

  final DateTime? pauseReturnAt;

  final bool? hasPlus;

  final int? unseenSignals;

  final List<DateTime?>? slipDays;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$isPaired = isPaired;
    _resultData['isPaired'] = l$isPaired;
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$localDate = localDate;
    _resultData['localDate'] = l$localDate == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$localDate);
    final l$cardStatus = cardStatus;
    _resultData['cardStatus'] = l$cardStatus;
    final l$unopenedCards = unopenedCards;
    _resultData['unopenedCards'] = l$unopenedCards;
    final l$slipsThisWeek = slipsThisWeek;
    _resultData['slipsThisWeek'] = l$slipsThisWeek;
    final l$slipsTotal = slipsTotal;
    _resultData['slipsTotal'] = l$slipsTotal;
    final l$hasPendingInvite = hasPendingInvite;
    _resultData['hasPendingInvite'] = l$hasPendingInvite;
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$pauseIsMine = pauseIsMine;
    _resultData['pauseIsMine'] = l$pauseIsMine;
    final l$pauseReturnAt = pauseReturnAt;
    _resultData['pauseReturnAt'] = l$pauseReturnAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$pauseReturnAt);
    final l$hasPlus = hasPlus;
    _resultData['hasPlus'] = l$hasPlus;
    final l$unseenSignals = unseenSignals;
    _resultData['unseenSignals'] = l$unseenSignals;
    final l$slipDays = slipDays;
    _resultData['slipDays'] = l$slipDays
        ?.map((e) => e == null ? null : ((v) => v.toIso8601String().substring(0, 10))(e))
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$isPaired = isPaired;
    final l$partnerName = partnerName;
    final l$localDate = localDate;
    final l$cardStatus = cardStatus;
    final l$unopenedCards = unopenedCards;
    final l$slipsThisWeek = slipsThisWeek;
    final l$slipsTotal = slipsTotal;
    final l$hasPendingInvite = hasPendingInvite;
    final l$togetherSince = togetherSince;
    final l$pauseIsMine = pauseIsMine;
    final l$pauseReturnAt = pauseReturnAt;
    final l$hasPlus = hasPlus;
    final l$unseenSignals = unseenSignals;
    final l$slipDays = slipDays;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$isPaired,
      l$partnerName,
      l$localDate,
      l$cardStatus,
      l$unopenedCards,
      l$slipsThisWeek,
      l$slipsTotal,
      l$hasPendingInvite,
      l$togetherSince,
      l$pauseIsMine,
      l$pauseReturnAt,
      l$hasPlus,
      l$unseenSignals,
      l$slipDays == null ? null : Object.hashAll(l$slipDays.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayHometoday || runtimeType != other.runtimeType) {
      return false;
    }
    final l$isPaired = isPaired;
    final lOther$isPaired = other.isPaired;
    if (l$isPaired != lOther$isPaired) {
      return false;
    }
    final l$partnerName = partnerName;
    final lOther$partnerName = other.partnerName;
    if (l$partnerName != lOther$partnerName) {
      return false;
    }
    final l$localDate = localDate;
    final lOther$localDate = other.localDate;
    if (l$localDate != lOther$localDate) {
      return false;
    }
    final l$cardStatus = cardStatus;
    final lOther$cardStatus = other.cardStatus;
    if (l$cardStatus != lOther$cardStatus) {
      return false;
    }
    final l$unopenedCards = unopenedCards;
    final lOther$unopenedCards = other.unopenedCards;
    if (l$unopenedCards != lOther$unopenedCards) {
      return false;
    }
    final l$slipsThisWeek = slipsThisWeek;
    final lOther$slipsThisWeek = other.slipsThisWeek;
    if (l$slipsThisWeek != lOther$slipsThisWeek) {
      return false;
    }
    final l$slipsTotal = slipsTotal;
    final lOther$slipsTotal = other.slipsTotal;
    if (l$slipsTotal != lOther$slipsTotal) {
      return false;
    }
    final l$hasPendingInvite = hasPendingInvite;
    final lOther$hasPendingInvite = other.hasPendingInvite;
    if (l$hasPendingInvite != lOther$hasPendingInvite) {
      return false;
    }
    final l$togetherSince = togetherSince;
    final lOther$togetherSince = other.togetherSince;
    if (l$togetherSince != lOther$togetherSince) {
      return false;
    }
    final l$pauseIsMine = pauseIsMine;
    final lOther$pauseIsMine = other.pauseIsMine;
    if (l$pauseIsMine != lOther$pauseIsMine) {
      return false;
    }
    final l$pauseReturnAt = pauseReturnAt;
    final lOther$pauseReturnAt = other.pauseReturnAt;
    if (l$pauseReturnAt != lOther$pauseReturnAt) {
      return false;
    }
    final l$hasPlus = hasPlus;
    final lOther$hasPlus = other.hasPlus;
    if (l$hasPlus != lOther$hasPlus) {
      return false;
    }
    final l$unseenSignals = unseenSignals;
    final lOther$unseenSignals = other.unseenSignals;
    if (l$unseenSignals != lOther$unseenSignals) {
      return false;
    }
    final l$slipDays = slipDays;
    final lOther$slipDays = other.slipDays;
    if (l$slipDays != null && lOther$slipDays != null) {
      if (l$slipDays.length != lOther$slipDays.length) {
        return false;
      }
      for (int i = 0; i < l$slipDays.length; i++) {
        final l$slipDays$entry = l$slipDays[i];
        final lOther$slipDays$entry = lOther$slipDays[i];
        if (l$slipDays$entry != lOther$slipDays$entry) {
          return false;
        }
      }
    } else if (l$slipDays != lOther$slipDays) {
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

class QueryTodayHomequestion {
  QueryTodayHomequestion({
    required this.slug,
    required this.title,
    required this.tags,
    this.$__typename = 'ContentItems',
  });

  factory QueryTodayHomequestion.fromJson(Map<String, dynamic> json) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return QueryTodayHomequestion(
      slug: (l$slug as String),
      title: (l$title as String),
      tags: (l$tags as List<dynamic>).map((e) => (e as String?)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String slug;

  final String title;

  final List<String?> tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$tags = tags;
    _resultData['tags'] = l$tags.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slug = slug;
    final l$title = title;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slug, l$title, Object.hashAll(l$tags.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayHomequestion || runtimeType != other.runtimeType) {
      return false;
    }
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (l$slug != lOther$slug) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags.length != lOther$tags.length) {
      return false;
    }
    for (int i = 0; i < l$tags.length; i++) {
      final l$tags$entry = l$tags[i];
      final lOther$tags$entry = lOther$tags[i];
      if (l$tags$entry != lOther$tags$entry) {
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

class QueryTodayHomeidea {
  QueryTodayHomeidea({
    required this.slug,
    required this.title,
    this.body,
    this.$__typename = 'ContentItems',
  });

  factory QueryTodayHomeidea.fromJson(Map<String, dynamic> json) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return QueryTodayHomeidea(
      slug: (l$slug as String),
      title: (l$title as String),
      body: (l$body as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String slug;

  final String title;

  final String? body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slug = slug;
    final l$title = title;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slug, l$title, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayHomeidea || runtimeType != other.runtimeType) {
      return false;
    }
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (l$slug != lOther$slug) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
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

class QueryTodayHomepartnerMoodToday {
  QueryTodayHomepartnerMoodToday({
    this.id,
    this.day,
    this.mood,
    this.need,
    this.$__typename = 'PartnerMood',
  });

  factory QueryTodayHomepartnerMoodToday.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$day = json['day'];
    final l$mood = json['mood'];
    final l$need = json['need'];
    final l$$__typename = json['__typename'];
    return QueryTodayHomepartnerMoodToday(
      id: (l$id as String?),
      day: l$day == null ? null : DateTime.parse((l$day as String)),
      mood: l$mood == null ? null : fromJsonEnumMood((l$mood as String)),
      need: l$need == null ? null : fromJsonEnumMoodNeed((l$need as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final DateTime? day;

  final EnumMood? mood;

  final EnumMoodNeed? need;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$day = day;
    _resultData['day'] = l$day == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$day);
    final l$mood = mood;
    _resultData['mood'] = l$mood == null ? null : toJsonEnumMood(l$mood);
    final l$need = need;
    _resultData['need'] = l$need == null ? null : toJsonEnumMoodNeed(l$need);
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
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$day, l$mood, l$need, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayHomepartnerMoodToday || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class QueryTodayHomemyMood {
  QueryTodayHomemyMood({required this.edges, this.$__typename = 'MoodsConnection'});

  factory QueryTodayHomemyMood.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryTodayHomemyMood(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryTodayHomemyMoodedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryTodayHomemyMoodedges> edges;

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
    if (other is! QueryTodayHomemyMood || runtimeType != other.runtimeType) {
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

class QueryTodayHomemyMoodedges {
  QueryTodayHomemyMoodedges({required this.node, this.$__typename = 'MoodsEdge'});

  factory QueryTodayHomemyMoodedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryTodayHomemyMoodedges(
      node: QueryTodayHomemyMoodedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryTodayHomemyMoodedgesnode node;

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
    if (other is! QueryTodayHomemyMoodedges || runtimeType != other.runtimeType) {
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

class QueryTodayHomemyMoodedgesnode {
  QueryTodayHomemyMoodedgesnode({
    required this.day,
    required this.mood,
    this.$__typename = 'Moods',
  });

  factory QueryTodayHomemyMoodedgesnode.fromJson(Map<String, dynamic> json) {
    final l$day = json['day'];
    final l$mood = json['mood'];
    final l$$__typename = json['__typename'];
    return QueryTodayHomemyMoodedgesnode(
      day: DateTime.parse((l$day as String)),
      mood: fromJsonEnumMood((l$mood as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime day;

  final EnumMood mood;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$day = day;
    _resultData['day'] = ((v) => v.toIso8601String().substring(0, 10))(l$day);
    final l$mood = mood;
    _resultData['mood'] = toJsonEnumMood(l$mood);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$day = day;
    final l$mood = mood;
    final l$$__typename = $__typename;
    return Object.hashAll([l$day, l$mood, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryTodayHomemyMoodedgesnode || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}
