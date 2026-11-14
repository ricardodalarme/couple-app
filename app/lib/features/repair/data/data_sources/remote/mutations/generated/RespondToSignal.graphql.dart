// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationRespondToSignal {
  factory VariablesMutationRespondToSignal({required String signalId, String? response}) =>
      VariablesMutationRespondToSignal._({
        r'signalId': signalId,
        if (response != null) r'response': response,
      });

  VariablesMutationRespondToSignal._(this._$data);

  factory VariablesMutationRespondToSignal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$signalId = data['signalId'];
    result$data['signalId'] = (l$signalId as String);
    if (data.containsKey('response')) {
      final l$response = data['response'];
      result$data['response'] = (l$response as String?);
    }
    return VariablesMutationRespondToSignal._(result$data);
  }

  Map<String, dynamic> _$data;

  String get signalId => (_$data['signalId'] as String);

  String? get response => (_$data['response'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$signalId = signalId;
    result$data['signalId'] = l$signalId;
    if (_$data.containsKey('response')) {
      final l$response = response;
      result$data['response'] = l$response;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationRespondToSignal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signalId = signalId;
    final lOther$signalId = other.signalId;
    if (l$signalId != lOther$signalId) {
      return false;
    }
    final l$response = response;
    final lOther$response = other.response;
    if (_$data.containsKey('response') != other._$data.containsKey('response')) {
      return false;
    }
    if (l$response != lOther$response) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$signalId = signalId;
    final l$response = response;
    return Object.hashAll([l$signalId, _$data.containsKey('response') ? l$response : const {}]);
  }
}

class MutationRespondToSignal {
  MutationRespondToSignal({this.respondToSignal, this.$__typename = 'Mutation'});

  factory MutationRespondToSignal.fromJson(Map<String, dynamic> json) {
    final l$respondToSignal = json['respondToSignal'];
    final l$$__typename = json['__typename'];
    return MutationRespondToSignal(
      respondToSignal: l$respondToSignal == null
          ? null
          : MutationRespondToSignalrespondToSignal.fromJson(
              (l$respondToSignal as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationRespondToSignalrespondToSignal? respondToSignal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$respondToSignal = respondToSignal;
    _resultData['respondToSignal'] = l$respondToSignal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$respondToSignal = respondToSignal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$respondToSignal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRespondToSignal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$respondToSignal = respondToSignal;
    final lOther$respondToSignal = other.respondToSignal;
    if (l$respondToSignal != lOther$respondToSignal) {
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

const documentNodeMutationRespondToSignal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RespondToSignal'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'signalId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'response')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'respondToSignal'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'signalId'),
                value: VariableNode(name: NameNode(value: 'signalId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'response'),
                value: VariableNode(name: NameNode(value: 'response')),
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
MutationRespondToSignal _parserFnMutationRespondToSignal(Map<String, dynamic> data) =>
    MutationRespondToSignal.fromJson(data);
typedef OnMutationCompletedMutationRespondToSignal = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationRespondToSignal?,
);

class OptionsMutationRespondToSignal extends graphql.MutationOptions<MutationRespondToSignal> {
  OptionsMutationRespondToSignal({
    String? operationName,
    required VariablesMutationRespondToSignal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRespondToSignal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationRespondToSignal? onCompleted,
    graphql.OnMutationUpdate<MutationRespondToSignal>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RespondToSignal',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationRespondToSignal(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationRespondToSignal,
         parserFn: _parserFnMutationRespondToSignal,
       );

  final OnMutationCompletedMutationRespondToSignal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationRespondToSignal
    extends graphql.WatchQueryOptions<MutationRespondToSignal> {
  WatchOptionsMutationRespondToSignal({
    String? operationName,
    required VariablesMutationRespondToSignal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationRespondToSignal? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'RespondToSignal',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRespondToSignal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationRespondToSignal,
       );
}

extension ClientExtensionMutationRespondToSignal on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationRespondToSignal>> mutateRespondToSignal(
    OptionsMutationRespondToSignal options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationRespondToSignal> watchMutationRespondToSignal(
    WatchOptionsMutationRespondToSignal options,
  ) => this.watchMutation(options);
}

class MutationRespondToSignalrespondToSignal {
  MutationRespondToSignalrespondToSignal({required this.id, this.$__typename = 'Signals'});

  factory MutationRespondToSignalrespondToSignal.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationRespondToSignalrespondToSignal(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationRespondToSignalrespondToSignal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
