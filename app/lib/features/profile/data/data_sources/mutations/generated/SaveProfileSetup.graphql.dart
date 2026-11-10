// dart format width=100
import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSaveProfileSetup {
  factory VariablesMutationSaveProfileSetup({
    required String profileId,
    required String displayName,
    required EnumAppTheme theme,
    String? partnerName,
    DateTime? togetherSince,
    required DateTime onboardedAt,
  }) => VariablesMutationSaveProfileSetup._({
    r'profileId': profileId,
    r'displayName': displayName,
    r'theme': theme,
    if (partnerName != null) r'partnerName': partnerName,
    if (togetherSince != null) r'togetherSince': togetherSince,
    r'onboardedAt': onboardedAt,
  });

  VariablesMutationSaveProfileSetup._(this._$data);

  factory VariablesMutationSaveProfileSetup.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    final l$displayName = data['displayName'];
    result$data['displayName'] = (l$displayName as String);
    final l$theme = data['theme'];
    result$data['theme'] = fromJsonEnumAppTheme((l$theme as String));
    if (data.containsKey('partnerName')) {
      final l$partnerName = data['partnerName'];
      result$data['partnerName'] = (l$partnerName as String?);
    }
    if (data.containsKey('togetherSince')) {
      final l$togetherSince = data['togetherSince'];
      result$data['togetherSince'] = l$togetherSince == null
          ? null
          : DateTime.parse((l$togetherSince as String));
    }
    final l$onboardedAt = data['onboardedAt'];
    result$data['onboardedAt'] = DateTime.parse((l$onboardedAt as String));
    return VariablesMutationSaveProfileSetup._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  String get displayName => (_$data['displayName'] as String);

  EnumAppTheme get theme => (_$data['theme'] as EnumAppTheme);

  String? get partnerName => (_$data['partnerName'] as String?);

  DateTime? get togetherSince => (_$data['togetherSince'] as DateTime?);

  DateTime get onboardedAt => (_$data['onboardedAt'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    final l$displayName = displayName;
    result$data['displayName'] = l$displayName;
    final l$theme = theme;
    result$data['theme'] = toJsonEnumAppTheme(l$theme);
    if (_$data.containsKey('partnerName')) {
      final l$partnerName = partnerName;
      result$data['partnerName'] = l$partnerName;
    }
    if (_$data.containsKey('togetherSince')) {
      final l$togetherSince = togetherSince;
      result$data['togetherSince'] = l$togetherSince == null
          ? null
          : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    }
    final l$onboardedAt = onboardedAt;
    result$data['onboardedAt'] = l$onboardedAt.toIso8601String();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSaveProfileSetup || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (l$theme != lOther$theme) {
      return false;
    }
    final l$partnerName = partnerName;
    final lOther$partnerName = other.partnerName;
    if (_$data.containsKey('partnerName') != other._$data.containsKey('partnerName')) {
      return false;
    }
    if (l$partnerName != lOther$partnerName) {
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
    final l$onboardedAt = onboardedAt;
    final lOther$onboardedAt = other.onboardedAt;
    if (l$onboardedAt != lOther$onboardedAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$displayName = displayName;
    final l$theme = theme;
    final l$partnerName = partnerName;
    final l$togetherSince = togetherSince;
    final l$onboardedAt = onboardedAt;
    return Object.hashAll([
      l$profileId,
      l$displayName,
      l$theme,
      _$data.containsKey('partnerName') ? l$partnerName : const {},
      _$data.containsKey('togetherSince') ? l$togetherSince : const {},
      l$onboardedAt,
    ]);
  }
}

class MutationSaveProfileSetup {
  MutationSaveProfileSetup({
    required this.updateProfilesCollection,
    required this.updateProfileSettingsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSaveProfileSetup.fromJson(Map<String, dynamic> json) {
    final l$updateProfilesCollection = json['updateProfilesCollection'];
    final l$updateProfileSettingsCollection = json['updateProfileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSaveProfileSetup(
      updateProfilesCollection: MutationSaveProfileSetupupdateProfilesCollection.fromJson(
        (l$updateProfilesCollection as Map<String, dynamic>),
      ),
      updateProfileSettingsCollection:
          MutationSaveProfileSetupupdateProfileSettingsCollection.fromJson(
            (l$updateProfileSettingsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSaveProfileSetupupdateProfilesCollection updateProfilesCollection;

  final MutationSaveProfileSetupupdateProfileSettingsCollection updateProfileSettingsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateProfilesCollection = updateProfilesCollection;
    _resultData['updateProfilesCollection'] = l$updateProfilesCollection.toJson();
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    _resultData['updateProfileSettingsCollection'] = l$updateProfileSettingsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateProfilesCollection = updateProfilesCollection;
    final l$updateProfileSettingsCollection = updateProfileSettingsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateProfilesCollection,
      l$updateProfileSettingsCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSaveProfileSetup || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateProfilesCollection = updateProfilesCollection;
    final lOther$updateProfilesCollection = other.updateProfilesCollection;
    if (l$updateProfilesCollection != lOther$updateProfilesCollection) {
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

const documentNodeMutationSaveProfileSetup = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SaveProfileSetup'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'displayName')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'theme')),
          type: NamedTypeNode(name: NameNode(value: 'AppTheme'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'partnerName')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'togetherSince')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'onboardedAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: true),
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
                      name: NameNode(value: 'displayName'),
                      value: VariableNode(name: NameNode(value: 'displayName')),
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
            name: NameNode(value: 'updateProfileSettingsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'theme'),
                      value: VariableNode(name: NameNode(value: 'theme')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'partnerName'),
                      value: VariableNode(name: NameNode(value: 'partnerName')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'togetherSince'),
                      value: VariableNode(name: NameNode(value: 'togetherSince')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'onboardedAt'),
                      value: VariableNode(name: NameNode(value: 'onboardedAt')),
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
MutationSaveProfileSetup _parserFnMutationSaveProfileSetup(Map<String, dynamic> data) =>
    MutationSaveProfileSetup.fromJson(data);
typedef OnMutationCompletedMutationSaveProfileSetup = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSaveProfileSetup?,
);

class OptionsMutationSaveProfileSetup extends graphql.MutationOptions<MutationSaveProfileSetup> {
  OptionsMutationSaveProfileSetup({
    String? operationName,
    required VariablesMutationSaveProfileSetup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveProfileSetup? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSaveProfileSetup? onCompleted,
    graphql.OnMutationUpdate<MutationSaveProfileSetup>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationSaveProfileSetup(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSaveProfileSetup,
         parserFn: _parserFnMutationSaveProfileSetup,
       );

  final OnMutationCompletedMutationSaveProfileSetup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSaveProfileSetup
    extends graphql.WatchQueryOptions<MutationSaveProfileSetup> {
  WatchOptionsMutationSaveProfileSetup({
    String? operationName,
    required VariablesMutationSaveProfileSetup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveProfileSetup? typedOptimisticResult,
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
         document: documentNodeMutationSaveProfileSetup,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSaveProfileSetup,
       );
}

extension ClientExtensionMutationSaveProfileSetup on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSaveProfileSetup>> mutateSaveProfileSetup(
    OptionsMutationSaveProfileSetup options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSaveProfileSetup> watchMutationSaveProfileSetup(
    WatchOptionsMutationSaveProfileSetup options,
  ) => this.watchMutation(options);
}

class MutationSaveProfileSetupupdateProfilesCollection {
  MutationSaveProfileSetupupdateProfilesCollection({
    required this.affectedCount,
    this.$__typename = 'ProfilesUpdateResponse',
  });

  factory MutationSaveProfileSetupupdateProfilesCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSaveProfileSetupupdateProfilesCollection(
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
    if (other is! MutationSaveProfileSetupupdateProfilesCollection ||
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

class MutationSaveProfileSetupupdateProfileSettingsCollection {
  MutationSaveProfileSetupupdateProfileSettingsCollection({
    required this.affectedCount,
    this.$__typename = 'ProfileSettingsUpdateResponse',
  });

  factory MutationSaveProfileSetupupdateProfileSettingsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationSaveProfileSetupupdateProfileSettingsCollection(
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
    if (other is! MutationSaveProfileSetupupdateProfileSettingsCollection ||
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
