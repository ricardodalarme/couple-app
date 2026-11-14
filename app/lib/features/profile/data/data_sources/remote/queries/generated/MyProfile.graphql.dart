// dart format width=100
import '../../fragments/generated/ProfileFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyProfile {
  QueryMyProfile({this.myProfile, this.$__typename = 'Query'});

  factory QueryMyProfile.fromJson(Map<String, dynamic> json) {
    final l$myProfile = json['myProfile'];
    final l$$__typename = json['__typename'];
    return QueryMyProfile(
      myProfile: l$myProfile == null
          ? null
          : FragmentProfileFragment.fromJson((l$myProfile as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentProfileFragment? myProfile;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myProfile = myProfile;
    _resultData['myProfile'] = l$myProfile?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myProfile = myProfile;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myProfile, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyProfile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myProfile = myProfile;
    final lOther$myProfile = other.myProfile;
    if (l$myProfile != lOther$myProfile) {
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

const documentNodeQueryMyProfile = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyProfile'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myProfile'),
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
QueryMyProfile _parserFnQueryMyProfile(Map<String, dynamic> data) => QueryMyProfile.fromJson(data);
typedef OnQueryCompleteQueryMyProfile = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyProfile?,
);

class OptionsQueryMyProfile extends graphql.QueryOptions<QueryMyProfile> {
  OptionsQueryMyProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyProfile? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyProfile? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'MyProfile',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyProfile(data)),
         onError: onError,
         document: documentNodeQueryMyProfile,
         parserFn: _parserFnQueryMyProfile,
       );

  final OnQueryCompleteQueryMyProfile? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyProfile extends graphql.WatchQueryOptions<QueryMyProfile> {
  WatchOptionsQueryMyProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyProfile? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'MyProfile',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMyProfile,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyProfile,
       );
}

class FetchMoreOptionsQueryMyProfile extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyProfile({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyProfile);
}

extension ClientExtensionQueryMyProfile on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyProfile>> queryMyProfile([
    OptionsQueryMyProfile? options,
  ]) async => await this.query(options ?? OptionsQueryMyProfile());

  graphql.ObservableQuery<QueryMyProfile> watchQueryMyProfile([
    WatchOptionsQueryMyProfile? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMyProfile());

  void writeQueryMyProfile({required QueryMyProfile data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyProfile)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMyProfile? readQueryMyProfile({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyProfile)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyProfile.fromJson(result);
  }
}
