// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateWidgetPreferences {
  factory VariablesMutationUpdateWidgetPreferences({
    required String profileId,
    required bool widgetShowNames,
    required bool widgetInDiscreet,
    required bool widgetAllowPartnerNotes,
    required bool widgetOnLockScreen,
  }) => VariablesMutationUpdateWidgetPreferences._({
    r'profileId': profileId,
    r'widgetShowNames': widgetShowNames,
    r'widgetInDiscreet': widgetInDiscreet,
    r'widgetAllowPartnerNotes': widgetAllowPartnerNotes,
    r'widgetOnLockScreen': widgetOnLockScreen,
  });

  VariablesMutationUpdateWidgetPreferences._(this._$data);

  factory VariablesMutationUpdateWidgetPreferences.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    final l$widgetShowNames = data['widgetShowNames'];
    result$data['widgetShowNames'] = (l$widgetShowNames as bool);
    final l$widgetInDiscreet = data['widgetInDiscreet'];
    result$data['widgetInDiscreet'] = (l$widgetInDiscreet as bool);
    final l$widgetAllowPartnerNotes = data['widgetAllowPartnerNotes'];
    result$data['widgetAllowPartnerNotes'] = (l$widgetAllowPartnerNotes as bool);
    final l$widgetOnLockScreen = data['widgetOnLockScreen'];
    result$data['widgetOnLockScreen'] = (l$widgetOnLockScreen as bool);
    return VariablesMutationUpdateWidgetPreferences._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  bool get widgetShowNames => (_$data['widgetShowNames'] as bool);

  bool get widgetInDiscreet => (_$data['widgetInDiscreet'] as bool);

  bool get widgetAllowPartnerNotes => (_$data['widgetAllowPartnerNotes'] as bool);

  bool get widgetOnLockScreen => (_$data['widgetOnLockScreen'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    final l$widgetShowNames = widgetShowNames;
    result$data['widgetShowNames'] = l$widgetShowNames;
    final l$widgetInDiscreet = widgetInDiscreet;
    result$data['widgetInDiscreet'] = l$widgetInDiscreet;
    final l$widgetAllowPartnerNotes = widgetAllowPartnerNotes;
    result$data['widgetAllowPartnerNotes'] = l$widgetAllowPartnerNotes;
    final l$widgetOnLockScreen = widgetOnLockScreen;
    result$data['widgetOnLockScreen'] = l$widgetOnLockScreen;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateWidgetPreferences || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$widgetShowNames = widgetShowNames;
    final lOther$widgetShowNames = other.widgetShowNames;
    if (l$widgetShowNames != lOther$widgetShowNames) {
      return false;
    }
    final l$widgetInDiscreet = widgetInDiscreet;
    final lOther$widgetInDiscreet = other.widgetInDiscreet;
    if (l$widgetInDiscreet != lOther$widgetInDiscreet) {
      return false;
    }
    final l$widgetAllowPartnerNotes = widgetAllowPartnerNotes;
    final lOther$widgetAllowPartnerNotes = other.widgetAllowPartnerNotes;
    if (l$widgetAllowPartnerNotes != lOther$widgetAllowPartnerNotes) {
      return false;
    }
    final l$widgetOnLockScreen = widgetOnLockScreen;
    final lOther$widgetOnLockScreen = other.widgetOnLockScreen;
    if (l$widgetOnLockScreen != lOther$widgetOnLockScreen) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$widgetShowNames = widgetShowNames;
    final l$widgetInDiscreet = widgetInDiscreet;
    final l$widgetAllowPartnerNotes = widgetAllowPartnerNotes;
    final l$widgetOnLockScreen = widgetOnLockScreen;
    return Object.hashAll([
      l$profileId,
      l$widgetShowNames,
      l$widgetInDiscreet,
      l$widgetAllowPartnerNotes,
      l$widgetOnLockScreen,
    ]);
  }
}

class MutationUpdateWidgetPreferences {
  MutationUpdateWidgetPreferences({
    required this.updateProfileSettingsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateWidgetPreferences.fromJson(Map<String, dynamic> json) {
    final l$updateProfileSettingsCollection = json['updateProfileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateWidgetPreferences(
      updateProfileSettingsCollection:
          MutationUpdateWidgetPreferencesupdateProfileSettingsCollection.fromJson(
            (l$updateProfileSettingsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateWidgetPreferencesupdateProfileSettingsCollection
  updateProfileSettingsCollection;

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
    if (other is! MutationUpdateWidgetPreferences || runtimeType != other.runtimeType) {
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

const documentNodeMutationUpdateWidgetPreferences = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateWidgetPreferences'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'widgetShowNames')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'widgetInDiscreet')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'widgetAllowPartnerNotes')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'widgetOnLockScreen')),
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
                      name: NameNode(value: 'widgetShowNames'),
                      value: VariableNode(name: NameNode(value: 'widgetShowNames')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'widgetInDiscreet'),
                      value: VariableNode(name: NameNode(value: 'widgetInDiscreet')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'widgetAllowPartnerNotes'),
                      value: VariableNode(name: NameNode(value: 'widgetAllowPartnerNotes')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'widgetOnLockScreen'),
                      value: VariableNode(name: NameNode(value: 'widgetOnLockScreen')),
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
MutationUpdateWidgetPreferences _parserFnMutationUpdateWidgetPreferences(
  Map<String, dynamic> data,
) => MutationUpdateWidgetPreferences.fromJson(data);
typedef OnMutationCompletedMutationUpdateWidgetPreferences = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateWidgetPreferences?,
);

class OptionsMutationUpdateWidgetPreferences
    extends graphql.MutationOptions<MutationUpdateWidgetPreferences> {
  OptionsMutationUpdateWidgetPreferences({
    String? operationName,
    required VariablesMutationUpdateWidgetPreferences variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateWidgetPreferences? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateWidgetPreferences? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateWidgetPreferences>? update,
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
                 data == null ? null : _parserFnMutationUpdateWidgetPreferences(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateWidgetPreferences,
         parserFn: _parserFnMutationUpdateWidgetPreferences,
       );

  final OnMutationCompletedMutationUpdateWidgetPreferences? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateWidgetPreferences
    extends graphql.WatchQueryOptions<MutationUpdateWidgetPreferences> {
  WatchOptionsMutationUpdateWidgetPreferences({
    String? operationName,
    required VariablesMutationUpdateWidgetPreferences variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateWidgetPreferences? typedOptimisticResult,
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
         document: documentNodeMutationUpdateWidgetPreferences,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateWidgetPreferences,
       );
}

extension ClientExtensionMutationUpdateWidgetPreferences on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateWidgetPreferences>> mutateUpdateWidgetPreferences(
    OptionsMutationUpdateWidgetPreferences options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateWidgetPreferences> watchMutationUpdateWidgetPreferences(
    WatchOptionsMutationUpdateWidgetPreferences options,
  ) => this.watchMutation(options);
}

class MutationUpdateWidgetPreferencesupdateProfileSettingsCollection {
  MutationUpdateWidgetPreferencesupdateProfileSettingsCollection({
    required this.affectedCount,
    this.$__typename = 'ProfileSettingsUpdateResponse',
  });

  factory MutationUpdateWidgetPreferencesupdateProfileSettingsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateWidgetPreferencesupdateProfileSettingsCollection(
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
    if (other is! MutationUpdateWidgetPreferencesupdateProfileSettingsCollection ||
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
