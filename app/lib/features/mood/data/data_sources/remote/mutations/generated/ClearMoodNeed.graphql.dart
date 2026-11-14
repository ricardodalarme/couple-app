// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationClearMoodNeed {
  factory VariablesMutationClearMoodNeed({
    required String id,
    required EnumMood mood,
    required EnumMoodShare share,
    required DateTime day,
  }) => VariablesMutationClearMoodNeed._({r'id': id, r'mood': mood, r'share': share, r'day': day});

  VariablesMutationClearMoodNeed._(this._$data);

  factory VariablesMutationClearMoodNeed.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$mood = data['mood'];
    result$data['mood'] = fromJsonEnumMood((l$mood as String));
    final l$share = data['share'];
    result$data['share'] = fromJsonEnumMoodShare((l$share as String));
    final l$day = data['day'];
    result$data['day'] = DateTime.parse((l$day as String));
    return VariablesMutationClearMoodNeed._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  EnumMood get mood => (_$data['mood'] as EnumMood);

  EnumMoodShare get share => (_$data['share'] as EnumMoodShare);

  DateTime get day => (_$data['day'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$mood = mood;
    result$data['mood'] = toJsonEnumMood(l$mood);
    final l$share = share;
    result$data['share'] = toJsonEnumMoodShare(l$share);
    final l$day = day;
    result$data['day'] = ((v) => v.toIso8601String().substring(0, 10))(l$day);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationClearMoodNeed || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (l$mood != lOther$mood) {
      return false;
    }
    final l$share = share;
    final lOther$share = other.share;
    if (l$share != lOther$share) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$mood = mood;
    final l$share = share;
    final l$day = day;
    return Object.hashAll([l$id, l$mood, l$share, l$day]);
  }
}

class MutationClearMoodNeed {
  MutationClearMoodNeed({required this.updateMoodsCollection, this.$__typename = 'Mutation'});

