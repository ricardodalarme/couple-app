// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateAvatarKind {
  factory VariablesMutationUpdateAvatarKind({
    required String profileId,
    required String avatarKind,
  }) => VariablesMutationUpdateAvatarKind._({r'profileId': profileId, r'avatarKind': avatarKind});

  VariablesMutationUpdateAvatarKind._(this._$data);

  factory VariablesMutationUpdateAvatarKind.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    final l$avatarKind = data['avatarKind'];
    result$data['avatarKind'] = (l$avatarKind as String);
    return VariablesMutationUpdateAvatarKind._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  String get avatarKind => (_$data['avatarKind'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    final l$avatarKind = avatarKind;
    result$data['avatarKind'] = l$avatarKind;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateAvatarKind || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$avatarKind = avatarKind;
    final lOther$avatarKind = other.avatarKind;
    if (l$avatarKind != lOther$avatarKind) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$avatarKind = avatarKind;
    return Object.hashAll([l$profileId, l$avatarKind]);
  }
}

class MutationUpdateAvatarKind {
  MutationUpdateAvatarKind({required this.updateProfilesCollection, this.$__typename = 'Mutation'});

  factory MutationUpdateAvatarKind.fromJson(Map<String, dynamic> json) {
    final l$updateProfilesCollection = json['updateProfilesCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateAvatarKind(
      updateProfilesCollection: MutationUpdateAvatarKindupdateProfilesCollection.fromJson(
        (l$updateProfilesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateAvatarKindupdateProfilesCollection updateProfilesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateProfilesCollection = updateProfilesCollection;
    _resultData['updateProfilesCollection'] = l$updateProfilesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateProfilesCollection = updateProfilesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateProfilesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateAvatarKind || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateProfilesCollection = updateProfilesCollection;
    final lOther$updateProfilesCollection = other.updateProfilesCollection;
    if (l$updateProfilesCollection != lOther$updateProfilesCollection) {
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

const documentNodeMutationUpdateAvatarKind = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateAvatarKind'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'avatarKind')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateProfilesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'avatarKind'),
                      value: VariableNode(name: NameNode(value: 'avatarKind')),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'id'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'profileId')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'atMost'),
                value: IntValueNode(value: '1'),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'affectedCount'),
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
MutationUpdateAvatarKind _parserFnMutationUpdateAvatarKind(Map<String, dynamic> data) =>
    MutationUpdateAvatarKind.fromJson(data);
typedef OnMutationCompletedMutationUpdateAvatarKind = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateAvatarKind?,
);

class OptionsMutationUpdateAvatarKind extends graphql.MutationOptions<MutationUpdateAvatarKind> {
  OptionsMutationUpdateAvatarKind({
    String? operationName,
    required VariablesMutationUpdateAvatarKind variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateAvatarKind? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateAvatarKind? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateAvatarKind>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationUpdateAvatarKind(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateAvatarKind,
         parserFn: _parserFnMutationUpdateAvatarKind,
       );

  final OnMutationCompletedMutationUpdateAvatarKind? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateAvatarKind
    extends graphql.WatchQueryOptions<MutationUpdateAvatarKind> {
  WatchOptionsMutationUpdateAvatarKind({
    String? operationName,
    required VariablesMutationUpdateAvatarKind variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateAvatarKind? typedOptimisticResult,
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
         document: documentNodeMutationUpdateAvatarKind,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateAvatarKind,
       );
}

extension ClientExtensionMutationUpdateAvatarKind on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateAvatarKind>> mutateUpdateAvatarKind(
    OptionsMutationUpdateAvatarKind options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateAvatarKind> watchMutationUpdateAvatarKind(
    WatchOptionsMutationUpdateAvatarKind options,
  ) => this.watchMutation(options);
}

class MutationUpdateAvatarKindupdateProfilesCollection {
  MutationUpdateAvatarKindupdateProfilesCollection({
    required this.affectedCount,
    this.$__typename = 'ProfilesUpdateResponse',
  });

  factory MutationUpdateAvatarKindupdateProfilesCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateAvatarKindupdateProfilesCollection(
      affectedCount: (l$affectedCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int affectedCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affectedCount = affectedCount;
    _resultData['affectedCount'] = l$affectedCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affectedCount = affectedCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$affectedCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateAvatarKindupdateProfilesCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affectedCount = affectedCount;
    final lOther$affectedCount = other.affectedCount;
    if (l$affectedCount != lOther$affectedCount) {
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
