// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationStartPause {
  factory VariablesMutationStartPause({required DateTime returnAt, String? message}) =>
      VariablesMutationStartPause._({
        r'returnAt': returnAt,
        if (message != null) r'message': message,
      });

  VariablesMutationStartPause._(this._$data);

  factory VariablesMutationStartPause.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$returnAt = data['returnAt'];
    result$data['returnAt'] = DateTime.parse((l$returnAt as String));
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    return VariablesMutationStartPause._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime get returnAt => (_$data['returnAt'] as DateTime);

  String? get message => (_$data['message'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$returnAt = returnAt;
    result$data['returnAt'] = ((v) => v.toUtc().toIso8601String())(l$returnAt);
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] = l$message;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationStartPause || runtimeType != other.runtimeType) {
      return false;
    }
    final l$returnAt = returnAt;
    final lOther$returnAt = other.returnAt;
    if (l$returnAt != lOther$returnAt) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (_$data.containsKey('message') != other._$data.containsKey('message')) {
      return false;
    }
    if (l$message != lOther$message) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$returnAt = returnAt;
    final l$message = message;
    return Object.hashAll([l$returnAt, _$data.containsKey('message') ? l$message : const {}]);
  }
}

class MutationStartPause {
  MutationStartPause({this.startPause, this.$__typename = 'Mutation'});

  factory MutationStartPause.fromJson(Map<String, dynamic> json) {
    final l$startPause = json['startPause'];
    final l$$__typename = json['__typename'];
    return MutationStartPause(
      startPause: l$startPause == null
          ? null
          : MutationStartPausestartPause.fromJson((l$startPause as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationStartPausestartPause? startPause;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$startPause = startPause;
    _resultData['startPause'] = l$startPause?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$startPause = startPause;
    final l$$__typename = $__typename;
    return Object.hashAll([l$startPause, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationStartPause || runtimeType != other.runtimeType) {
      return false;
    }
    final l$startPause = startPause;
    final lOther$startPause = other.startPause;
    if (l$startPause != lOther$startPause) {
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

const documentNodeMutationStartPause = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'StartPause'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'returnAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'message')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'startPause'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'returnAt'),
                value: VariableNode(name: NameNode(value: 'returnAt')),
              ),
              ArgumentNode(
                name: NameNode(value: 'message'),
                value: VariableNode(name: NameNode(value: 'message')),
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
MutationStartPause _parserFnMutationStartPause(Map<String, dynamic> data) =>
    MutationStartPause.fromJson(data);
typedef OnMutationCompletedMutationStartPause = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationStartPause?,
);

class OptionsMutationStartPause extends graphql.MutationOptions<MutationStartPause> {
  OptionsMutationStartPause({
    String? operationName,
    required VariablesMutationStartPause variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationStartPause? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationStartPause? onCompleted,
    graphql.OnMutationUpdate<MutationStartPause>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationStartPause(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationStartPause,
         parserFn: _parserFnMutationStartPause,
       );

  final OnMutationCompletedMutationStartPause? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationStartPause extends graphql.WatchQueryOptions<MutationStartPause> {
  WatchOptionsMutationStartPause({
    String? operationName,
    required VariablesMutationStartPause variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationStartPause? typedOptimisticResult,
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
         document: documentNodeMutationStartPause,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationStartPause,
       );
}

extension ClientExtensionMutationStartPause on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationStartPause>> mutateStartPause(
    OptionsMutationStartPause options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationStartPause> watchMutationStartPause(
    WatchOptionsMutationStartPause options,
  ) => this.watchMutation(options);
}

class MutationStartPausestartPause {
  MutationStartPausestartPause({required this.id, this.$__typename = 'Pauses'});

  factory MutationStartPausestartPause.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationStartPausestartPause(
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
    if (other is! MutationStartPausestartPause || runtimeType != other.runtimeType) {
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
