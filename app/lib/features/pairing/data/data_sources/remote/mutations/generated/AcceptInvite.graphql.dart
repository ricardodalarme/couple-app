// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAcceptInvite {
  factory VariablesMutationAcceptInvite({required String code}) =>
      VariablesMutationAcceptInvite._({r'code': code});

  VariablesMutationAcceptInvite._(this._$data);

  factory VariablesMutationAcceptInvite.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return VariablesMutationAcceptInvite._(result$data);
  }

  Map<String, dynamic> _$data;

  String get code => (_$data['code'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAcceptInvite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }
}

class MutationAcceptInvite {
  MutationAcceptInvite({this.acceptInvite, this.$__typename = 'Mutation'});

  factory MutationAcceptInvite.fromJson(Map<String, dynamic> json) {
    final l$acceptInvite = json['acceptInvite'];
    final l$$__typename = json['__typename'];
    return MutationAcceptInvite(
      acceptInvite: l$acceptInvite == null
          ? null
          : MutationAcceptInviteacceptInvite.fromJson((l$acceptInvite as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAcceptInviteacceptInvite? acceptInvite;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$acceptInvite = acceptInvite;
    _resultData['acceptInvite'] = l$acceptInvite?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$acceptInvite = acceptInvite;
    final l$$__typename = $__typename;
    return Object.hashAll([l$acceptInvite, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAcceptInvite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$acceptInvite = acceptInvite;
    final lOther$acceptInvite = other.acceptInvite;
    if (l$acceptInvite != lOther$acceptInvite) {
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

const documentNodeMutationAcceptInvite = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AcceptInvite'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'code')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'acceptInvite'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'code'),
                value: VariableNode(name: NameNode(value: 'code')),
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
MutationAcceptInvite _parserFnMutationAcceptInvite(Map<String, dynamic> data) =>
    MutationAcceptInvite.fromJson(data);
typedef OnMutationCompletedMutationAcceptInvite = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAcceptInvite?,
);

class OptionsMutationAcceptInvite extends graphql.MutationOptions<MutationAcceptInvite> {
  OptionsMutationAcceptInvite({
    String? operationName,
    required VariablesMutationAcceptInvite variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAcceptInvite? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAcceptInvite? onCompleted,
    graphql.OnMutationUpdate<MutationAcceptInvite>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationAcceptInvite(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAcceptInvite,
         parserFn: _parserFnMutationAcceptInvite,
       );

  final OnMutationCompletedMutationAcceptInvite? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAcceptInvite extends graphql.WatchQueryOptions<MutationAcceptInvite> {
  WatchOptionsMutationAcceptInvite({
    String? operationName,
    required VariablesMutationAcceptInvite variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAcceptInvite? typedOptimisticResult,
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
         document: documentNodeMutationAcceptInvite,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAcceptInvite,
       );
}

extension ClientExtensionMutationAcceptInvite on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAcceptInvite>> mutateAcceptInvite(
    OptionsMutationAcceptInvite options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAcceptInvite> watchMutationAcceptInvite(
    WatchOptionsMutationAcceptInvite options,
  ) => this.watchMutation(options);
}

class MutationAcceptInviteacceptInvite {
  MutationAcceptInviteacceptInvite({required this.id, this.$__typename = 'Couples'});

  factory MutationAcceptInviteacceptInvite.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationAcceptInviteacceptInvite(
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
    if (other is! MutationAcceptInviteacceptInvite || runtimeType != other.runtimeType) {
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
