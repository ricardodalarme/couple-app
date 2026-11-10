// dart format width=100
import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';

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
                  name: NameNode(value: 'theme'),
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
                  name: NameNode(value: 'onboardedAt'),
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
    required this.theme,
    this.partnerName,
    this.togetherSince,
    this.onboardedAt,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryMySettingsmySettings.fromJson(Map<String, dynamic> json) {
    final l$theme = json['theme'];
    final l$partnerName = json['partnerName'];
    final l$togetherSince = json['togetherSince'];
    final l$onboardedAt = json['onboardedAt'];
    final l$$__typename = json['__typename'];
    return QueryMySettingsmySettings(
      theme: fromJsonEnumAppTheme((l$theme as String)),
      partnerName: (l$partnerName as String?),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      onboardedAt: l$onboardedAt == null ? null : DateTime.parse((l$onboardedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final EnumAppTheme theme;

  final String? partnerName;

  final DateTime? togetherSince;

  final DateTime? onboardedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$theme = theme;
    _resultData['theme'] = toJsonEnumAppTheme(l$theme);
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$onboardedAt = onboardedAt;
    _resultData['onboardedAt'] = l$onboardedAt?.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$theme = theme;
    final l$partnerName = partnerName;
    final l$togetherSince = togetherSince;
    final l$onboardedAt = onboardedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$theme, l$partnerName, l$togetherSince, l$onboardedAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySettingsmySettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (l$theme != lOther$theme) {
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
    final l$onboardedAt = onboardedAt;
    final lOther$onboardedAt = other.onboardedAt;
    if (l$onboardedAt != lOther$onboardedAt) {
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
