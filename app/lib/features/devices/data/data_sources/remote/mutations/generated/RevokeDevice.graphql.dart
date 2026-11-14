// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationRevokeDevice {
  factory VariablesMutationRevokeDevice({required String deviceId}) =>
      VariablesMutationRevokeDevice._({r'deviceId': deviceId});

  VariablesMutationRevokeDevice._(this._$data);

  factory VariablesMutationRevokeDevice.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$deviceId = data['deviceId'];
    result$data['deviceId'] = (l$deviceId as String);
    return VariablesMutationRevokeDevice._(result$data);
  }

  Map<String, dynamic> _$data;

  String get deviceId => (_$data['deviceId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$deviceId = deviceId;
    result$data['deviceId'] = l$deviceId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationRevokeDevice || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deviceId = deviceId;
    final lOther$deviceId = other.deviceId;
    if (l$deviceId != lOther$deviceId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$deviceId = deviceId;
    return Object.hashAll([l$deviceId]);
  }
}

class MutationRevokeDevice {
  MutationRevokeDevice({this.revokeDevice, this.$__typename = 'Mutation'});

  factory MutationRevokeDevice.fromJson(Map<String, dynamic> json) {
    final l$revokeDevice = json['revokeDevice'];
    final l$$__typename = json['__typename'];
    return MutationRevokeDevice(
      revokeDevice: (l$revokeDevice as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? revokeDevice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$revokeDevice = revokeDevice;
    _resultData['revokeDevice'] = l$revokeDevice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$revokeDevice = revokeDevice;
    final l$$__typename = $__typename;
    return Object.hashAll([l$revokeDevice, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRevokeDevice || runtimeType != other.runtimeType) {
      return false;
    }
    final l$revokeDevice = revokeDevice;
    final lOther$revokeDevice = other.revokeDevice;
    if (l$revokeDevice != lOther$revokeDevice) {
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

const documentNodeMutationRevokeDevice = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RevokeDevice'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'deviceId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'revokeDevice'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'deviceId'),
                value: VariableNode(name: NameNode(value: 'deviceId')),
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
MutationRevokeDevice _parserFnMutationRevokeDevice(Map<String, dynamic> data) =>
    MutationRevokeDevice.fromJson(data);
typedef OnMutationCompletedMutationRevokeDevice = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationRevokeDevice?,
);

class OptionsMutationRevokeDevice extends graphql.MutationOptions<MutationRevokeDevice> {
  OptionsMutationRevokeDevice({
    String? operationName,
    required VariablesMutationRevokeDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRevokeDevice? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationRevokeDevice? onCompleted,
    graphql.OnMutationUpdate<MutationRevokeDevice>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RevokeDevice',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationRevokeDevice(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationRevokeDevice,
         parserFn: _parserFnMutationRevokeDevice,
       );

  final OnMutationCompletedMutationRevokeDevice? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationRevokeDevice extends graphql.WatchQueryOptions<MutationRevokeDevice> {
  WatchOptionsMutationRevokeDevice({
    String? operationName,
    required VariablesMutationRevokeDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRevokeDevice? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RevokeDevice',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRevokeDevice,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationRevokeDevice,
       );
}

extension ClientExtensionMutationRevokeDevice on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationRevokeDevice>> mutateRevokeDevice(
    OptionsMutationRevokeDevice options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationRevokeDevice> watchMutationRevokeDevice(
    WatchOptionsMutationRevokeDevice options,
  ) => this.watchMutation(options);
}
