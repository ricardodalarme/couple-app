// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationReactToCard {
  factory VariablesMutationReactToCard({required String cardId, String? reaction, String? reply}) =>
      VariablesMutationReactToCard._({
        r'cardId': cardId,
        if (reaction != null) r'reaction': reaction,
        if (reply != null) r'reply': reply,
      });

  VariablesMutationReactToCard._(this._$data);

  factory VariablesMutationReactToCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$cardId = data['cardId'];
    result$data['cardId'] = (l$cardId as String);
    if (data.containsKey('reaction')) {
      final l$reaction = data['reaction'];
      result$data['reaction'] = (l$reaction as String?);
    }
    if (data.containsKey('reply')) {
      final l$reply = data['reply'];
      result$data['reply'] = (l$reply as String?);
    }
    return VariablesMutationReactToCard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get cardId => (_$data['cardId'] as String);

  String? get reaction => (_$data['reaction'] as String?);

  String? get reply => (_$data['reply'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$cardId = cardId;
    result$data['cardId'] = l$cardId;
    if (_$data.containsKey('reaction')) {
      final l$reaction = reaction;
      result$data['reaction'] = l$reaction;
    }
    if (_$data.containsKey('reply')) {
      final l$reply = reply;
      result$data['reply'] = l$reply;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationReactToCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cardId = cardId;
    final lOther$cardId = other.cardId;
    if (l$cardId != lOther$cardId) {
      return false;
    }
    final l$reaction = reaction;
    final lOther$reaction = other.reaction;
    if (_$data.containsKey('reaction') != other._$data.containsKey('reaction')) {
      return false;
    }
    if (l$reaction != lOther$reaction) {
      return false;
    }
    final l$reply = reply;
    final lOther$reply = other.reply;
    if (_$data.containsKey('reply') != other._$data.containsKey('reply')) {
      return false;
    }
    if (l$reply != lOther$reply) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$cardId = cardId;
    final l$reaction = reaction;
    final l$reply = reply;
    return Object.hashAll([
      l$cardId,
      _$data.containsKey('reaction') ? l$reaction : const {},
      _$data.containsKey('reply') ? l$reply : const {},
    ]);
  }
}

class MutationReactToCard {
  MutationReactToCard({this.reactToCard, this.$__typename = 'Mutation'});

  factory MutationReactToCard.fromJson(Map<String, dynamic> json) {
    final l$reactToCard = json['reactToCard'];
    final l$$__typename = json['__typename'];
    return MutationReactToCard(
      reactToCard: l$reactToCard == null
          ? null
          : MutationReactToCardreactToCard.fromJson((l$reactToCard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationReactToCardreactToCard? reactToCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reactToCard = reactToCard;
    _resultData['reactToCard'] = l$reactToCard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reactToCard = reactToCard;
    final l$$__typename = $__typename;
    return Object.hashAll([l$reactToCard, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationReactToCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$reactToCard = reactToCard;
    final lOther$reactToCard = other.reactToCard;
    if (l$reactToCard != lOther$reactToCard) {
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

const documentNodeMutationReactToCard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ReactToCard'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cardId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'reaction')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'reply')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'reactToCard'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'cardId'),
                value: VariableNode(name: NameNode(value: 'cardId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'reaction'),
                value: VariableNode(name: NameNode(value: 'reaction')),
              ),
              ArgumentNode(
                name: NameNode(value: 'reply'),
                value: VariableNode(name: NameNode(value: 'reply')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'reaction'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'reply'),
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
MutationReactToCard _parserFnMutationReactToCard(Map<String, dynamic> data) =>
    MutationReactToCard.fromJson(data);
typedef OnMutationCompletedMutationReactToCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationReactToCard?,
);

class OptionsMutationReactToCard extends graphql.MutationOptions<MutationReactToCard> {
  OptionsMutationReactToCard({
    String? operationName,
    required VariablesMutationReactToCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationReactToCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationReactToCard? onCompleted,
    graphql.OnMutationUpdate<MutationReactToCard>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'ReactToCard',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationReactToCard(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationReactToCard,
         parserFn: _parserFnMutationReactToCard,
       );

  final OnMutationCompletedMutationReactToCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationReactToCard extends graphql.WatchQueryOptions<MutationReactToCard> {
  WatchOptionsMutationReactToCard({
    String? operationName,
    required VariablesMutationReactToCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationReactToCard? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'ReactToCard',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationReactToCard,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationReactToCard,
       );
}

extension ClientExtensionMutationReactToCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationReactToCard>> mutateReactToCard(
    OptionsMutationReactToCard options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationReactToCard> watchMutationReactToCard(
    WatchOptionsMutationReactToCard options,
  ) => this.watchMutation(options);
}

class MutationReactToCardreactToCard {
  MutationReactToCardreactToCard({this.reaction, this.reply, this.$__typename = 'CardReactions'});

  factory MutationReactToCardreactToCard.fromJson(Map<String, dynamic> json) {
    final l$reaction = json['reaction'];
    final l$reply = json['reply'];
    final l$$__typename = json['__typename'];
    return MutationReactToCardreactToCard(
      reaction: (l$reaction as String?),
      reply: (l$reply as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? reaction;

  final String? reply;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reaction = reaction;
    _resultData['reaction'] = l$reaction;
    final l$reply = reply;
    _resultData['reply'] = l$reply;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reaction = reaction;
    final l$reply = reply;
    final l$$__typename = $__typename;
    return Object.hashAll([l$reaction, l$reply, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationReactToCardreactToCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$reaction = reaction;
    final lOther$reaction = other.reaction;
    if (l$reaction != lOther$reaction) {
      return false;
    }
    final l$reply = reply;
    final lOther$reply = other.reply;
    if (l$reply != lOther$reply) {
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
