// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationRegisterDevice {
  factory VariablesMutationRegisterDevice({
    required String token,
    required String platform,
    String? label,
  }) => VariablesMutationRegisterDevice._({
    r'token': token,
    r'platform': platform,
    if (label != null) r'label': label,
  });

  VariablesMutationRegisterDevice._(this._$data);

  factory VariablesMutationRegisterDevice.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    final l$platform = data['platform'];
    result$data['platform'] = (l$platform as String);
    if (data.containsKey('label')) {
      final l$label = data['label'];
      result$data['label'] = (l$label as String?);
    }
    return VariablesMutationRegisterDevice._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);

  String get platform => (_$data['platform'] as String);

  String? get label => (_$data['label'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    final l$platform = platform;
    result$data['platform'] = l$platform;
    if (_$data.containsKey('label')) {
      final l$label = label;
      result$data['label'] = l$label;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationRegisterDevice || runtimeType != other.runtimeType) {
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
    final l$label = label;
    final lOther$label = other.label;
    if (_$data.containsKey('label') != other._$data.containsKey('label')) {
      return false;
    }
    if (l$label != lOther$label) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$platform = platform;
    final l$label = label;
    return Object.hashAll([l$token, l$platform, _$data.containsKey('label') ? l$label : const {}]);
  }
}

class MutationRegisterDevice {
  MutationRegisterDevice({this.registerDevice, this.$__typename = 'Mutation'});

  factory MutationRegisterDevice.fromJson(Map<String, dynamic> json) {
    final l$registerDevice = json['registerDevice'];
    final l$$__typename = json['__typename'];
    return MutationRegisterDevice(
      registerDevice: (l$registerDevice as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? registerDevice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$registerDevice = registerDevice;
    _resultData['registerDevice'] = l$registerDevice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$registerDevice = registerDevice;
    final l$$__typename = $__typename;
    return Object.hashAll([l$registerDevice, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRegisterDevice || runtimeType != other.runtimeType) {
      return false;
    }
    final l$registerDevice = registerDevice;
    final lOther$registerDevice = other.registerDevice;
    if (l$registerDevice != lOther$registerDevice) {
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

const documentNodeMutationRegisterDevice = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RegisterDevice'),
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
          variable: VariableNode(name: NameNode(value: 'label')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'registerDevice'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'token'),
                value: VariableNode(name: NameNode(value: 'token')),
              ),
              ArgumentNode(
                name: NameNode(value: 'platform'),
                value: VariableNode(name: NameNode(value: 'platform')),
              ),
              ArgumentNode(
                name: NameNode(value: 'label'),
                value: VariableNode(name: NameNode(value: 'label')),
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
MutationRegisterDevice _parserFnMutationRegisterDevice(Map<String, dynamic> data) =>
    MutationRegisterDevice.fromJson(data);
typedef OnMutationCompletedMutationRegisterDevice = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationRegisterDevice?,
);

class OptionsMutationRegisterDevice extends graphql.MutationOptions<MutationRegisterDevice> {
  OptionsMutationRegisterDevice({
    String? operationName,
    required VariablesMutationRegisterDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRegisterDevice? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationRegisterDevice? onCompleted,
    graphql.OnMutationUpdate<MutationRegisterDevice>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RegisterDevice',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationRegisterDevice(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationRegisterDevice,
         parserFn: _parserFnMutationRegisterDevice,
       );

  final OnMutationCompletedMutationRegisterDevice? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationRegisterDevice extends graphql.WatchQueryOptions<MutationRegisterDevice> {
  WatchOptionsMutationRegisterDevice({
    String? operationName,
    required VariablesMutationRegisterDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRegisterDevice? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RegisterDevice',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRegisterDevice,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationRegisterDevice,
       );
}

extension ClientExtensionMutationRegisterDevice on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationRegisterDevice>> mutateRegisterDevice(
    OptionsMutationRegisterDevice options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationRegisterDevice> watchMutationRegisterDevice(
    WatchOptionsMutationRegisterDevice options,
  ) => this.watchMutation(options);
}
