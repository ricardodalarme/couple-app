// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryQuestionOfTheWeek {
  QueryQuestionOfTheWeek({
    this.question,
    this.today,
    this.myProfile,
    this.myCouple,
    this.$__typename = 'Query',
  });

  factory QueryQuestionOfTheWeek.fromJson(Map<String, dynamic> json) {
    final l$question = json['question'];
    final l$today = json['today'];
    final l$myProfile = json['myProfile'];
    final l$myCouple = json['myCouple'];
    final l$$__typename = json['__typename'];
    return QueryQuestionOfTheWeek(
      question: l$question == null
          ? null
          : QueryQuestionOfTheWeekquestion.fromJson((l$question as Map<String, dynamic>)),
      today: l$today == null
          ? null
          : QueryQuestionOfTheWeektoday.fromJson((l$today as Map<String, dynamic>)),
      myProfile: l$myProfile == null
          ? null
          : QueryQuestionOfTheWeekmyProfile.fromJson((l$myProfile as Map<String, dynamic>)),
      myCouple: l$myCouple == null
          ? null
          : QueryQuestionOfTheWeekmyCouple.fromJson((l$myCouple as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryQuestionOfTheWeekquestion? question;

  final QueryQuestionOfTheWeektoday? today;

  final QueryQuestionOfTheWeekmyProfile? myProfile;

  final QueryQuestionOfTheWeekmyCouple? myCouple;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$question = question;
    _resultData['question'] = l$question?.toJson();
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
    final l$question = question;
    final l$today = today;
    final l$myProfile = myProfile;
    final l$myCouple = myCouple;
    final l$$__typename = $__typename;
    return Object.hashAll([l$question, l$today, l$myProfile, l$myCouple, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryQuestionOfTheWeek || runtimeType != other.runtimeType) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
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

const documentNodeQueryQuestionOfTheWeek = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'QuestionOfTheWeek'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
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
                  name: NameNode(value: 'body'),
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
QueryQuestionOfTheWeek _parserFnQueryQuestionOfTheWeek(Map<String, dynamic> data) =>
    QueryQuestionOfTheWeek.fromJson(data);
typedef OnQueryCompleteQueryQuestionOfTheWeek = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryQuestionOfTheWeek?,
);

class OptionsQueryQuestionOfTheWeek extends graphql.QueryOptions<QueryQuestionOfTheWeek> {
  OptionsQueryQuestionOfTheWeek({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryQuestionOfTheWeek? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryQuestionOfTheWeek? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'QuestionOfTheWeek',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryQuestionOfTheWeek(data)),
         onError: onError,
         document: documentNodeQueryQuestionOfTheWeek,
         parserFn: _parserFnQueryQuestionOfTheWeek,
       );

  final OnQueryCompleteQueryQuestionOfTheWeek? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryQuestionOfTheWeek extends graphql.WatchQueryOptions<QueryQuestionOfTheWeek> {
  WatchOptionsQueryQuestionOfTheWeek({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryQuestionOfTheWeek? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'QuestionOfTheWeek',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryQuestionOfTheWeek,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryQuestionOfTheWeek,
       );
}

class FetchMoreOptionsQueryQuestionOfTheWeek extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryQuestionOfTheWeek({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryQuestionOfTheWeek);
}

extension ClientExtensionQueryQuestionOfTheWeek on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryQuestionOfTheWeek>> queryQuestionOfTheWeek([
    OptionsQueryQuestionOfTheWeek? options,
  ]) async => await this.query(options ?? OptionsQueryQuestionOfTheWeek());

  graphql.ObservableQuery<QueryQuestionOfTheWeek> watchQueryQuestionOfTheWeek([
    WatchOptionsQueryQuestionOfTheWeek? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryQuestionOfTheWeek());

  void writeQueryQuestionOfTheWeek({required QueryQuestionOfTheWeek data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryQuestionOfTheWeek)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryQuestionOfTheWeek? readQueryQuestionOfTheWeek({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryQuestionOfTheWeek)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryQuestionOfTheWeek.fromJson(result);
  }
}

class QueryQuestionOfTheWeekquestion {
  QueryQuestionOfTheWeekquestion({
    required this.slug,
    required this.title,
    this.body,
    required this.tags,
    this.$__typename = 'ContentItems',
  });

  factory QueryQuestionOfTheWeekquestion.fromJson(Map<String, dynamic> json) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return QueryQuestionOfTheWeekquestion(
      slug: (l$slug as String),
      title: (l$title as String),
      body: (l$body as String?),
      tags: (l$tags as List<dynamic>).map((e) => (e as String?)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String slug;

  final String title;

  final String? body;

  final List<String?> tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
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
    final l$body = body;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$slug,
      l$title,
      l$body,
      Object.hashAll(l$tags.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryQuestionOfTheWeekquestion || runtimeType != other.runtimeType) {
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

class QueryQuestionOfTheWeektoday {
  QueryQuestionOfTheWeektoday({this.isPaired, this.partnerName, this.$__typename = 'TodayState'});

  factory QueryQuestionOfTheWeektoday.fromJson(Map<String, dynamic> json) {
    final l$isPaired = json['isPaired'];
    final l$partnerName = json['partnerName'];
    final l$$__typename = json['__typename'];
    return QueryQuestionOfTheWeektoday(
      isPaired: (l$isPaired as bool?),
      partnerName: (l$partnerName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? isPaired;

  final String? partnerName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$isPaired = isPaired;
    _resultData['isPaired'] = l$isPaired;
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$isPaired = isPaired;
    final l$partnerName = partnerName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$isPaired, l$partnerName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryQuestionOfTheWeektoday || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class QueryQuestionOfTheWeekmyProfile {
  QueryQuestionOfTheWeekmyProfile({required this.id, this.$__typename = 'Profiles'});

  factory QueryQuestionOfTheWeekmyProfile.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryQuestionOfTheWeekmyProfile(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
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
    if (other is! QueryQuestionOfTheWeekmyProfile || runtimeType != other.runtimeType) {
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

class QueryQuestionOfTheWeekmyCouple {
  QueryQuestionOfTheWeekmyCouple({required this.id, this.$__typename = 'Couples'});

  factory QueryQuestionOfTheWeekmyCouple.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryQuestionOfTheWeekmyCouple(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
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
    if (other is! QueryQuestionOfTheWeekmyCouple || runtimeType != other.runtimeType) {
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
