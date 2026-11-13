// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyNotificationSettings {
  QueryMyNotificationSettings({this.myNotificationSettings, this.$__typename = 'Query'});

  factory QueryMyNotificationSettings.fromJson(Map<String, dynamic> json) {
    final l$myNotificationSettings = json['myNotificationSettings'];
    final l$$__typename = json['__typename'];
    return QueryMyNotificationSettings(
      myNotificationSettings: l$myNotificationSettings == null
          ? null
          : QueryMyNotificationSettingsmyNotificationSettings.fromJson(
              (l$myNotificationSettings as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyNotificationSettingsmyNotificationSettings? myNotificationSettings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myNotificationSettings = myNotificationSettings;
    _resultData['myNotificationSettings'] = l$myNotificationSettings?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myNotificationSettings = myNotificationSettings;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myNotificationSettings, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyNotificationSettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myNotificationSettings = myNotificationSettings;
    final lOther$myNotificationSettings = other.myNotificationSettings;
    if (l$myNotificationSettings != lOther$myNotificationSettings) {
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

const documentNodeQueryMyNotificationSettings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyNotificationSettings'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myNotificationSettings'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'enabled'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'discreet'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardDay'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardHour'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mutedTypes'),
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
QueryMyNotificationSettings _parserFnQueryMyNotificationSettings(Map<String, dynamic> data) =>
    QueryMyNotificationSettings.fromJson(data);
typedef OnQueryCompleteQueryMyNotificationSettings = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyNotificationSettings?,
);

class OptionsQueryMyNotificationSettings extends graphql.QueryOptions<QueryMyNotificationSettings> {
  OptionsQueryMyNotificationSettings({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyNotificationSettings? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyNotificationSettings? onComplete,
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
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFnQueryMyNotificationSettings(data),
               ),
         onError: onError,
         document: documentNodeQueryMyNotificationSettings,
         parserFn: _parserFnQueryMyNotificationSettings,
       );

  final OnQueryCompleteQueryMyNotificationSettings? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyNotificationSettings
    extends graphql.WatchQueryOptions<QueryMyNotificationSettings> {
  WatchOptionsQueryMyNotificationSettings({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyNotificationSettings? typedOptimisticResult,
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
         document: documentNodeQueryMyNotificationSettings,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyNotificationSettings,
       );
}

class FetchMoreOptionsQueryMyNotificationSettings extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyNotificationSettings({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyNotificationSettings);
}

extension ClientExtensionQueryMyNotificationSettings on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyNotificationSettings>> queryMyNotificationSettings([
    OptionsQueryMyNotificationSettings? options,
  ]) async => await this.query(options ?? OptionsQueryMyNotificationSettings());

  graphql.ObservableQuery<QueryMyNotificationSettings> watchQueryMyNotificationSettings([
    WatchOptionsQueryMyNotificationSettings? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMyNotificationSettings());

  void writeQueryMyNotificationSettings({
    required QueryMyNotificationSettings data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyNotificationSettings),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMyNotificationSettings? readQueryMyNotificationSettings({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyNotificationSettings),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyNotificationSettings.fromJson(result);
  }
}

class QueryMyNotificationSettingsmyNotificationSettings {
  QueryMyNotificationSettingsmyNotificationSettings({
    required this.enabled,
    required this.discreet,
    required this.cardDay,
    required this.cardHour,
    required this.mutedTypes,
    this.$__typename = 'NotificationSettings',
  });

  factory QueryMyNotificationSettingsmyNotificationSettings.fromJson(Map<String, dynamic> json) {
    final l$enabled = json['enabled'];
    final l$discreet = json['discreet'];
    final l$cardDay = json['cardDay'];
    final l$cardHour = json['cardHour'];
    final l$mutedTypes = json['mutedTypes'];
    final l$$__typename = json['__typename'];
    return QueryMyNotificationSettingsmyNotificationSettings(
      enabled: (l$enabled as bool),
      discreet: (l$discreet as bool),
      cardDay: (l$cardDay as int),
      cardHour: (l$cardHour as int),
      mutedTypes: (l$mutedTypes as List<dynamic>).map((e) => (e as String?)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final bool enabled;

  final bool discreet;

  final int cardDay;

  final int cardHour;

  final List<String?> mutedTypes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$enabled = enabled;
    _resultData['enabled'] = l$enabled;
    final l$discreet = discreet;
    _resultData['discreet'] = l$discreet;
    final l$cardDay = cardDay;
    _resultData['cardDay'] = l$cardDay;
    final l$cardHour = cardHour;
    _resultData['cardHour'] = l$cardHour;
    final l$mutedTypes = mutedTypes;
    _resultData['mutedTypes'] = l$mutedTypes.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$enabled = enabled;
    final l$discreet = discreet;
    final l$cardDay = cardDay;
    final l$cardHour = cardHour;
    final l$mutedTypes = mutedTypes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$enabled,
      l$discreet,
      l$cardDay,
      l$cardHour,
      Object.hashAll(l$mutedTypes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyNotificationSettingsmyNotificationSettings ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) {
      return false;
    }
    final l$discreet = discreet;
    final lOther$discreet = other.discreet;
    if (l$discreet != lOther$discreet) {
      return false;
    }
    final l$cardDay = cardDay;
    final lOther$cardDay = other.cardDay;
    if (l$cardDay != lOther$cardDay) {
      return false;
    }
    final l$cardHour = cardHour;
    final lOther$cardHour = other.cardHour;
    if (l$cardHour != lOther$cardHour) {
      return false;
    }
    final l$mutedTypes = mutedTypes;
    final lOther$mutedTypes = other.mutedTypes;
    if (l$mutedTypes.length != lOther$mutedTypes.length) {
      return false;
    }
    for (int i = 0; i < l$mutedTypes.length; i++) {
      final l$mutedTypes$entry = l$mutedTypes[i];
      final lOther$mutedTypes$entry = lOther$mutedTypes[i];
      if (l$mutedTypes$entry != lOther$mutedTypes$entry) {
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
