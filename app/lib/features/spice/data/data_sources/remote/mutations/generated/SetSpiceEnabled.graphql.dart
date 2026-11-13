// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetSpiceEnabled {
  factory VariablesMutationSetSpiceEnabled({required String profileId, required bool enabled}) =>
      VariablesMutationSetSpiceEnabled._({r'profileId': profileId, r'enabled': enabled});

  VariablesMutationSetSpiceEnabled._(this._$data);

  factory VariablesMutationSetSpiceEnabled.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    final l$enabled = data['enabled'];
    result$data['enabled'] = (l$enabled as bool);
    return VariablesMutationSetSpiceEnabled._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  bool get enabled => (_$data['enabled'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    final l$enabled = enabled;
    result$data['enabled'] = l$enabled;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetSpiceEnabled || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$enabled = enabled;
    return Object.hashAll([l$profileId, l$enabled]);
  }
}

class MutationSetSpiceEnabled {
  MutationSetSpiceEnabled({
    required this.updateProfileSettingsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetSpiceEnabled.fromJson(Map<String, dynamic> json) {
    final l$updateProfileSettingsCollection = json['updateProfileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetSpiceEnabled(
      updateProfileSettingsCollection:
          MutationSetSpiceEnabledupdateProfileSettingsCollection.fromJson(
            (l$updateProfileSettingsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetSpiceEnabledupdateProfileSettingsCollection updateProfileSettingsCollection;

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
    if (other is! MutationSetSpiceEnabled || runtimeType != other.runtimeType) {
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

const documentNodeMutationSetSpiceEnabled = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetSpiceEnabled'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'enabled')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
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
                      name: NameNode(value: 'spiceEnabled'),
                      value: VariableNode(name: NameNode(value: 'enabled')),
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
MutationSetSpiceEnabled _parserFnMutationSetSpiceEnabled(Map<String, dynamic> data) =>
    MutationSetSpiceEnabled.fromJson(data);
typedef OnMutationCompletedMutationSetSpiceEnabled = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetSpiceEnabled?,
);

class OptionsMutationSetSpiceEnabled extends graphql.MutationOptions<MutationSetSpiceEnabled> {
  OptionsMutationSetSpiceEnabled({
    String? operationName,
    required VariablesMutationSetSpiceEnabled variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSpiceEnabled? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetSpiceEnabled? onCompleted,
    graphql.OnMutationUpdate<MutationSetSpiceEnabled>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationSetSpiceEnabled(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSetSpiceEnabled,
         parserFn: _parserFnMutationSetSpiceEnabled,
       );

  final OnMutationCompletedMutationSetSpiceEnabled? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetSpiceEnabled
    extends graphql.WatchQueryOptions<MutationSetSpiceEnabled> {
  WatchOptionsMutationSetSpiceEnabled({
    String? operationName,
    required VariablesMutationSetSpiceEnabled variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSpiceEnabled? typedOptimisticResult,
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
         document: documentNodeMutationSetSpiceEnabled,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetSpiceEnabled,
       );
}

extension ClientExtensionMutationSetSpiceEnabled on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetSpiceEnabled>> mutateSetSpiceEnabled(
    OptionsMutationSetSpiceEnabled options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetSpiceEnabled> watchMutationSetSpiceEnabled(
    WatchOptionsMutationSetSpiceEnabled options,
  ) => this.watchMutation(options);
}

class MutationSetSpiceEnabledupdateProfileSettingsCollection {
  MutationSetSpiceEnabledupdateProfileSettingsCollection({
    required this.affectedCount,
    this.$__typename = 'ProfileSettingsUpdateResponse',
  });

  factory MutationSetSpiceEnabledupdateProfileSettingsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSetSpiceEnabledupdateProfileSettingsCollection(
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
    if (other is! MutationSetSpiceEnabledupdateProfileSettingsCollection ||
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
