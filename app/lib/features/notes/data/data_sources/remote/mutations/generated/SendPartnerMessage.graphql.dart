// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSendPartnerMessage {
  factory VariablesMutationSendPartnerMessage({
    required String kind,
    String? body,
    String? mediaPath,
    bool? forWidget,
  }) => VariablesMutationSendPartnerMessage._({
    r'kind': kind,
    if (body != null) r'body': body,
    if (mediaPath != null) r'mediaPath': mediaPath,
    if (forWidget != null) r'forWidget': forWidget,
  });

  VariablesMutationSendPartnerMessage._(this._$data);

  factory VariablesMutationSendPartnerMessage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$kind = data['kind'];
    result$data['kind'] = (l$kind as String);
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    if (data.containsKey('mediaPath')) {
      final l$mediaPath = data['mediaPath'];
      result$data['mediaPath'] = (l$mediaPath as String?);
    }
    if (data.containsKey('forWidget')) {
      final l$forWidget = data['forWidget'];
      result$data['forWidget'] = (l$forWidget as bool?);
    }
    return VariablesMutationSendPartnerMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  String get kind => (_$data['kind'] as String);

  String? get body => (_$data['body'] as String?);

  String? get mediaPath => (_$data['mediaPath'] as String?);

  bool? get forWidget => (_$data['forWidget'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$kind = kind;
    result$data['kind'] = l$kind;
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    if (_$data.containsKey('mediaPath')) {
      final l$mediaPath = mediaPath;
      result$data['mediaPath'] = l$mediaPath;
    }
    if (_$data.containsKey('forWidget')) {
      final l$forWidget = forWidget;
      result$data['forWidget'] = l$forWidget;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSendPartnerMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    final l$mediaPath = mediaPath;
    final lOther$mediaPath = other.mediaPath;
    if (_$data.containsKey('mediaPath') != other._$data.containsKey('mediaPath')) {
      return false;
    }
    if (l$mediaPath != lOther$mediaPath) {
      return false;
    }
    final l$forWidget = forWidget;
    final lOther$forWidget = other.forWidget;
    if (_$data.containsKey('forWidget') != other._$data.containsKey('forWidget')) {
      return false;
    }
    if (l$forWidget != lOther$forWidget) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$kind = kind;
    final l$body = body;
    final l$mediaPath = mediaPath;
    final l$forWidget = forWidget;
    return Object.hashAll([
      l$kind,
      _$data.containsKey('body') ? l$body : const {},
      _$data.containsKey('mediaPath') ? l$mediaPath : const {},
      _$data.containsKey('forWidget') ? l$forWidget : const {},
    ]);
  }
}

class MutationSendPartnerMessage {
  MutationSendPartnerMessage({this.sendPartnerMessage, this.$__typename = 'Mutation'});

  factory MutationSendPartnerMessage.fromJson(Map<String, dynamic> json) {
    final l$sendPartnerMessage = json['sendPartnerMessage'];
    final l$$__typename = json['__typename'];
    return MutationSendPartnerMessage(
      sendPartnerMessage: l$sendPartnerMessage == null
          ? null
          : MutationSendPartnerMessagesendPartnerMessage.fromJson(
              (l$sendPartnerMessage as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSendPartnerMessagesendPartnerMessage? sendPartnerMessage;

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
    if (other is! MutationSendPartnerMessage || runtimeType != other.runtimeType) {
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

const documentNodeMutationSendPartnerMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SendPartnerMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'mediaPath')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'forWidget')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: false),
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
                value: VariableNode(name: NameNode(value: 'kind')),
              ),
              ArgumentNode(
                name: NameNode(value: 'body'),
                value: VariableNode(name: NameNode(value: 'body')),
              ),
              ArgumentNode(
                name: NameNode(value: 'mediaPath'),
                value: VariableNode(name: NameNode(value: 'mediaPath')),
              ),
              ArgumentNode(
                name: NameNode(value: 'forWidget'),
                value: VariableNode(name: NameNode(value: 'forWidget')),
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
MutationSendPartnerMessage _parserFnMutationSendPartnerMessage(Map<String, dynamic> data) =>
    MutationSendPartnerMessage.fromJson(data);
typedef OnMutationCompletedMutationSendPartnerMessage = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSendPartnerMessage?,
);

class OptionsMutationSendPartnerMessage
    extends graphql.MutationOptions<MutationSendPartnerMessage> {
  OptionsMutationSendPartnerMessage({
    String? operationName,
    required VariablesMutationSendPartnerMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSendPartnerMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSendPartnerMessage? onCompleted,
    graphql.OnMutationUpdate<MutationSendPartnerMessage>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SendPartnerMessage',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSendPartnerMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSendPartnerMessage,
         parserFn: _parserFnMutationSendPartnerMessage,
       );

  final OnMutationCompletedMutationSendPartnerMessage? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSendPartnerMessage
    extends graphql.WatchQueryOptions<MutationSendPartnerMessage> {
  WatchOptionsMutationSendPartnerMessage({
    String? operationName,
    required VariablesMutationSendPartnerMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSendPartnerMessage? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SendPartnerMessage',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSendPartnerMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSendPartnerMessage,
       );
}

extension ClientExtensionMutationSendPartnerMessage on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSendPartnerMessage>> mutateSendPartnerMessage(
    OptionsMutationSendPartnerMessage options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSendPartnerMessage> watchMutationSendPartnerMessage(
    WatchOptionsMutationSendPartnerMessage options,
  ) => this.watchMutation(options);
}

class MutationSendPartnerMessagesendPartnerMessage {
  MutationSendPartnerMessagesendPartnerMessage({
    required this.id,
    this.$__typename = 'PartnerMessages',
  });

  factory MutationSendPartnerMessagesendPartnerMessage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSendPartnerMessagesendPartnerMessage(
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
    if (other is! MutationSendPartnerMessagesendPartnerMessage ||
        runtimeType != other.runtimeType) {
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
