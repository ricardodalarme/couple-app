// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationShareLoveStyle {
  factory VariablesMutationShareLoveStyle({required String body}) =>
      VariablesMutationShareLoveStyle._({r'body': body});

  VariablesMutationShareLoveStyle._(this._$data);

  factory VariablesMutationShareLoveStyle.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    return VariablesMutationShareLoveStyle._(result$data);
  }

  Map<String, dynamic> _$data;

  String get body => (_$data['body'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$body = body;
    result$data['body'] = l$body;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationShareLoveStyle || runtimeType != other.runtimeType) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$body = body;
    return Object.hashAll([l$body]);
  }
}

class MutationShareLoveStyle {
  MutationShareLoveStyle({this.sendPartnerMessage, this.$__typename = 'Mutation'});

  factory MutationShareLoveStyle.fromJson(Map<String, dynamic> json) {
    final l$sendPartnerMessage = json['sendPartnerMessage'];
    final l$$__typename = json['__typename'];
    return MutationShareLoveStyle(
      sendPartnerMessage: l$sendPartnerMessage == null
          ? null
          : MutationShareLoveStylesendPartnerMessage.fromJson(
              (l$sendPartnerMessage as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationShareLoveStylesendPartnerMessage? sendPartnerMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendPartnerMessage = sendPartnerMessage;
    _resultData['sendPartnerMessage'] = l$sendPartnerMessage?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendPartnerMessage = sendPartnerMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendPartnerMessage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationShareLoveStyle || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendPartnerMessage = sendPartnerMessage;
    final lOther$sendPartnerMessage = other.sendPartnerMessage;
    if (l$sendPartnerMessage != lOther$sendPartnerMessage) {
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

const documentNodeMutationShareLoveStyle = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ShareLoveStyle'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'sendPartnerMessage'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: StringValueNode(value: 'note', isBlock: false),
              ),
              ArgumentNode(
                name: NameNode(value: 'body'),
                value: VariableNode(name: NameNode(value: 'body')),
              ),
              ArgumentNode(
                name: NameNode(value: 'forWidget'),
                value: BooleanValueNode(value: true),
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
MutationShareLoveStyle _parserFnMutationShareLoveStyle(Map<String, dynamic> data) =>
    MutationShareLoveStyle.fromJson(data);
typedef OnMutationCompletedMutationShareLoveStyle = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationShareLoveStyle?,
);

class OptionsMutationShareLoveStyle extends graphql.MutationOptions<MutationShareLoveStyle> {
  OptionsMutationShareLoveStyle({
    String? operationName,
    required VariablesMutationShareLoveStyle variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationShareLoveStyle? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationShareLoveStyle? onCompleted,
    graphql.OnMutationUpdate<MutationShareLoveStyle>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationShareLoveStyle(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationShareLoveStyle,
         parserFn: _parserFnMutationShareLoveStyle,
       );

  final OnMutationCompletedMutationShareLoveStyle? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationShareLoveStyle extends graphql.WatchQueryOptions<MutationShareLoveStyle> {
  WatchOptionsMutationShareLoveStyle({
    String? operationName,
    required VariablesMutationShareLoveStyle variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationShareLoveStyle? typedOptimisticResult,
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
         document: documentNodeMutationShareLoveStyle,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationShareLoveStyle,
       );
}

extension ClientExtensionMutationShareLoveStyle on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationShareLoveStyle>> mutateShareLoveStyle(
    OptionsMutationShareLoveStyle options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationShareLoveStyle> watchMutationShareLoveStyle(
    WatchOptionsMutationShareLoveStyle options,
  ) => this.watchMutation(options);
}

class MutationShareLoveStylesendPartnerMessage {
  MutationShareLoveStylesendPartnerMessage({
    required this.id,
    this.$__typename = 'PartnerMessages',
  });

  factory MutationShareLoveStylesendPartnerMessage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationShareLoveStylesendPartnerMessage(
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
    if (other is! MutationShareLoveStylesendPartnerMessage || runtimeType != other.runtimeType) {
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
