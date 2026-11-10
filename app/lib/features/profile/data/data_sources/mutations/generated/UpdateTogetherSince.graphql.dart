// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateTogetherSince {
  factory VariablesMutationUpdateTogetherSince({
    required String profileId,
    DateTime? togetherSince,
  }) => VariablesMutationUpdateTogetherSince._({
    r'profileId': profileId,
    if (togetherSince != null) r'togetherSince': togetherSince,
  });

  VariablesMutationUpdateTogetherSince._(this._$data);

  factory VariablesMutationUpdateTogetherSince.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    if (data.containsKey('togetherSince')) {
      final l$togetherSince = data['togetherSince'];
      result$data['togetherSince'] = l$togetherSince == null
          ? null
          : DateTime.parse((l$togetherSince as String));
    }
    return VariablesMutationUpdateTogetherSince._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  DateTime? get togetherSince => (_$data['togetherSince'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    if (_$data.containsKey('togetherSince')) {
      final l$togetherSince = togetherSince;
      result$data['togetherSince'] = l$togetherSince == null
          ? null
          : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateTogetherSince || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$togetherSince = togetherSince;
    final lOther$togetherSince = other.togetherSince;
    if (_$data.containsKey('togetherSince') != other._$data.containsKey('togetherSince')) {
      return false;
    }
    if (l$togetherSince != lOther$togetherSince) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$togetherSince = togetherSince;
    return Object.hashAll([
      l$profileId,
      _$data.containsKey('togetherSince') ? l$togetherSince : const {},
    ]);
  }
}

class MutationUpdateTogetherSince {
  MutationUpdateTogetherSince({
    required this.updateProfileSettingsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateTogetherSince.fromJson(Map<String, dynamic> json) {
    final l$updateProfileSettingsCollection = json['updateProfileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateTogetherSince(
      updateProfileSettingsCollection:
          MutationUpdateTogetherSinceupdateProfileSettingsCollection.fromJson(
            (l$updateProfileSettingsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateTogetherSinceupdateProfileSettingsCollection updateProfileSettingsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    _resultData['updateProfileSettingsCollection'] = l$updateProfileSettingsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateProfileSettingsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateTogetherSince || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    final lOther$updateProfileSettingsCollection = other.updateProfileSettingsCollection;
    if (l$updateProfileSettingsCollection != lOther$updateProfileSettingsCollection) {
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

const documentNodeMutationUpdateTogetherSince = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateTogetherSince'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'togetherSince')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateProfileSettingsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'togetherSince'),
                      value: VariableNode(name: NameNode(value: 'togetherSince')),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'profileId'),
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
MutationUpdateTogetherSince _parserFnMutationUpdateTogetherSince(Map<String, dynamic> data) =>
    MutationUpdateTogetherSince.fromJson(data);
typedef OnMutationCompletedMutationUpdateTogetherSince = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateTogetherSince?,
);

class OptionsMutationUpdateTogetherSince
    extends graphql.MutationOptions<MutationUpdateTogetherSince> {
  OptionsMutationUpdateTogetherSince({
    String? operationName,
    required VariablesMutationUpdateTogetherSince variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateTogetherSince? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateTogetherSince? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateTogetherSince>? update,
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
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationUpdateTogetherSince(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateTogetherSince,
         parserFn: _parserFnMutationUpdateTogetherSince,
       );

  final OnMutationCompletedMutationUpdateTogetherSince? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateTogetherSince
    extends graphql.WatchQueryOptions<MutationUpdateTogetherSince> {
  WatchOptionsMutationUpdateTogetherSince({
    String? operationName,
    required VariablesMutationUpdateTogetherSince variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateTogetherSince? typedOptimisticResult,
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
         document: documentNodeMutationUpdateTogetherSince,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateTogetherSince,
       );
}

extension ClientExtensionMutationUpdateTogetherSince on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateTogetherSince>> mutateUpdateTogetherSince(
    OptionsMutationUpdateTogetherSince options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateTogetherSince> watchMutationUpdateTogetherSince(
    WatchOptionsMutationUpdateTogetherSince options,
  ) => this.watchMutation(options);
}

class MutationUpdateTogetherSinceupdateProfileSettingsCollection {
  MutationUpdateTogetherSinceupdateProfileSettingsCollection({
    required this.affectedCount,
    this.$__typename = 'ProfileSettingsUpdateResponse',
  });

  factory MutationUpdateTogetherSinceupdateProfileSettingsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateTogetherSinceupdateProfileSettingsCollection(
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
    if (other is! MutationUpdateTogetherSinceupdateProfileSettingsCollection ||
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
