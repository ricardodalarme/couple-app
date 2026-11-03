// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUnregisterDeviceToken {
  factory VariablesMutationUnregisterDeviceToken({required String token}) =>
      VariablesMutationUnregisterDeviceToken._({r'token': token});

  VariablesMutationUnregisterDeviceToken._(this._$data);

  factory VariablesMutationUnregisterDeviceToken.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return VariablesMutationUnregisterDeviceToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUnregisterDeviceToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    return Object.hashAll([l$token]);
  }
}

class MutationUnregisterDeviceToken {
  MutationUnregisterDeviceToken({this.unregister_device_token, this.$__typename = 'Mutation'});

  factory MutationUnregisterDeviceToken.fromJson(Map<String, dynamic> json) {
    final l$unregister_device_token = json['unregister_device_token'];
    final l$$__typename = json['__typename'];
    return MutationUnregisterDeviceToken(
      unregister_device_token: l$unregister_device_token == null
          ? null
          : MutationUnregisterDeviceTokenunregister_device_token.fromJson(
              (l$unregister_device_token as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUnregisterDeviceTokenunregister_device_token? unregister_device_token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unregister_device_token = unregister_device_token;
    _resultData['unregister_device_token'] = l$unregister_device_token?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unregister_device_token = unregister_device_token;
    final l$$__typename = $__typename;
    return Object.hashAll([l$unregister_device_token, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUnregisterDeviceToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unregister_device_token = unregister_device_token;
    final lOther$unregister_device_token = other.unregister_device_token;
    if (l$unregister_device_token != lOther$unregister_device_token) {
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

const documentNodeMutationUnregisterDeviceToken = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UnregisterDeviceToken'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'token')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'unregister_device_token'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'p_token'),
                value: VariableNode(name: NameNode(value: 'token')),
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
                  name: NameNode(value: 'invalidated_at'),
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
MutationUnregisterDeviceToken _parserFnMutationUnregisterDeviceToken(Map<String, dynamic> data) =>
    MutationUnregisterDeviceToken.fromJson(data);
typedef OnMutationCompletedMutationUnregisterDeviceToken = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUnregisterDeviceToken?,
);

class OptionsMutationUnregisterDeviceToken
    extends graphql.MutationOptions<MutationUnregisterDeviceToken> {
  OptionsMutationUnregisterDeviceToken({
    String? operationName,
    required VariablesMutationUnregisterDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUnregisterDeviceToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUnregisterDeviceToken? onCompleted,
    graphql.OnMutationUpdate<MutationUnregisterDeviceToken>? update,
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
                 data == null ? null : _parserFnMutationUnregisterDeviceToken(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUnregisterDeviceToken,
         parserFn: _parserFnMutationUnregisterDeviceToken,
       );

  final OnMutationCompletedMutationUnregisterDeviceToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUnregisterDeviceToken
    extends graphql.WatchQueryOptions<MutationUnregisterDeviceToken> {
  WatchOptionsMutationUnregisterDeviceToken({
    String? operationName,
    required VariablesMutationUnregisterDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUnregisterDeviceToken? typedOptimisticResult,
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
         document: documentNodeMutationUnregisterDeviceToken,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUnregisterDeviceToken,
       );
}

extension ClientExtensionMutationUnregisterDeviceToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUnregisterDeviceToken>> mutateUnregisterDeviceToken(
    OptionsMutationUnregisterDeviceToken options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUnregisterDeviceToken> watchMutationUnregisterDeviceToken(
    WatchOptionsMutationUnregisterDeviceToken options,
  ) => this.watchMutation(options);
}

class MutationUnregisterDeviceTokenunregister_device_token {
  MutationUnregisterDeviceTokenunregister_device_token({
    required this.id,
    required this.token,
    this.invalidated_at,
    this.$__typename = 'device_tokens',
  });

  factory MutationUnregisterDeviceTokenunregister_device_token.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$token = json['token'];
    final l$invalidated_at = json['invalidated_at'];
    final l$$__typename = json['__typename'];
    return MutationUnregisterDeviceTokenunregister_device_token(
      id: (l$id as String),
      token: (l$token as String),
      invalidated_at: l$invalidated_at == null
          ? null
          : DateTime.parse((l$invalidated_at as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String token;

  final DateTime? invalidated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$token = token;
    _resultData['token'] = l$token;
    final l$invalidated_at = invalidated_at;
    _resultData['invalidated_at'] = l$invalidated_at?.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$token = token;
    final l$invalidated_at = invalidated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$token, l$invalidated_at, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUnregisterDeviceTokenunregister_device_token ||
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
    final l$invalidated_at = invalidated_at;
    final lOther$invalidated_at = other.invalidated_at;
    if (l$invalidated_at != lOther$invalidated_at) {
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
