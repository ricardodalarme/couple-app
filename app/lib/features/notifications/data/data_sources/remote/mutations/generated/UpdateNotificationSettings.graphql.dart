// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateNotificationSettings {
  factory VariablesMutationUpdateNotificationSettings({
    required InputNotificationSettingsUpdateInput $set,
  }) => VariablesMutationUpdateNotificationSettings._({r'set': $set});

  VariablesMutationUpdateNotificationSettings._(this._$data);

  factory VariablesMutationUpdateNotificationSettings.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$$set = data['set'];
    result$data['set'] = InputNotificationSettingsUpdateInput.fromJson(
      (l$$set as Map<String, dynamic>),
    );
    return VariablesMutationUpdateNotificationSettings._(result$data);
  }

  Map<String, dynamic> _$data;

  InputNotificationSettingsUpdateInput get $set =>
      (_$data['set'] as InputNotificationSettingsUpdateInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$$set = $set;
    result$data['set'] = l$$set.toJson();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateNotificationSettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$set = $set;
    final lOther$$set = other.$set;
    if (l$$set != lOther$$set) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$set = $set;
    return Object.hashAll([l$$set]);
  }
}

class MutationUpdateNotificationSettings {
  MutationUpdateNotificationSettings({
    required this.updateNotificationSettingsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateNotificationSettings.fromJson(Map<String, dynamic> json) {
    final l$updateNotificationSettingsCollection = json['updateNotificationSettingsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateNotificationSettings(
      updateNotificationSettingsCollection:
          MutationUpdateNotificationSettingsupdateNotificationSettingsCollection.fromJson(
            (l$updateNotificationSettingsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateNotificationSettingsupdateNotificationSettingsCollection
  updateNotificationSettingsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateNotificationSettingsCollection = updateNotificationSettingsCollection;
    _resultData['updateNotificationSettingsCollection'] = l$updateNotificationSettingsCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateNotificationSettingsCollection = updateNotificationSettingsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateNotificationSettingsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateNotificationSettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateNotificationSettingsCollection = updateNotificationSettingsCollection;
    final lOther$updateNotificationSettingsCollection = other.updateNotificationSettingsCollection;
    if (l$updateNotificationSettingsCollection != lOther$updateNotificationSettingsCollection) {
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

const documentNodeMutationUpdateNotificationSettings = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateNotificationSettings'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'set')),
          type: NamedTypeNode(
            name: NameNode(value: 'NotificationSettingsUpdateInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateNotificationSettingsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: VariableNode(name: NameNode(value: 'set')),
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
MutationUpdateNotificationSettings _parserFnMutationUpdateNotificationSettings(
  Map<String, dynamic> data,
) => MutationUpdateNotificationSettings.fromJson(data);
typedef OnMutationCompletedMutationUpdateNotificationSettings = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateNotificationSettings?,
);

class OptionsMutationUpdateNotificationSettings
    extends graphql.MutationOptions<MutationUpdateNotificationSettings> {
  OptionsMutationUpdateNotificationSettings({
    String? operationName,
    required VariablesMutationUpdateNotificationSettings variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateNotificationSettings? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateNotificationSettings? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateNotificationSettings>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'UpdateNotificationSettings',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationUpdateNotificationSettings(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateNotificationSettings,
         parserFn: _parserFnMutationUpdateNotificationSettings,
       );

  final OnMutationCompletedMutationUpdateNotificationSettings? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateNotificationSettings
    extends graphql.WatchQueryOptions<MutationUpdateNotificationSettings> {
  WatchOptionsMutationUpdateNotificationSettings({
    String? operationName,
    required VariablesMutationUpdateNotificationSettings variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateNotificationSettings? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'UpdateNotificationSettings',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUpdateNotificationSettings,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateNotificationSettings,
       );
}

extension ClientExtensionMutationUpdateNotificationSettings on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateNotificationSettings>> mutateUpdateNotificationSettings(
    OptionsMutationUpdateNotificationSettings options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateNotificationSettings>
  watchMutationUpdateNotificationSettings(WatchOptionsMutationUpdateNotificationSettings options) =>
      this.watchMutation(options);
}

class MutationUpdateNotificationSettingsupdateNotificationSettingsCollection {
  MutationUpdateNotificationSettingsupdateNotificationSettingsCollection({
    required this.affectedCount,
    this.$__typename = 'NotificationSettingsUpdateResponse',
  });

  factory MutationUpdateNotificationSettingsupdateNotificationSettingsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateNotificationSettingsupdateNotificationSettingsCollection(
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
    if (other is! MutationUpdateNotificationSettingsupdateNotificationSettingsCollection ||
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
