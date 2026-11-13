// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationCreateInvite {
  MutationCreateInvite({this.createInvite, this.$__typename = 'Mutation'});

  factory MutationCreateInvite.fromJson(Map<String, dynamic> json) {
    final l$createInvite = json['createInvite'];
    final l$$__typename = json['__typename'];
    return MutationCreateInvite(
      createInvite: l$createInvite == null
          ? null
          : MutationCreateInvitecreateInvite.fromJson((l$createInvite as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationCreateInvitecreateInvite? createInvite;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createInvite = createInvite;
    _resultData['createInvite'] = l$createInvite?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createInvite = createInvite;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createInvite, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationCreateInvite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createInvite = createInvite;
    final lOther$createInvite = other.createInvite;
    if (l$createInvite != lOther$createInvite) {
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

const documentNodeMutationCreateInvite = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateInvite'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createInvite'),
            alias: null,
            arguments: [],
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
                  name: NameNode(value: 'code'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'expiresAt'),
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
MutationCreateInvite _parserFnMutationCreateInvite(Map<String, dynamic> data) =>
    MutationCreateInvite.fromJson(data);
typedef OnMutationCompletedMutationCreateInvite = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationCreateInvite?,
);

class OptionsMutationCreateInvite extends graphql.MutationOptions<MutationCreateInvite> {
  OptionsMutationCreateInvite({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCreateInvite? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationCreateInvite? onCompleted,
    graphql.OnMutationUpdate<MutationCreateInvite>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationCreateInvite(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateInvite,
         parserFn: _parserFnMutationCreateInvite,
       );

  final OnMutationCompletedMutationCreateInvite? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationCreateInvite extends graphql.WatchQueryOptions<MutationCreateInvite> {
  WatchOptionsMutationCreateInvite({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCreateInvite? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationCreateInvite,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationCreateInvite,
       );
}

extension ClientExtensionMutationCreateInvite on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationCreateInvite>> mutateCreateInvite([
    OptionsMutationCreateInvite? options,
  ]) async => await this.mutate(options ?? OptionsMutationCreateInvite());

  graphql.ObservableQuery<MutationCreateInvite> watchMutationCreateInvite([
    WatchOptionsMutationCreateInvite? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationCreateInvite());
}

class MutationCreateInvitecreateInvite {
  MutationCreateInvitecreateInvite({
    this.id,
    this.code,
    this.expiresAt,
    this.$__typename = 'InviteCreated',
  });

  factory MutationCreateInvitecreateInvite.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$code = json['code'];
    final l$expiresAt = json['expiresAt'];
    final l$$__typename = json['__typename'];
    return MutationCreateInvitecreateInvite(
      id: (l$id as String?),
      code: (l$code as String?),
      expiresAt: l$expiresAt == null ? null : DateTime.parse((l$expiresAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? code;

  final DateTime? expiresAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$code = code;
    _resultData['code'] = l$code;
    final l$expiresAt = expiresAt;
    _resultData['expiresAt'] = l$expiresAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$expiresAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$code = code;
    final l$expiresAt = expiresAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$code, l$expiresAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationCreateInvitecreateInvite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    final l$expiresAt = expiresAt;
    final lOther$expiresAt = other.expiresAt;
    if (l$expiresAt != lOther$expiresAt) {
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
