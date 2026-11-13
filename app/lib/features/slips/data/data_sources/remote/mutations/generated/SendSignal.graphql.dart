// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSendSignal {
  factory VariablesMutationSendSignal({required String kind, String? value, String? body}) =>
      VariablesMutationSendSignal._({
        r'kind': kind,
        if (value != null) r'value': value,
        if (body != null) r'body': body,
      });

  VariablesMutationSendSignal._(this._$data);

  factory VariablesMutationSendSignal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$kind = data['kind'];
    result$data['kind'] = (l$kind as String);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    return VariablesMutationSendSignal._(result$data);
  }

  Map<String, dynamic> _$data;

  String get kind => (_$data['kind'] as String);

  String? get value => (_$data['value'] as String?);

  String? get body => (_$data['body'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$kind = kind;
    result$data['kind'] = l$kind;
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSendSignal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$kind = kind;
    final l$value = value;
    final l$body = body;
    return Object.hashAll([
      l$kind,
      _$data.containsKey('value') ? l$value : const {},
      _$data.containsKey('body') ? l$body : const {},
    ]);
  }
}

class MutationSendSignal {
  MutationSendSignal({this.sendSignal, this.$__typename = 'Mutation'});

  factory MutationSendSignal.fromJson(Map<String, dynamic> json) {
    final l$sendSignal = json['sendSignal'];
    final l$$__typename = json['__typename'];
    return MutationSendSignal(
      sendSignal: l$sendSignal == null
          ? null
          : MutationSendSignalsendSignal.fromJson((l$sendSignal as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSendSignalsendSignal? sendSignal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendSignal = sendSignal;
    _resultData['sendSignal'] = l$sendSignal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendSignal = sendSignal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendSignal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSendSignal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendSignal = sendSignal;
    final lOther$sendSignal = other.sendSignal;
    if (l$sendSignal != lOther$sendSignal) {
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

const documentNodeMutationSendSignal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SendSignal'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'value')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'sendSignal'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: VariableNode(name: NameNode(value: 'kind')),
              ),
              ArgumentNode(
                name: NameNode(value: 'value'),
                value: VariableNode(name: NameNode(value: 'value')),
              ),
              ArgumentNode(
                name: NameNode(value: 'body'),
                value: VariableNode(name: NameNode(value: 'body')),
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
MutationSendSignal _parserFnMutationSendSignal(Map<String, dynamic> data) =>
    MutationSendSignal.fromJson(data);
typedef OnMutationCompletedMutationSendSignal = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSendSignal?,
);

class OptionsMutationSendSignal extends graphql.MutationOptions<MutationSendSignal> {
  OptionsMutationSendSignal({
    String? operationName,
    required VariablesMutationSendSignal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSendSignal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSendSignal? onCompleted,
    graphql.OnMutationUpdate<MutationSendSignal>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationSendSignal(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSendSignal,
         parserFn: _parserFnMutationSendSignal,
       );

  final OnMutationCompletedMutationSendSignal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSendSignal extends graphql.WatchQueryOptions<MutationSendSignal> {
  WatchOptionsMutationSendSignal({
    String? operationName,
    required VariablesMutationSendSignal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSendSignal? typedOptimisticResult,
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
         document: documentNodeMutationSendSignal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSendSignal,
       );
}

extension ClientExtensionMutationSendSignal on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSendSignal>> mutateSendSignal(
    OptionsMutationSendSignal options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSendSignal> watchMutationSendSignal(
    WatchOptionsMutationSendSignal options,
  ) => this.watchMutation(options);
}

class MutationSendSignalsendSignal {
  MutationSendSignalsendSignal({required this.id, this.$__typename = 'Signals'});

  factory MutationSendSignalsendSignal.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSendSignalsendSignal(
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
    if (other is! MutationSendSignalsendSignal || runtimeType != other.runtimeType) {
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
