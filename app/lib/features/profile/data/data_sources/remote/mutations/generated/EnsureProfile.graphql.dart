// dart format width=100
import '../../fragments/generated/ProfileFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationEnsureProfile {
  MutationEnsureProfile({this.ensureProfile, this.$__typename = 'Mutation'});

  factory MutationEnsureProfile.fromJson(Map<String, dynamic> json) {
    final l$ensureProfile = json['ensureProfile'];
    final l$$__typename = json['__typename'];
    return MutationEnsureProfile(
      ensureProfile: l$ensureProfile == null
          ? null
          : FragmentProfileFragment.fromJson((l$ensureProfile as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentProfileFragment? ensureProfile;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$ensureProfile = ensureProfile;
    _resultData['ensureProfile'] = l$ensureProfile?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$ensureProfile = ensureProfile;
    final l$$__typename = $__typename;
    return Object.hashAll([l$ensureProfile, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationEnsureProfile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ensureProfile = ensureProfile;
    final lOther$ensureProfile = other.ensureProfile;
    if (l$ensureProfile != lOther$ensureProfile) {
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

const documentNodeMutationEnsureProfile = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'EnsureProfile'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'ensureProfile'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'ProfileFragment'),
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
    fragmentDefinitionProfileFragment,
  ],
);
MutationEnsureProfile _parserFnMutationEnsureProfile(Map<String, dynamic> data) =>
    MutationEnsureProfile.fromJson(data);
typedef OnMutationCompletedMutationEnsureProfile = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationEnsureProfile?,
);

class OptionsMutationEnsureProfile extends graphql.MutationOptions<MutationEnsureProfile> {
  OptionsMutationEnsureProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationEnsureProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationEnsureProfile? onCompleted,
    graphql.OnMutationUpdate<MutationEnsureProfile>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName ?? 'EnsureProfile',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationEnsureProfile(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationEnsureProfile,
         parserFn: _parserFnMutationEnsureProfile,
       );

  final OnMutationCompletedMutationEnsureProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationEnsureProfile extends graphql.WatchQueryOptions<MutationEnsureProfile> {
  WatchOptionsMutationEnsureProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationEnsureProfile? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'EnsureProfile',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationEnsureProfile,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationEnsureProfile,
       );
}

extension ClientExtensionMutationEnsureProfile on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationEnsureProfile>> mutateEnsureProfile([
    OptionsMutationEnsureProfile? options,
  ]) async => await this.mutate(options ?? OptionsMutationEnsureProfile());

  graphql.ObservableQuery<MutationEnsureProfile> watchMutationEnsureProfile([
    WatchOptionsMutationEnsureProfile? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationEnsureProfile());
}
