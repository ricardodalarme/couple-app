// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationRegisterDeviceToken {
  factory VariablesMutationRegisterDeviceToken({
    required String token,
    required String platform,
    String? appVersion,
  }) => VariablesMutationRegisterDeviceToken._({
    r'token': token,
    r'platform': platform,
    if (appVersion != null) r'appVersion': appVersion,
  });

  VariablesMutationRegisterDeviceToken._(this._$data);

  factory VariablesMutationRegisterDeviceToken.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    final l$platform = data['platform'];
    result$data['platform'] = (l$platform as String);
    if (data.containsKey('appVersion')) {
      final l$appVersion = data['appVersion'];
      result$data['appVersion'] = (l$appVersion as String?);
    }
    return VariablesMutationRegisterDeviceToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);

  String get platform => (_$data['platform'] as String);

  String? get appVersion => (_$data['appVersion'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    final l$platform = platform;
    result$data['platform'] = l$platform;
    if (_$data.containsKey('appVersion')) {
      final l$appVersion = appVersion;
      result$data['appVersion'] = l$appVersion;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationRegisterDeviceToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$platform = platform;
    final lOther$platform = other.platform;
    if (l$platform != lOther$platform) {
      return false;
    }
    final l$appVersion = appVersion;
    final lOther$appVersion = other.appVersion;
    if (_$data.containsKey('appVersion') != other._$data.containsKey('appVersion')) {
      return false;
    }
    if (l$appVersion != lOther$appVersion) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$platform = platform;
    final l$appVersion = appVersion;
    return Object.hashAll([
      l$token,
      l$platform,
      _$data.containsKey('appVersion') ? l$appVersion : const {},
    ]);
  }
}

class MutationRegisterDeviceToken {
  MutationRegisterDeviceToken({this.register_device_token, this.$__typename = 'Mutation'});

  factory MutationRegisterDeviceToken.fromJson(Map<String, dynamic> json) {
    final l$register_device_token = json['register_device_token'];
    final l$$__typename = json['__typename'];
    return MutationRegisterDeviceToken(
      register_device_token: l$register_device_token == null
          ? null
          : MutationRegisterDeviceTokenregister_device_token.fromJson(
              (l$register_device_token as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationRegisterDeviceTokenregister_device_token? register_device_token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$register_device_token = register_device_token;
    _resultData['register_device_token'] = l$register_device_token?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$register_device_token = register_device_token;
    final l$$__typename = $__typename;
    return Object.hashAll([l$register_device_token, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRegisterDeviceToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$register_device_token = register_device_token;
    final lOther$register_device_token = other.register_device_token;
    if (l$register_device_token != lOther$register_device_token) {
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

const documentNodeMutationRegisterDeviceToken = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RegisterDeviceToken'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'token')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'platform')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'appVersion')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'register_device_token'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'p_token'),
                value: VariableNode(name: NameNode(value: 'token')),
              ),
              ArgumentNode(
                name: NameNode(value: 'p_platform'),
                value: VariableNode(name: NameNode(value: 'platform')),
              ),
              ArgumentNode(
                name: NameNode(value: 'p_app_version'),
                value: VariableNode(name: NameNode(value: 'appVersion')),
              ),
            ],
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
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'platform'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'last_seen_at'),
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
MutationRegisterDeviceToken _parserFnMutationRegisterDeviceToken(Map<String, dynamic> data) =>
    MutationRegisterDeviceToken.fromJson(data);
typedef OnMutationCompletedMutationRegisterDeviceToken = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationRegisterDeviceToken?,
);

class OptionsMutationRegisterDeviceToken
    extends graphql.MutationOptions<MutationRegisterDeviceToken> {
  OptionsMutationRegisterDeviceToken({
    String? operationName,
    required VariablesMutationRegisterDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRegisterDeviceToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationRegisterDeviceToken? onCompleted,
    graphql.OnMutationUpdate<MutationRegisterDeviceToken>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationRegisterDeviceToken(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRegisterDeviceToken,
         parserFn: _parserFnMutationRegisterDeviceToken,
       );

  final OnMutationCompletedMutationRegisterDeviceToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationRegisterDeviceToken
    extends graphql.WatchQueryOptions<MutationRegisterDeviceToken> {
  WatchOptionsMutationRegisterDeviceToken({
    String? operationName,
    required VariablesMutationRegisterDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRegisterDeviceToken? typedOptimisticResult,
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
         document: documentNodeMutationRegisterDeviceToken,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationRegisterDeviceToken,
       );
}

extension ClientExtensionMutationRegisterDeviceToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationRegisterDeviceToken>> mutateRegisterDeviceToken(
    OptionsMutationRegisterDeviceToken options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationRegisterDeviceToken> watchMutationRegisterDeviceToken(
    WatchOptionsMutationRegisterDeviceToken options,
  ) => this.watchMutation(options);
}

class MutationRegisterDeviceTokenregister_device_token {
  MutationRegisterDeviceTokenregister_device_token({
    required this.id,
    required this.token,
    required this.platform,
    required this.last_seen_at,
    this.$__typename = 'device_tokens',
  });

  factory MutationRegisterDeviceTokenregister_device_token.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$token = json['token'];
    final l$platform = json['platform'];
    final l$last_seen_at = json['last_seen_at'];
    final l$$__typename = json['__typename'];
    return MutationRegisterDeviceTokenregister_device_token(
      id: (l$id as String),
      token: (l$token as String),
      platform: (l$platform as String),
      last_seen_at: DateTime.parse((l$last_seen_at as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String token;

  final String platform;

  final DateTime last_seen_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$token = token;
    _resultData['token'] = l$token;
    final l$platform = platform;
    _resultData['platform'] = l$platform;
    final l$last_seen_at = last_seen_at;
    _resultData['last_seen_at'] = l$last_seen_at.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$token = token;
    final l$platform = platform;
    final l$last_seen_at = last_seen_at;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$token, l$platform, l$last_seen_at, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRegisterDeviceTokenregister_device_token ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$platform = platform;
    final lOther$platform = other.platform;
    if (l$platform != lOther$platform) {
      return false;
    }
    final l$last_seen_at = last_seen_at;
    final lOther$last_seen_at = other.last_seen_at;
    if (l$last_seen_at != lOther$last_seen_at) {
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
