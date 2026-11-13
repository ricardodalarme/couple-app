// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationSendMissUs {
  MutationSendMissUs({this.sendSignal, this.$__typename = 'Mutation'});

  factory MutationSendMissUs.fromJson(Map<String, dynamic> json) {
    final l$sendSignal = json['sendSignal'];
    final l$$__typename = json['__typename'];
    return MutationSendMissUs(
      sendSignal: l$sendSignal == null
          ? null
          : MutationSendMissUssendSignal.fromJson((l$sendSignal as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSendMissUssendSignal? sendSignal;

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
    if (other is! MutationSendMissUs || runtimeType != other.runtimeType) {
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

const documentNodeMutationSendMissUs = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SendMissUs'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'sendSignal'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: StringValueNode(value: 'miss_us', isBlock: false),
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
MutationSendMissUs _parserFnMutationSendMissUs(Map<String, dynamic> data) =>
    MutationSendMissUs.fromJson(data);
typedef OnMutationCompletedMutationSendMissUs = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSendMissUs?,
);

class OptionsMutationSendMissUs extends graphql.MutationOptions<MutationSendMissUs> {
  OptionsMutationSendMissUs({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSendMissUs? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSendMissUs? onCompleted,
    graphql.OnMutationUpdate<MutationSendMissUs>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationSendMissUs(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSendMissUs,
         parserFn: _parserFnMutationSendMissUs,
       );

  final OnMutationCompletedMutationSendMissUs? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSendMissUs extends graphql.WatchQueryOptions<MutationSendMissUs> {
  WatchOptionsMutationSendMissUs({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSendMissUs? typedOptimisticResult,
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
         document: documentNodeMutationSendMissUs,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSendMissUs,
       );
}

extension ClientExtensionMutationSendMissUs on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSendMissUs>> mutateSendMissUs([
    OptionsMutationSendMissUs? options,
  ]) async => await this.mutate(options ?? OptionsMutationSendMissUs());

  graphql.ObservableQuery<MutationSendMissUs> watchMutationSendMissUs([
    WatchOptionsMutationSendMissUs? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationSendMissUs());
}

class MutationSendMissUssendSignal {
  MutationSendMissUssendSignal({required this.id, this.$__typename = 'Signals'});

  factory MutationSendMissUssendSignal.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSendMissUssendSignal(
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
    if (other is! MutationSendMissUssendSignal || runtimeType != other.runtimeType) {
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
