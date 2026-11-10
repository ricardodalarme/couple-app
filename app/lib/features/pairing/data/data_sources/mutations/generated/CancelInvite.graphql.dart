// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationCancelInvite {
  factory VariablesMutationCancelInvite({required String inviteId}) =>
      VariablesMutationCancelInvite._({r'inviteId': inviteId});

  VariablesMutationCancelInvite._(this._$data);

  factory VariablesMutationCancelInvite.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inviteId = data['inviteId'];
    result$data['inviteId'] = (l$inviteId as String);
    return VariablesMutationCancelInvite._(result$data);
  }

  Map<String, dynamic> _$data;

  String get inviteId => (_$data['inviteId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inviteId = inviteId;
    result$data['inviteId'] = l$inviteId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationCancelInvite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$inviteId = inviteId;
    final lOther$inviteId = other.inviteId;
    if (l$inviteId != lOther$inviteId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inviteId = inviteId;
    return Object.hashAll([l$inviteId]);
  }
}

class MutationCancelInvite {
  MutationCancelInvite({this.cancelInvite, this.$__typename = 'Mutation'});

  factory MutationCancelInvite.fromJson(Map<String, dynamic> json) {
    final l$cancelInvite = json['cancelInvite'];
    final l$$__typename = json['__typename'];
    return MutationCancelInvite(
      cancelInvite: (l$cancelInvite as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? cancelInvite;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelInvite = cancelInvite;
    _resultData['cancelInvite'] = l$cancelInvite;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelInvite = cancelInvite;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelInvite, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationCancelInvite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelInvite = cancelInvite;
    final lOther$cancelInvite = other.cancelInvite;
    if (l$cancelInvite != lOther$cancelInvite) {
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

const documentNodeMutationCancelInvite = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CancelInvite'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'inviteId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'cancelInvite'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'inviteId'),
                value: VariableNode(name: NameNode(value: 'inviteId')),
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
MutationCancelInvite _parserFnMutationCancelInvite(Map<String, dynamic> data) =>
    MutationCancelInvite.fromJson(data);
typedef OnMutationCompletedMutationCancelInvite = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationCancelInvite?,
);

class OptionsMutationCancelInvite extends graphql.MutationOptions<MutationCancelInvite> {
  OptionsMutationCancelInvite({
    String? operationName,
    required VariablesMutationCancelInvite variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCancelInvite? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationCancelInvite? onCompleted,
    graphql.OnMutationUpdate<MutationCancelInvite>? update,
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
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationCancelInvite(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationCancelInvite,
         parserFn: _parserFnMutationCancelInvite,
       );

  final OnMutationCompletedMutationCancelInvite? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationCancelInvite extends graphql.WatchQueryOptions<MutationCancelInvite> {
  WatchOptionsMutationCancelInvite({
    String? operationName,
    required VariablesMutationCancelInvite variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCancelInvite? typedOptimisticResult,
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
         document: documentNodeMutationCancelInvite,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationCancelInvite,
       );
}

extension ClientExtensionMutationCancelInvite on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationCancelInvite>> mutateCancelInvite(
    OptionsMutationCancelInvite options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationCancelInvite> watchMutationCancelInvite(
    WatchOptionsMutationCancelInvite options,
  ) => this.watchMutation(options);
}
