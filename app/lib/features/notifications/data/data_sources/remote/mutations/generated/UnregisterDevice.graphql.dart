// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUnregisterDevice {
  factory VariablesMutationUnregisterDevice({required String token}) =>
      VariablesMutationUnregisterDevice._({r'token': token});

  VariablesMutationUnregisterDevice._(this._$data);

  factory VariablesMutationUnregisterDevice.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return VariablesMutationUnregisterDevice._(result$data);
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
    if (other is! VariablesMutationUnregisterDevice || runtimeType != other.runtimeType) {
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

class MutationUnregisterDevice {
  MutationUnregisterDevice({this.unregisterDevice, this.$__typename = 'Mutation'});

  factory MutationUnregisterDevice.fromJson(Map<String, dynamic> json) {
    final l$unregisterDevice = json['unregisterDevice'];
    final l$$__typename = json['__typename'];
    return MutationUnregisterDevice(
      unregisterDevice: (l$unregisterDevice as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? unregisterDevice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unregisterDevice = unregisterDevice;
    _resultData['unregisterDevice'] = l$unregisterDevice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unregisterDevice = unregisterDevice;
    final l$$__typename = $__typename;
    return Object.hashAll([l$unregisterDevice, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUnregisterDevice || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unregisterDevice = unregisterDevice;
    final lOther$unregisterDevice = other.unregisterDevice;
    if (l$unregisterDevice != lOther$unregisterDevice) {
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

const documentNodeMutationUnregisterDevice = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UnregisterDevice'),
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
            name: NameNode(value: 'unregisterDevice'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'token'),
                value: VariableNode(name: NameNode(value: 'token')),
              ),
            ],
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
  ],
);
MutationUnregisterDevice _parserFnMutationUnregisterDevice(Map<String, dynamic> data) =>
    MutationUnregisterDevice.fromJson(data);
typedef OnMutationCompletedMutationUnregisterDevice = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUnregisterDevice?,
);

class OptionsMutationUnregisterDevice extends graphql.MutationOptions<MutationUnregisterDevice> {
  OptionsMutationUnregisterDevice({
    String? operationName,
    required VariablesMutationUnregisterDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUnregisterDevice? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUnregisterDevice? onCompleted,
    graphql.OnMutationUpdate<MutationUnregisterDevice>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'UnregisterDevice',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationUnregisterDevice(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationUnregisterDevice,
         parserFn: _parserFnMutationUnregisterDevice,
       );

  final OnMutationCompletedMutationUnregisterDevice? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUnregisterDevice
    extends graphql.WatchQueryOptions<MutationUnregisterDevice> {
  WatchOptionsMutationUnregisterDevice({
    String? operationName,
    required VariablesMutationUnregisterDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUnregisterDevice? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'UnregisterDevice',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUnregisterDevice,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUnregisterDevice,
       );
}

extension ClientExtensionMutationUnregisterDevice on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUnregisterDevice>> mutateUnregisterDevice(
    OptionsMutationUnregisterDevice options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUnregisterDevice> watchMutationUnregisterDevice(
    WatchOptionsMutationUnregisterDevice options,
  ) => this.watchMutation(options);
}
