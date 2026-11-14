// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryMySpiceSetting {
  factory VariablesQueryMySpiceSetting({required String profileId}) =>
      VariablesQueryMySpiceSetting._({r'profileId': profileId});

  VariablesQueryMySpiceSetting._(this._$data);

  factory VariablesQueryMySpiceSetting.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    return VariablesQueryMySpiceSetting._(result$data);
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
    if (other is! VariablesQueryMySpiceSetting || runtimeType != other.runtimeType) {
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

class QueryMySpiceSetting {
  QueryMySpiceSetting({this.profileSettingsByPk, this.$__typename = 'Query'});

  factory QueryMySpiceSetting.fromJson(Map<String, dynamic> json) {
    final l$profileSettingsByPk = json['profileSettingsByPk'];
    final l$$__typename = json['__typename'];
    return QueryMySpiceSetting(
      profileSettingsByPk: l$profileSettingsByPk == null
          ? null
          : QueryMySpiceSettingprofileSettingsByPk.fromJson(
              (l$profileSettingsByPk as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMySpiceSettingprofileSettingsByPk? profileSettingsByPk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileSettingsByPk = profileSettingsByPk;
    _resultData['profileSettingsByPk'] = l$profileSettingsByPk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileSettingsByPk = profileSettingsByPk;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileSettingsByPk, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySpiceSetting || runtimeType != other.runtimeType) {
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

const documentNodeQueryMySpiceSetting = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MySpiceSetting'),
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
                  name: NameNode(value: 'spiceEnabled'),
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
QueryMySpiceSetting _parserFnQueryMySpiceSetting(Map<String, dynamic> data) =>
    QueryMySpiceSetting.fromJson(data);
typedef OnQueryCompleteQueryMySpiceSetting = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMySpiceSetting?,
);

class OptionsQueryMySpiceSetting extends graphql.QueryOptions<QueryMySpiceSetting> {
  OptionsQueryMySpiceSetting({
    String? operationName,
    required VariablesQueryMySpiceSetting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMySpiceSetting? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMySpiceSetting? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMySpiceSetting(data)),
         onError: onError,
         document: documentNodeQueryMySpiceSetting,
         parserFn: _parserFnQueryMySpiceSetting,
       );

  final OnQueryCompleteQueryMySpiceSetting? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMySpiceSetting extends graphql.WatchQueryOptions<QueryMySpiceSetting> {
  WatchOptionsQueryMySpiceSetting({
    String? operationName,
    required VariablesQueryMySpiceSetting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMySpiceSetting? typedOptimisticResult,
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
         document: documentNodeQueryMySpiceSetting,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMySpiceSetting,
       );
}

class FetchMoreOptionsQueryMySpiceSetting extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMySpiceSetting({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryMySpiceSetting variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryMySpiceSetting,
       );
}

extension ClientExtensionQueryMySpiceSetting on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMySpiceSetting>> queryMySpiceSetting(
    OptionsQueryMySpiceSetting options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryMySpiceSetting> watchQueryMySpiceSetting(
    WatchOptionsQueryMySpiceSetting options,
  ) => this.watchQuery(options);

  void writeQueryMySpiceSetting({
    required QueryMySpiceSetting data,
    required VariablesQueryMySpiceSetting variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMySpiceSetting),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMySpiceSetting? readQueryMySpiceSetting({
    required VariablesQueryMySpiceSetting variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMySpiceSetting),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMySpiceSetting.fromJson(result);
  }
}

class QueryMySpiceSettingprofileSettingsByPk {
  QueryMySpiceSettingprofileSettingsByPk({
    required this.profileId,
    required this.spiceEnabled,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryMySpiceSettingprofileSettingsByPk.fromJson(Map<String, dynamic> json) {
    final l$profileId = json['profileId'];
    final l$spiceEnabled = json['spiceEnabled'];
    final l$$__typename = json['__typename'];
    return QueryMySpiceSettingprofileSettingsByPk(
      profileId: (l$profileId as String),
      spiceEnabled: (l$spiceEnabled as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String profileId;

  final bool spiceEnabled;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$spiceEnabled = spiceEnabled;
    _resultData['spiceEnabled'] = l$spiceEnabled;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$spiceEnabled = spiceEnabled;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileId, l$spiceEnabled, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySpiceSettingprofileSettingsByPk || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$spiceEnabled = spiceEnabled;
    final lOther$spiceEnabled = other.spiceEnabled;
    if (l$spiceEnabled != lOther$spiceEnabled) {
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
