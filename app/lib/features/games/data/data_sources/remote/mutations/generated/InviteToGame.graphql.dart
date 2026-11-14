// dart format width=100
import '../../fragments/generated/GameSessionFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInviteToGame {
  factory VariablesMutationInviteToGame({required String game, List<String?>? itemSlugs}) =>
      VariablesMutationInviteToGame._({
        r'game': game,
        if (itemSlugs != null) r'itemSlugs': itemSlugs,
      });

  VariablesMutationInviteToGame._(this._$data);

  factory VariablesMutationInviteToGame.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$game = data['game'];
    result$data['game'] = (l$game as String);
    if (data.containsKey('itemSlugs')) {
      final l$itemSlugs = data['itemSlugs'];
      result$data['itemSlugs'] = (l$itemSlugs as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    return VariablesMutationInviteToGame._(result$data);
  }

  Map<String, dynamic> _$data;

  String get game => (_$data['game'] as String);

  List<String?>? get itemSlugs => (_$data['itemSlugs'] as List<String?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$game = game;
    result$data['game'] = l$game;
    if (_$data.containsKey('itemSlugs')) {
      final l$itemSlugs = itemSlugs;
      result$data['itemSlugs'] = l$itemSlugs?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInviteToGame || runtimeType != other.runtimeType) {
      return false;
    }
    final l$game = game;
    final lOther$game = other.game;
    if (l$game != lOther$game) {
      return false;
    }
    final l$itemSlugs = itemSlugs;
    final lOther$itemSlugs = other.itemSlugs;
    if (_$data.containsKey('itemSlugs') != other._$data.containsKey('itemSlugs')) {
      return false;
    }
    if (l$itemSlugs != null && lOther$itemSlugs != null) {
      if (l$itemSlugs.length != lOther$itemSlugs.length) {
        return false;
      }
      for (int i = 0; i < l$itemSlugs.length; i++) {
        final l$itemSlugs$entry = l$itemSlugs[i];
        final lOther$itemSlugs$entry = lOther$itemSlugs[i];
        if (l$itemSlugs$entry != lOther$itemSlugs$entry) {
          return false;
        }
      }
    } else if (l$itemSlugs != lOther$itemSlugs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$game = game;
    final l$itemSlugs = itemSlugs;
    return Object.hashAll([
      l$game,
      _$data.containsKey('itemSlugs')
          ? l$itemSlugs == null
                ? null
                : Object.hashAll(l$itemSlugs.map((v) => v))
          : const {},
    ]);
  }
}

class MutationInviteToGame {
  MutationInviteToGame({this.inviteToGame, this.$__typename = 'Mutation'});

  factory MutationInviteToGame.fromJson(Map<String, dynamic> json) {
    final l$inviteToGame = json['inviteToGame'];
    final l$$__typename = json['__typename'];
    return MutationInviteToGame(
      inviteToGame: l$inviteToGame == null
          ? null
          : FragmentGameSessionFragment.fromJson((l$inviteToGame as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentGameSessionFragment? inviteToGame;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$inviteToGame = inviteToGame;
    _resultData['inviteToGame'] = l$inviteToGame?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$inviteToGame = inviteToGame;
    final l$$__typename = $__typename;
    return Object.hashAll([l$inviteToGame, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInviteToGame || runtimeType != other.runtimeType) {
      return false;
    }
    final l$inviteToGame = inviteToGame;
    final lOther$inviteToGame = other.inviteToGame;
    if (l$inviteToGame != lOther$inviteToGame) {
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

const documentNodeMutationInviteToGame = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InviteToGame'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'game')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'itemSlugs')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'inviteToGame'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'game'),
                value: VariableNode(name: NameNode(value: 'game')),
              ),
              ArgumentNode(
                name: NameNode(value: 'itemSlugs'),
                value: VariableNode(name: NameNode(value: 'itemSlugs')),
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
MutationInviteToGame _parserFnMutationInviteToGame(Map<String, dynamic> data) =>
    MutationInviteToGame.fromJson(data);
typedef OnMutationCompletedMutationInviteToGame = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInviteToGame?,
);

class OptionsMutationInviteToGame extends graphql.MutationOptions<MutationInviteToGame> {
  OptionsMutationInviteToGame({
    String? operationName,
    required VariablesMutationInviteToGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInviteToGame? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInviteToGame? onCompleted,
    graphql.OnMutationUpdate<MutationInviteToGame>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InviteToGame',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationInviteToGame(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationInviteToGame,
         parserFn: _parserFnMutationInviteToGame,
       );

  final OnMutationCompletedMutationInviteToGame? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInviteToGame extends graphql.WatchQueryOptions<MutationInviteToGame> {
  WatchOptionsMutationInviteToGame({
    String? operationName,
    required VariablesMutationInviteToGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInviteToGame? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InviteToGame',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationInviteToGame,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInviteToGame,
       );
}

extension ClientExtensionMutationInviteToGame on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInviteToGame>> mutateInviteToGame(
    OptionsMutationInviteToGame options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInviteToGame> watchMutationInviteToGame(
    WatchOptionsMutationInviteToGame options,
  ) => this.watchMutation(options);
}
