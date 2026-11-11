// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAnswerGame {
  factory VariablesMutationAnswerGame({
    required String sessionId,
    required int idx,
    required String answer,
  }) => VariablesMutationAnswerGame._({r'sessionId': sessionId, r'idx': idx, r'answer': answer});

  VariablesMutationAnswerGame._(this._$data);

  factory VariablesMutationAnswerGame.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$sessionId = data['sessionId'];
    result$data['sessionId'] = (l$sessionId as String);
    final l$idx = data['idx'];
    result$data['idx'] = (l$idx as int);
    final l$answer = data['answer'];
    result$data['answer'] = (l$answer as String);
    return VariablesMutationAnswerGame._(result$data);
  }

  Map<String, dynamic> _$data;

  String get sessionId => (_$data['sessionId'] as String);

  int get idx => (_$data['idx'] as int);

  String get answer => (_$data['answer'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$sessionId = sessionId;
    result$data['sessionId'] = l$sessionId;
    final l$idx = idx;
    result$data['idx'] = l$idx;
    final l$answer = answer;
    result$data['answer'] = l$answer;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAnswerGame || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$idx = idx;
    final lOther$idx = other.idx;
    if (l$idx != lOther$idx) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sessionId = sessionId;
    final l$idx = idx;
    final l$answer = answer;
    return Object.hashAll([l$sessionId, l$idx, l$answer]);
  }
}

class MutationAnswerGame {
  MutationAnswerGame({this.answerGame, this.$__typename = 'Mutation'});

  factory MutationAnswerGame.fromJson(Map<String, dynamic> json) {
    final l$answerGame = json['answerGame'];
    final l$$__typename = json['__typename'];
    return MutationAnswerGame(
      answerGame: (l$answerGame as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? answerGame;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$answerGame = answerGame;
    _resultData['answerGame'] = l$answerGame;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$answerGame = answerGame;
    final l$$__typename = $__typename;
    return Object.hashAll([l$answerGame, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAnswerGame || runtimeType != other.runtimeType) {
      return false;
    }
    final l$answerGame = answerGame;
    final lOther$answerGame = other.answerGame;
    if (l$answerGame != lOther$answerGame) {
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

const documentNodeMutationAnswerGame = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AnswerGame'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'sessionId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'idx')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'answer')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'answerGame'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'sessionId'),
                value: VariableNode(name: NameNode(value: 'sessionId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'idx'),
                value: VariableNode(name: NameNode(value: 'idx')),
              ),
              ArgumentNode(
                name: NameNode(value: 'answer'),
                value: VariableNode(name: NameNode(value: 'answer')),
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
MutationAnswerGame _parserFnMutationAnswerGame(Map<String, dynamic> data) =>
    MutationAnswerGame.fromJson(data);
typedef OnMutationCompletedMutationAnswerGame = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAnswerGame?,
);

class OptionsMutationAnswerGame extends graphql.MutationOptions<MutationAnswerGame> {
  OptionsMutationAnswerGame({
    String? operationName,
    required VariablesMutationAnswerGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAnswerGame? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAnswerGame? onCompleted,
    graphql.OnMutationUpdate<MutationAnswerGame>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationAnswerGame(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAnswerGame,
         parserFn: _parserFnMutationAnswerGame,
       );

  final OnMutationCompletedMutationAnswerGame? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAnswerGame extends graphql.WatchQueryOptions<MutationAnswerGame> {
  WatchOptionsMutationAnswerGame({
    String? operationName,
    required VariablesMutationAnswerGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAnswerGame? typedOptimisticResult,
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
         document: documentNodeMutationAnswerGame,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAnswerGame,
       );
}

extension ClientExtensionMutationAnswerGame on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAnswerGame>> mutateAnswerGame(
    OptionsMutationAnswerGame options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAnswerGame> watchMutationAnswerGame(
    WatchOptionsMutationAnswerGame options,
  ) => this.watchMutation(options);
}
