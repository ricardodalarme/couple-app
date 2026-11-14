// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMySettings {
  QueryMySettings({this.mySettings, this.$__typename = 'Query'});

  factory QueryMySettings.fromJson(Map<String, dynamic> json) {
    final l$mySettings = json['mySettings'];
    final l$$__typename = json['__typename'];
    return QueryMySettings(
      mySettings: l$mySettings == null
          ? null
          : QueryMySettingsmySettings.fromJson((l$mySettings as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMySettingsmySettings? mySettings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mySettings = mySettings;
    _resultData['mySettings'] = l$mySettings?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mySettings = mySettings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$mySettings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$mySettings = mySettings;
    final lOther$mySettings = other.mySettings;
    if (l$mySettings != lOther$mySettings) {
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

const documentNodeQueryMySettings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MySettings'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'mySettings'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'profileId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'theme'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'timeZone'),
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
                  name: NameNode(value: 'togetherSince'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'relationshipStatus'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'onboardedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'shareReadReceipts'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'widgetInDiscreet'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'heavyDaySharing'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'phase'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'goals'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'locale'),
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
QueryMySettings _parserFnQueryMySettings(Map<String, dynamic> data) =>
    QueryMySettings.fromJson(data);
typedef OnQueryCompleteQueryMySettings = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMySettings?,
);

class OptionsQueryMySettings extends graphql.QueryOptions<QueryMySettings> {
  OptionsQueryMySettings({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMySettings? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMySettings? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMySettings(data)),
         onError: onError,
         document: documentNodeQueryMySettings,
         parserFn: _parserFnQueryMySettings,
       );

  final OnQueryCompleteQueryMySettings? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMySettings extends graphql.WatchQueryOptions<QueryMySettings> {
  WatchOptionsQueryMySettings({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMySettings? typedOptimisticResult,
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
         document: documentNodeQueryMySettings,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMySettings,
       );
}

class FetchMoreOptionsQueryMySettings extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMySettings({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMySettings);
}

extension ClientExtensionQueryMySettings on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMySettings>> queryMySettings([
    OptionsQueryMySettings? options,
  ]) async => await this.query(options ?? OptionsQueryMySettings());

  graphql.ObservableQuery<QueryMySettings> watchQueryMySettings([
    WatchOptionsQueryMySettings? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMySettings());

  void writeQueryMySettings({required QueryMySettings data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMySettings)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMySettings? readQueryMySettings({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMySettings)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMySettings.fromJson(result);
  }
}

class QueryMySettingsmySettings {
  QueryMySettingsmySettings({
    required this.profileId,
    required this.theme,
    required this.timeZone,
    this.partnerName,
    this.togetherSince,
    required this.relationshipStatus,
    this.onboardedAt,
    required this.shareReadReceipts,
    required this.widgetInDiscreet,
    required this.heavyDaySharing,
    this.phase,
    required this.goals,
    required this.locale,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryMySettingsmySettings.fromJson(Map<String, dynamic> json) {
    final l$profileId = json['profileId'];
    final l$theme = json['theme'];
    final l$timeZone = json['timeZone'];
    final l$partnerName = json['partnerName'];
    final l$togetherSince = json['togetherSince'];
    final l$relationshipStatus = json['relationshipStatus'];
    final l$onboardedAt = json['onboardedAt'];
    final l$shareReadReceipts = json['shareReadReceipts'];
    final l$widgetInDiscreet = json['widgetInDiscreet'];
    final l$heavyDaySharing = json['heavyDaySharing'];
    final l$phase = json['phase'];
    final l$goals = json['goals'];
    final l$locale = json['locale'];
    final l$$__typename = json['__typename'];
    return QueryMySettingsmySettings(
      profileId: (l$profileId as String),
      theme: fromJsonEnumAppTheme((l$theme as String)),
      timeZone: (l$timeZone as String),
      partnerName: (l$partnerName as String?),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      relationshipStatus: fromJsonEnumRelationshipStatus((l$relationshipStatus as String)),
      onboardedAt: l$onboardedAt == null ? null : DateTime.parse((l$onboardedAt as String)),
      shareReadReceipts: (l$shareReadReceipts as bool),
      widgetInDiscreet: (l$widgetInDiscreet as bool),
      heavyDaySharing: fromJsonEnumHeavyDaySharing((l$heavyDaySharing as String)),
      phase: l$phase == null ? null : fromJsonEnumRelationshipPhase((l$phase as String)),
      goals: (l$goals as List<dynamic>).map((e) => (e as String?)).toList(),
      locale: (l$locale as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String profileId;

  final EnumAppTheme theme;

  final String timeZone;

  final String? partnerName;

  final DateTime? togetherSince;

  final EnumRelationshipStatus relationshipStatus;

  final DateTime? onboardedAt;

  final bool shareReadReceipts;

  final bool widgetInDiscreet;

  final EnumHeavyDaySharing heavyDaySharing;

  final EnumRelationshipPhase? phase;

  final List<String?> goals;

  final String locale;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$theme = theme;
    _resultData['theme'] = toJsonEnumAppTheme(l$theme);
    final l$timeZone = timeZone;
    _resultData['timeZone'] = l$timeZone;
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$relationshipStatus = relationshipStatus;
    _resultData['relationshipStatus'] = toJsonEnumRelationshipStatus(l$relationshipStatus);
    final l$onboardedAt = onboardedAt;
    _resultData['onboardedAt'] = l$onboardedAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$onboardedAt);
    final l$shareReadReceipts = shareReadReceipts;
    _resultData['shareReadReceipts'] = l$shareReadReceipts;
    final l$widgetInDiscreet = widgetInDiscreet;
    _resultData['widgetInDiscreet'] = l$widgetInDiscreet;
    final l$heavyDaySharing = heavyDaySharing;
    _resultData['heavyDaySharing'] = toJsonEnumHeavyDaySharing(l$heavyDaySharing);
    final l$phase = phase;
    _resultData['phase'] = l$phase == null ? null : toJsonEnumRelationshipPhase(l$phase);
    final l$goals = goals;
    _resultData['goals'] = l$goals.map((e) => e).toList();
    final l$locale = locale;
    _resultData['locale'] = l$locale;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$theme = theme;
    final l$timeZone = timeZone;
    final l$partnerName = partnerName;
    final l$togetherSince = togetherSince;
    final l$relationshipStatus = relationshipStatus;
    final l$onboardedAt = onboardedAt;
    final l$shareReadReceipts = shareReadReceipts;
    final l$widgetInDiscreet = widgetInDiscreet;
    final l$heavyDaySharing = heavyDaySharing;
    final l$phase = phase;
    final l$goals = goals;
    final l$locale = locale;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$profileId,
      l$theme,
      l$timeZone,
      l$partnerName,
      l$togetherSince,
      l$relationshipStatus,
      l$onboardedAt,
      l$shareReadReceipts,
      l$widgetInDiscreet,
      l$heavyDaySharing,
      l$phase,
      Object.hashAll(l$goals.map((v) => v)),
      l$locale,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySettingsmySettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (l$theme != lOther$theme) {
      return false;
    }
    final l$timeZone = timeZone;
    final lOther$timeZone = other.timeZone;
    if (l$timeZone != lOther$timeZone) {
      return false;
    }
    final l$partnerName = partnerName;
    final lOther$partnerName = other.partnerName;
    if (l$partnerName != lOther$partnerName) {
      return false;
    }
    final l$togetherSince = togetherSince;
    final lOther$togetherSince = other.togetherSince;
    if (l$togetherSince != lOther$togetherSince) {
      return false;
    }
    final l$relationshipStatus = relationshipStatus;
    final lOther$relationshipStatus = other.relationshipStatus;
    if (l$relationshipStatus != lOther$relationshipStatus) {
      return false;
    }
    final l$onboardedAt = onboardedAt;
    final lOther$onboardedAt = other.onboardedAt;
    if (l$onboardedAt != lOther$onboardedAt) {
      return false;
    }
    final l$shareReadReceipts = shareReadReceipts;
    final lOther$shareReadReceipts = other.shareReadReceipts;
    if (l$shareReadReceipts != lOther$shareReadReceipts) {
      return false;
    }
    final l$widgetInDiscreet = widgetInDiscreet;
    final lOther$widgetInDiscreet = other.widgetInDiscreet;
    if (l$widgetInDiscreet != lOther$widgetInDiscreet) {
      return false;
    }
    final l$heavyDaySharing = heavyDaySharing;
    final lOther$heavyDaySharing = other.heavyDaySharing;
    if (l$heavyDaySharing != lOther$heavyDaySharing) {
      return false;
    }
    final l$phase = phase;
    final lOther$phase = other.phase;
    if (l$phase != lOther$phase) {
      return false;
    }
    final l$goals = goals;
    final lOther$goals = other.goals;
    if (l$goals.length != lOther$goals.length) {
      return false;
    }
    for (int i = 0; i < l$goals.length; i++) {
      final l$goals$entry = l$goals[i];
      final lOther$goals$entry = lOther$goals[i];
      if (l$goals$entry != lOther$goals$entry) {
        return false;
      }
    }
    final l$locale = locale;
    final lOther$locale = other.locale;
    if (l$locale != lOther$locale) {
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
