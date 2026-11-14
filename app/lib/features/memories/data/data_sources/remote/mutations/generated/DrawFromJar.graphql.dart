// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationDrawFromJar {
  MutationDrawFromJar({this.drawFromJar, this.$__typename = 'Mutation'});

  factory MutationDrawFromJar.fromJson(Map<String, dynamic> json) {
    final l$drawFromJar = json['drawFromJar'];
    final l$$__typename = json['__typename'];
    return MutationDrawFromJar(
      drawFromJar: l$drawFromJar == null
          ? null
          : MutationDrawFromJardrawFromJar.fromJson((l$drawFromJar as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDrawFromJardrawFromJar? drawFromJar;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$drawFromJar = drawFromJar;
    _resultData['drawFromJar'] = l$drawFromJar?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$drawFromJar = drawFromJar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$drawFromJar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDrawFromJar || runtimeType != other.runtimeType) {
      return false;
    }
    final l$drawFromJar = drawFromJar;
    final lOther$drawFromJar = other.drawFromJar;
    if (l$drawFromJar != lOther$drawFromJar) {
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

const documentNodeMutationDrawFromJar = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DrawFromJar'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'drawFromJar'),
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
                  name: NameNode(value: 'body'),
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
MutationDrawFromJar _parserFnMutationDrawFromJar(Map<String, dynamic> data) =>
    MutationDrawFromJar.fromJson(data);
typedef OnMutationCompletedMutationDrawFromJar = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDrawFromJar?,
);

class OptionsMutationDrawFromJar extends graphql.MutationOptions<MutationDrawFromJar> {
  OptionsMutationDrawFromJar({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDrawFromJar? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDrawFromJar? onCompleted,
    graphql.OnMutationUpdate<MutationDrawFromJar>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName ?? 'DrawFromJar',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationDrawFromJar(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDrawFromJar,
         parserFn: _parserFnMutationDrawFromJar,
       );

  final OnMutationCompletedMutationDrawFromJar? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDrawFromJar extends graphql.WatchQueryOptions<MutationDrawFromJar> {
  WatchOptionsMutationDrawFromJar({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDrawFromJar? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'DrawFromJar',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDrawFromJar,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDrawFromJar,
       );
}

extension ClientExtensionMutationDrawFromJar on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDrawFromJar>> mutateDrawFromJar([
    OptionsMutationDrawFromJar? options,
  ]) async => await this.mutate(options ?? OptionsMutationDrawFromJar());

  graphql.ObservableQuery<MutationDrawFromJar> watchMutationDrawFromJar([
    WatchOptionsMutationDrawFromJar? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationDrawFromJar());
}

class MutationDrawFromJardrawFromJar {
  MutationDrawFromJardrawFromJar({
    required this.id,
    required this.body,
    this.$__typename = 'Slips',
  });

  factory MutationDrawFromJardrawFromJar.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return MutationDrawFromJardrawFromJar(
      id: (l$id as String),
      body: (l$body as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDrawFromJardrawFromJar || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
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
