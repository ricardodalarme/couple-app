// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeletePartnerMessage {
  factory VariablesMutationDeletePartnerMessage({required String messageId}) =>
      VariablesMutationDeletePartnerMessage._({r'messageId': messageId});

  VariablesMutationDeletePartnerMessage._(this._$data);

  factory VariablesMutationDeletePartnerMessage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$messageId = data['messageId'];
    result$data['messageId'] = (l$messageId as String);
    return VariablesMutationDeletePartnerMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  String get messageId => (_$data['messageId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$messageId = messageId;
    result$data['messageId'] = l$messageId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationDeletePartnerMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$messageId = messageId;
    final lOther$messageId = other.messageId;
    if (l$messageId != lOther$messageId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$messageId = messageId;
    return Object.hashAll([l$messageId]);
  }
}

class MutationDeletePartnerMessage {
  MutationDeletePartnerMessage({this.deletePartnerMessage, this.$__typename = 'Mutation'});

  factory MutationDeletePartnerMessage.fromJson(Map<String, dynamic> json) {
    final l$deletePartnerMessage = json['deletePartnerMessage'];
    final l$$__typename = json['__typename'];
    return MutationDeletePartnerMessage(
      deletePartnerMessage: (l$deletePartnerMessage as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deletePartnerMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletePartnerMessage = deletePartnerMessage;
    _resultData['deletePartnerMessage'] = l$deletePartnerMessage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletePartnerMessage = deletePartnerMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deletePartnerMessage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeletePartnerMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletePartnerMessage = deletePartnerMessage;
    final lOther$deletePartnerMessage = other.deletePartnerMessage;
    if (l$deletePartnerMessage != lOther$deletePartnerMessage) {
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

const documentNodeMutationDeletePartnerMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeletePartnerMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'messageId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deletePartnerMessage'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'messageId'),
                value: VariableNode(name: NameNode(value: 'messageId')),
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
MutationDeletePartnerMessage _parserFnMutationDeletePartnerMessage(Map<String, dynamic> data) =>
    MutationDeletePartnerMessage.fromJson(data);
typedef OnMutationCompletedMutationDeletePartnerMessage = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeletePartnerMessage?,
);

class OptionsMutationDeletePartnerMessage
    extends graphql.MutationOptions<MutationDeletePartnerMessage> {
  OptionsMutationDeletePartnerMessage({
    String? operationName,
    required VariablesMutationDeletePartnerMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeletePartnerMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeletePartnerMessage? onCompleted,
    graphql.OnMutationUpdate<MutationDeletePartnerMessage>? update,
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
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationDeletePartnerMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeletePartnerMessage,
         parserFn: _parserFnMutationDeletePartnerMessage,
       );

  final OnMutationCompletedMutationDeletePartnerMessage? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeletePartnerMessage
    extends graphql.WatchQueryOptions<MutationDeletePartnerMessage> {
  WatchOptionsMutationDeletePartnerMessage({
    String? operationName,
    required VariablesMutationDeletePartnerMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeletePartnerMessage? typedOptimisticResult,
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
         document: documentNodeMutationDeletePartnerMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeletePartnerMessage,
       );
}

extension ClientExtensionMutationDeletePartnerMessage on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeletePartnerMessage>> mutateDeletePartnerMessage(
    OptionsMutationDeletePartnerMessage options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeletePartnerMessage> watchMutationDeletePartnerMessage(
    WatchOptionsMutationDeletePartnerMessage options,
  ) => this.watchMutation(options);
}
