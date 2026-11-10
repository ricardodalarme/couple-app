// dart format width=100
import '../../fragments/generated/CardFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateCardDraft {
  factory VariablesMutationUpdateCardDraft({
    required String cardId,
    required List<String?> slipIds,
    String? note,
  }) => VariablesMutationUpdateCardDraft._({
    r'cardId': cardId,
    r'slipIds': slipIds,
    if (note != null) r'note': note,
  });

  VariablesMutationUpdateCardDraft._(this._$data);

  factory VariablesMutationUpdateCardDraft.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$cardId = data['cardId'];
    result$data['cardId'] = (l$cardId as String);
    final l$slipIds = data['slipIds'];
    result$data['slipIds'] = (l$slipIds as List<dynamic>).map((e) => (e as String?)).toList();
    if (data.containsKey('note')) {
      final l$note = data['note'];
      result$data['note'] = (l$note as String?);
    }
    return VariablesMutationUpdateCardDraft._(result$data);
  }

  Map<String, dynamic> _$data;

  String get cardId => (_$data['cardId'] as String);

  List<String?> get slipIds => (_$data['slipIds'] as List<String?>);

  String? get note => (_$data['note'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$cardId = cardId;
    result$data['cardId'] = l$cardId;
    final l$slipIds = slipIds;
    result$data['slipIds'] = l$slipIds.map((e) => e).toList();
    if (_$data.containsKey('note')) {
      final l$note = note;
      result$data['note'] = l$note;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateCardDraft || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cardId = cardId;
    final lOther$cardId = other.cardId;
    if (l$cardId != lOther$cardId) {
      return false;
    }
    final l$slipIds = slipIds;
    final lOther$slipIds = other.slipIds;
    if (l$slipIds.length != lOther$slipIds.length) {
      return false;
    }
    for (int i = 0; i < l$slipIds.length; i++) {
      final l$slipIds$entry = l$slipIds[i];
      final lOther$slipIds$entry = lOther$slipIds[i];
      if (l$slipIds$entry != lOther$slipIds$entry) {
        return false;
      }
    }
    final l$note = note;
    final lOther$note = other.note;
    if (_$data.containsKey('note') != other._$data.containsKey('note')) {
      return false;
    }
    if (l$note != lOther$note) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$cardId = cardId;
    final l$slipIds = slipIds;
    final l$note = note;
    return Object.hashAll([
      l$cardId,
      Object.hashAll(l$slipIds.map((v) => v)),
      _$data.containsKey('note') ? l$note : const {},
    ]);
  }
}

class MutationUpdateCardDraft {
  MutationUpdateCardDraft({this.updateCardDraft, this.$__typename = 'Mutation'});

  factory MutationUpdateCardDraft.fromJson(Map<String, dynamic> json) {
    final l$updateCardDraft = json['updateCardDraft'];
    final l$$__typename = json['__typename'];
    return MutationUpdateCardDraft(
      updateCardDraft: l$updateCardDraft == null
          ? null
          : FragmentCardFragment.fromJson((l$updateCardDraft as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentCardFragment? updateCardDraft;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCardDraft = updateCardDraft;
    _resultData['updateCardDraft'] = l$updateCardDraft?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCardDraft = updateCardDraft;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateCardDraft, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateCardDraft || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCardDraft = updateCardDraft;
    final lOther$updateCardDraft = other.updateCardDraft;
    if (l$updateCardDraft != lOther$updateCardDraft) {
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

const documentNodeMutationUpdateCardDraft = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateCardDraft'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cardId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'slipIds')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'note')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateCardDraft'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'cardId'),
                value: VariableNode(name: NameNode(value: 'cardId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'slipIds'),
                value: VariableNode(name: NameNode(value: 'slipIds')),
              ),
              ArgumentNode(
                name: NameNode(value: 'note'),
                value: VariableNode(name: NameNode(value: 'note')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'CardFragment'),
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
    fragmentDefinitionCardFragment,
  ],
);
MutationUpdateCardDraft _parserFnMutationUpdateCardDraft(Map<String, dynamic> data) =>
    MutationUpdateCardDraft.fromJson(data);
typedef OnMutationCompletedMutationUpdateCardDraft = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateCardDraft?,
);

class OptionsMutationUpdateCardDraft extends graphql.MutationOptions<MutationUpdateCardDraft> {
  OptionsMutationUpdateCardDraft({
    String? operationName,
    required VariablesMutationUpdateCardDraft variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateCardDraft? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateCardDraft? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateCardDraft>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationUpdateCardDraft(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateCardDraft,
         parserFn: _parserFnMutationUpdateCardDraft,
       );

  final OnMutationCompletedMutationUpdateCardDraft? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateCardDraft
    extends graphql.WatchQueryOptions<MutationUpdateCardDraft> {
  WatchOptionsMutationUpdateCardDraft({
    String? operationName,
    required VariablesMutationUpdateCardDraft variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateCardDraft? typedOptimisticResult,
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
         document: documentNodeMutationUpdateCardDraft,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateCardDraft,
       );
}

extension ClientExtensionMutationUpdateCardDraft on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateCardDraft>> mutateUpdateCardDraft(
    OptionsMutationUpdateCardDraft options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateCardDraft> watchMutationUpdateCardDraft(
    WatchOptionsMutationUpdateCardDraft options,
  ) => this.watchMutation(options);
}
