// dart format width=100
import '../../fragments/generated/GameSessionFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateGame {
  factory VariablesMutationUpdateGame({
    required String sessionId,
    required String action,
    String? outcome,
  }) => VariablesMutationUpdateGame._({
    r'sessionId': sessionId,
    r'action': action,
    if (outcome != null) r'outcome': outcome,
  });

  VariablesMutationUpdateGame._(this._$data);

  factory VariablesMutationUpdateGame.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$sessionId = data['sessionId'];
    result$data['sessionId'] = (l$sessionId as String);
    final l$action = data['action'];
    result$data['action'] = (l$action as String);
    if (data.containsKey('outcome')) {
      final l$outcome = data['outcome'];
      result$data['outcome'] = (l$outcome as String?);
    }
    return VariablesMutationUpdateGame._(result$data);
  }

  Map<String, dynamic> _$data;

  String get sessionId => (_$data['sessionId'] as String);

  String get action => (_$data['action'] as String);

  String? get outcome => (_$data['outcome'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$sessionId = sessionId;
    result$data['sessionId'] = l$sessionId;
    final l$action = action;
    result$data['action'] = l$action;
    if (_$data.containsKey('outcome')) {
      final l$outcome = outcome;
      result$data['outcome'] = l$outcome;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateGame || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$action = action;
    final lOther$action = other.action;
    if (l$action != lOther$action) {
      return false;
    }
    final l$outcome = outcome;
    final lOther$outcome = other.outcome;
    if (_$data.containsKey('outcome') != other._$data.containsKey('outcome')) {
      return false;
    }
    if (l$outcome != lOther$outcome) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sessionId = sessionId;
    final l$action = action;
    final l$outcome = outcome;
    return Object.hashAll([
      l$sessionId,
      l$action,
      _$data.containsKey('outcome') ? l$outcome : const {},
    ]);
  }
}

class MutationUpdateGame {
  MutationUpdateGame({this.updateGame, this.$__typename = 'Mutation'});

  factory MutationUpdateGame.fromJson(Map<String, dynamic> json) {
    final l$updateGame = json['updateGame'];
    final l$$__typename = json['__typename'];
    return MutationUpdateGame(
      updateGame: l$updateGame == null
          ? null
          : FragmentGameSessionFragment.fromJson((l$updateGame as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentGameSessionFragment? updateGame;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateGame = updateGame;
    _resultData['updateGame'] = l$updateGame?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateGame = updateGame;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateGame, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateGame || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateGame = updateGame;
    final lOther$updateGame = other.updateGame;
    if (l$updateGame != lOther$updateGame) {
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

const documentNodeMutationUpdateGame = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateGame'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'sessionId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'action')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'outcome')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateGame'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'sessionId'),
                value: VariableNode(name: NameNode(value: 'sessionId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'action'),
                value: VariableNode(name: NameNode(value: 'action')),
              ),
              ArgumentNode(
                name: NameNode(value: 'outcome'),
                value: VariableNode(name: NameNode(value: 'outcome')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameSessionFragment'),
                  directives: [],
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
    fragmentDefinitionGameSessionFragment,
  ],
);
MutationUpdateGame _parserFnMutationUpdateGame(Map<String, dynamic> data) =>
    MutationUpdateGame.fromJson(data);
typedef OnMutationCompletedMutationUpdateGame = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateGame?,
);

class OptionsMutationUpdateGame extends graphql.MutationOptions<MutationUpdateGame> {
  OptionsMutationUpdateGame({
    String? operationName,
    required VariablesMutationUpdateGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateGame? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateGame? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateGame>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationUpdateGame(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateGame,
         parserFn: _parserFnMutationUpdateGame,
       );

  final OnMutationCompletedMutationUpdateGame? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateGame extends graphql.WatchQueryOptions<MutationUpdateGame> {
  WatchOptionsMutationUpdateGame({
    String? operationName,
    required VariablesMutationUpdateGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateGame? typedOptimisticResult,
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
         document: documentNodeMutationUpdateGame,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateGame,
       );
}

extension ClientExtensionMutationUpdateGame on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateGame>> mutateUpdateGame(
    OptionsMutationUpdateGame options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateGame> watchMutationUpdateGame(
    WatchOptionsMutationUpdateGame options,
  ) => this.watchMutation(options);
}