  factory MutationClearMoodNeed.fromJson(Map<String, dynamic> json) {
    final l$updateMoodsCollection = json['updateMoodsCollection'];
    final l$$__typename = json['__typename'];
    return MutationClearMoodNeed(
      updateMoodsCollection: MutationClearMoodNeedupdateMoodsCollection.fromJson(
        (l$updateMoodsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationClearMoodNeedupdateMoodsCollection updateMoodsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMoodsCollection = updateMoodsCollection;
    _resultData['updateMoodsCollection'] = l$updateMoodsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMoodsCollection = updateMoodsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateMoodsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationClearMoodNeed || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMoodsCollection = updateMoodsCollection;
    final lOther$updateMoodsCollection = other.updateMoodsCollection;
    if (l$updateMoodsCollection != lOther$updateMoodsCollection) {
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

const documentNodeMutationClearMoodNeed = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ClearMoodNeed'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'mood')),
          type: NamedTypeNode(name: NameNode(value: 'Mood'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'share')),
          type: NamedTypeNode(name: NameNode(value: 'MoodShare'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'day')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateMoodsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'mood'),
                      value: VariableNode(name: NameNode(value: 'mood')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'need'),
                      value: NullValueNode(),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'share'),
                      value: VariableNode(name: NameNode(value: 'share')),
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
                            value: VariableNode(name: NameNode(value: 'id')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'day'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'day')),
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
                  name: NameNode(value: 'records'),
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
                        name: NameNode(value: 'day'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'mood'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'need'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'share'),
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
MutationClearMoodNeed _parserFnMutationClearMoodNeed(Map<String, dynamic> data) =>
    MutationClearMoodNeed.fromJson(data);
typedef OnMutationCompletedMutationClearMoodNeed = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationClearMoodNeed?,
);

class OptionsMutationClearMoodNeed extends graphql.MutationOptions<MutationClearMoodNeed> {
  OptionsMutationClearMoodNeed({
    String? operationName,
    required VariablesMutationClearMoodNeed variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearMoodNeed? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationClearMoodNeed? onCompleted,
    graphql.OnMutationUpdate<MutationClearMoodNeed>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationClearMoodNeed(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationClearMoodNeed,
         parserFn: _parserFnMutationClearMoodNeed,
       );

  final OnMutationCompletedMutationClearMoodNeed? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationClearMoodNeed extends graphql.WatchQueryOptions<MutationClearMoodNeed> {
  WatchOptionsMutationClearMoodNeed({
    String? operationName,
    required VariablesMutationClearMoodNeed variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationClearMoodNeed? typedOptimisticResult,
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
         document: documentNodeMutationClearMoodNeed,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationClearMoodNeed,
       );
}

extension ClientExtensionMutationClearMoodNeed on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationClearMoodNeed>> mutateClearMoodNeed(
    OptionsMutationClearMoodNeed options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationClearMoodNeed> watchMutationClearMoodNeed(
    WatchOptionsMutationClearMoodNeed options,
  ) => this.watchMutation(options);
}

class MutationClearMoodNeedupdateMoodsCollection {
  MutationClearMoodNeedupdateMoodsCollection({
    required this.affectedCount,
    required this.records,
    this.$__typename = 'MoodsUpdateResponse',
  });

  factory MutationClearMoodNeedupdateMoodsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationClearMoodNeedupdateMoodsCollection(
      affectedCount: (l$affectedCount as int),
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationClearMoodNeedupdateMoodsCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int affectedCount;

  final List<MutationClearMoodNeedupdateMoodsCollectionrecords> records;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affectedCount = affectedCount;
    _resultData['affectedCount'] = l$affectedCount;
    final l$records = records;
    _resultData['records'] = l$records.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affectedCount = affectedCount;
    final l$records = records;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affectedCount,
      Object.hashAll(l$records.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationClearMoodNeedupdateMoodsCollection || runtimeType != other.runtimeType) {
      return false;
    }
    final l$affectedCount = affectedCount;
    final lOther$affectedCount = other.affectedCount;
    if (l$affectedCount != lOther$affectedCount) {
      return false;
    }
    final l$records = records;
    final lOther$records = other.records;
    if (l$records.length != lOther$records.length) {
      return false;
    }
    for (int i = 0; i < l$records.length; i++) {
      final l$records$entry = l$records[i];
      final lOther$records$entry = lOther$records[i];
      if (l$records$entry != lOther$records$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class MutationClearMoodNeedupdateMoodsCollectionrecords {
  MutationClearMoodNeedupdateMoodsCollectionrecords({
    required this.id,
    required this.day,
    required this.mood,
    this.need,
    required this.share,
    this.$__typename = 'Moods',
  });

  factory MutationClearMoodNeedupdateMoodsCollectionrecords.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$day = json['day'];
    final l$mood = json['mood'];
    final l$need = json['need'];
    final l$share = json['share'];
    final l$$__typename = json['__typename'];
    return MutationClearMoodNeedupdateMoodsCollectionrecords(
      id: (l$id as String),
      day: DateTime.parse((l$day as String)),
      mood: fromJsonEnumMood((l$mood as String)),
      need: l$need == null ? null : fromJsonEnumMoodNeed((l$need as String)),
      share: fromJsonEnumMoodShare((l$share as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime day;

  final EnumMood mood;

  final EnumMoodNeed? need;

  final EnumMoodShare share;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$day = day;
    _resultData['day'] = ((v) => v.toIso8601String().substring(0, 10))(l$day);
    final l$mood = mood;
    _resultData['mood'] = toJsonEnumMood(l$mood);
    final l$need = need;
    _resultData['need'] = l$need == null ? null : toJsonEnumMoodNeed(l$need);
    final l$share = share;
    _resultData['share'] = toJsonEnumMoodShare(l$share);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$day = day;
    final l$mood = mood;
    final l$need = need;
    final l$share = share;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$day, l$mood, l$need, l$share, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationClearMoodNeedupdateMoodsCollectionrecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (l$mood != lOther$mood) {
      return false;
    }
    final l$need = need;
    final lOther$need = other.need;
    if (l$need != lOther$need) {
      return false;
    }
    final l$share = share;
    final lOther$share = other.share;
    if (l$share != lOther$share) {
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
