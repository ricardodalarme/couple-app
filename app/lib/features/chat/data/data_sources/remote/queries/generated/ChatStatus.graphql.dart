// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryChatStatus {
  factory VariablesQueryChatStatus({required String profileId}) =>
      VariablesQueryChatStatus._({r'profileId': profileId});

  VariablesQueryChatStatus._(this._$data);

  factory VariablesQueryChatStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    return VariablesQueryChatStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryChatStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    return Object.hashAll([l$profileId]);
  }
}

class QueryChatStatus {
  QueryChatStatus({
    this.chatMessagesLeft,
    this.plusLimit,
    this.freeLimit,
    this.profileSettingsByPk,
    this.$__typename = 'Query',
  });

  factory QueryChatStatus.fromJson(Map<String, dynamic> json) {
    final l$chatMessagesLeft = json['chatMessagesLeft'];
    final l$plusLimit = json['plusLimit'];
    final l$freeLimit = json['freeLimit'];
    final l$profileSettingsByPk = json['profileSettingsByPk'];
    final l$$__typename = json['__typename'];
    return QueryChatStatus(
      chatMessagesLeft: (l$chatMessagesLeft as int?),
      plusLimit: l$plusLimit == null
          ? null
          : QueryChatStatusplusLimit.fromJson((l$plusLimit as Map<String, dynamic>)),
      freeLimit: l$freeLimit == null
          ? null
          : QueryChatStatusfreeLimit.fromJson((l$freeLimit as Map<String, dynamic>)),
      profileSettingsByPk: l$profileSettingsByPk == null
          ? null
          : QueryChatStatusprofileSettingsByPk.fromJson(
              (l$profileSettingsByPk as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final int? chatMessagesLeft;

  final QueryChatStatusplusLimit? plusLimit;

  final QueryChatStatusfreeLimit? freeLimit;

  final QueryChatStatusprofileSettingsByPk? profileSettingsByPk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatMessagesLeft = chatMessagesLeft;
    _resultData['chatMessagesLeft'] = l$chatMessagesLeft;
    final l$plusLimit = plusLimit;
    _resultData['plusLimit'] = l$plusLimit?.toJson();
    final l$freeLimit = freeLimit;
    _resultData['freeLimit'] = l$freeLimit?.toJson();
    final l$profileSettingsByPk = profileSettingsByPk;
    _resultData['profileSettingsByPk'] = l$profileSettingsByPk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatMessagesLeft = chatMessagesLeft;
    final l$plusLimit = plusLimit;
    final l$freeLimit = freeLimit;
    final l$profileSettingsByPk = profileSettingsByPk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chatMessagesLeft,
      l$plusLimit,
      l$freeLimit,
      l$profileSettingsByPk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatMessagesLeft = chatMessagesLeft;
    final lOther$chatMessagesLeft = other.chatMessagesLeft;
    if (l$chatMessagesLeft != lOther$chatMessagesLeft) {
      return false;
    }
    final l$plusLimit = plusLimit;
    final lOther$plusLimit = other.plusLimit;
    if (l$plusLimit != lOther$plusLimit) {
      return false;
    }
    final l$freeLimit = freeLimit;
    final lOther$freeLimit = other.freeLimit;
    if (l$freeLimit != lOther$freeLimit) {
      return false;
    }
    final l$profileSettingsByPk = profileSettingsByPk;
    final lOther$profileSettingsByPk = other.profileSettingsByPk;
    if (l$profileSettingsByPk != lOther$profileSettingsByPk) {
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

const documentNodeQueryChatStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ChatStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'chatMessagesLeft'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'appConfigByPk'),
            alias: NameNode(value: 'plusLimit'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'key'),
                value: StringValueNode(value: 'chat_messages_per_day_plus', isBlock: false),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'value'),
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
            name: NameNode(value: 'appConfigByPk'),
            alias: NameNode(value: 'freeLimit'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'key'),
                value: StringValueNode(value: 'chat_messages_per_day_free', isBlock: false),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'value'),
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
            name: NameNode(value: 'profileSettingsByPk'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'profileId'),
                value: VariableNode(name: NameNode(value: 'profileId')),
              ),
            ],
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
                  name: NameNode(value: 'chatEnabled'),
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
QueryChatStatus _parserFnQueryChatStatus(Map<String, dynamic> data) =>
    QueryChatStatus.fromJson(data);
typedef OnQueryCompleteQueryChatStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryChatStatus?,
);

class OptionsQueryChatStatus extends graphql.QueryOptions<QueryChatStatus> {
  OptionsQueryChatStatus({
    String? operationName,
    required VariablesQueryChatStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryChatStatus? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryChatStatus? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryChatStatus(data)),
         onError: onError,
         document: documentNodeQueryChatStatus,
         parserFn: _parserFnQueryChatStatus,
       );

  final OnQueryCompleteQueryChatStatus? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryChatStatus extends graphql.WatchQueryOptions<QueryChatStatus> {
  WatchOptionsQueryChatStatus({
    String? operationName,
    required VariablesQueryChatStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryChatStatus? typedOptimisticResult,
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
         document: documentNodeQueryChatStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryChatStatus,
       );
}

class FetchMoreOptionsQueryChatStatus extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryChatStatus({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryChatStatus variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryChatStatus,
       );
}

extension ClientExtensionQueryChatStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryChatStatus>> queryChatStatus(
    OptionsQueryChatStatus options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryChatStatus> watchQueryChatStatus(
    WatchOptionsQueryChatStatus options,
  ) => this.watchQuery(options);

  void writeQueryChatStatus({
    required QueryChatStatus data,
    required VariablesQueryChatStatus variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryChatStatus),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryChatStatus? readQueryChatStatus({
    required VariablesQueryChatStatus variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryChatStatus),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryChatStatus.fromJson(result);
  }
}

class QueryChatStatusplusLimit {
  QueryChatStatusplusLimit({required this.value, this.$__typename = 'AppConfig'});

  factory QueryChatStatusplusLimit.fromJson(Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusplusLimit(
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([l$value, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatusplusLimit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

class QueryChatStatusfreeLimit {
  QueryChatStatusfreeLimit({required this.value, this.$__typename = 'AppConfig'});

  factory QueryChatStatusfreeLimit.fromJson(Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusfreeLimit(
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([l$value, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatusfreeLimit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

class QueryChatStatusprofileSettingsByPk {
  QueryChatStatusprofileSettingsByPk({
    required this.profileId,
    required this.chatEnabled,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryChatStatusprofileSettingsByPk.fromJson(Map<String, dynamic> json) {
    final l$profileId = json['profileId'];
    final l$chatEnabled = json['chatEnabled'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusprofileSettingsByPk(
      profileId: (l$profileId as String),
      chatEnabled: (l$chatEnabled as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String profileId;

  final bool chatEnabled;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$chatEnabled = chatEnabled;
    _resultData['chatEnabled'] = l$chatEnabled;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$chatEnabled = chatEnabled;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileId, l$chatEnabled, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatusprofileSettingsByPk || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$chatEnabled = chatEnabled;
    final lOther$chatEnabled = other.chatEnabled;
    if (l$chatEnabled != lOther$chatEnabled) {
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
