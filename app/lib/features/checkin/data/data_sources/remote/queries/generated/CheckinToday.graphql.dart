// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryCheckinToday {
  QueryCheckinToday({this.today, this.myProfile, this.myCouple, this.$__typename = 'Query'});

  factory QueryCheckinToday.fromJson(Map<String, dynamic> json) {
    final l$today = json['today'];
    final l$myProfile = json['myProfile'];
    final l$myCouple = json['myCouple'];
    final l$$__typename = json['__typename'];
    return QueryCheckinToday(
      today: l$today == null
          ? null
          : QueryCheckinTodaytoday.fromJson((l$today as Map<String, dynamic>)),
      myProfile: l$myProfile == null
          ? null
          : QueryCheckinTodaymyProfile.fromJson((l$myProfile as Map<String, dynamic>)),
      myCouple: l$myCouple == null
          ? null
          : QueryCheckinTodaymyCouple.fromJson((l$myCouple as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCheckinTodaytoday? today;

  final QueryCheckinTodaymyProfile? myProfile;

  final QueryCheckinTodaymyCouple? myCouple;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$today = today;
    _resultData['today'] = l$today?.toJson();
    final l$myProfile = myProfile;
    _resultData['myProfile'] = l$myProfile?.toJson();
    final l$myCouple = myCouple;
    _resultData['myCouple'] = l$myCouple?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$today = today;
    final l$myProfile = myProfile;
    final l$myCouple = myCouple;
    final l$$__typename = $__typename;
    return Object.hashAll([l$today, l$myProfile, l$myCouple, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCheckinToday || runtimeType != other.runtimeType) {
      return false;
    }
    final l$today = today;
    final lOther$today = other.today;
    if (l$today != lOther$today) {
      return false;
    }
    final l$myProfile = myProfile;
    final lOther$myProfile = other.myProfile;
    if (l$myProfile != lOther$myProfile) {
      return false;
    }
    final l$myCouple = myCouple;
    final lOther$myCouple = other.myCouple;
    if (l$myCouple != lOther$myCouple) {
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

const documentNodeQueryCheckinToday = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CheckinToday'),
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
                  name: NameNode(value: 'isPaired'),
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
            name: NameNode(value: 'myProfile'),
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
            name: NameNode(value: 'myCouple'),
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
QueryCheckinToday _parserFnQueryCheckinToday(Map<String, dynamic> data) =>
    QueryCheckinToday.fromJson(data);
typedef OnQueryCompleteQueryCheckinToday = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryCheckinToday?,
);

class OptionsQueryCheckinToday extends graphql.QueryOptions<QueryCheckinToday> {
  OptionsQueryCheckinToday({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCheckinToday? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryCheckinToday? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'CheckinToday',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryCheckinToday(data)),
         onError: onError,
         document: documentNodeQueryCheckinToday,
         parserFn: _parserFnQueryCheckinToday,
       );

  final OnQueryCompleteQueryCheckinToday? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryCheckinToday extends graphql.WatchQueryOptions<QueryCheckinToday> {
  WatchOptionsQueryCheckinToday({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCheckinToday? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'CheckinToday',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryCheckinToday,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryCheckinToday,
       );
}

class FetchMoreOptionsQueryCheckinToday extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryCheckinToday({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryCheckinToday);
}

extension ClientExtensionQueryCheckinToday on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryCheckinToday>> queryCheckinToday([
    OptionsQueryCheckinToday? options,
  ]) async => await this.query(options ?? OptionsQueryCheckinToday());

  graphql.ObservableQuery<QueryCheckinToday> watchQueryCheckinToday([
    WatchOptionsQueryCheckinToday? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryCheckinToday());

  void writeQueryCheckinToday({required QueryCheckinToday data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryCheckinToday)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryCheckinToday? readQueryCheckinToday({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryCheckinToday)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryCheckinToday.fromJson(result);
  }
}

class QueryCheckinTodaytoday {
  QueryCheckinTodaytoday({
    this.localDate,
    this.partnerName,
    this.isPaired,
    this.$__typename = 'TodayState',
  });

  factory QueryCheckinTodaytoday.fromJson(Map<String, dynamic> json) {
    final l$localDate = json['localDate'];
    final l$partnerName = json['partnerName'];
    final l$isPaired = json['isPaired'];
    final l$$__typename = json['__typename'];
    return QueryCheckinTodaytoday(
      localDate: l$localDate == null ? null : DateTime.parse((l$localDate as String)),
      partnerName: (l$partnerName as String?),
      isPaired: (l$isPaired as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime? localDate;

  final String? partnerName;

  final bool? isPaired;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$localDate = localDate;
    _resultData['localDate'] = l$localDate == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$localDate);
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$isPaired = isPaired;
    _resultData['isPaired'] = l$isPaired;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$localDate = localDate;
    final l$partnerName = partnerName;
    final l$isPaired = isPaired;
    final l$$__typename = $__typename;
    return Object.hashAll([l$localDate, l$partnerName, l$isPaired, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCheckinTodaytoday || runtimeType != other.runtimeType) {
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
    final l$isPaired = isPaired;
    final lOther$isPaired = other.isPaired;
    if (l$isPaired != lOther$isPaired) {
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

class QueryCheckinTodaymyProfile {
  QueryCheckinTodaymyProfile({required this.id, this.$__typename = 'Profiles'});

  factory QueryCheckinTodaymyProfile.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryCheckinTodaymyProfile(id: (l$id as String), $__typename: (l$$__typename as String));
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCheckinTodaymyProfile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

class QueryCheckinTodaymyCouple {
  QueryCheckinTodaymyCouple({required this.id, this.$__typename = 'Couples'});

  factory QueryCheckinTodaymyCouple.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryCheckinTodaymyCouple(id: (l$id as String), $__typename: (l$$__typename as String));
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCheckinTodaymyCouple || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
