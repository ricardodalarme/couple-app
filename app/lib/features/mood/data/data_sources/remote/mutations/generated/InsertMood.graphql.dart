// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertMood {
  factory VariablesMutationInsertMood({
    required EnumMood mood,
    EnumMoodNeed? need,
    required EnumMoodShare share,
    required DateTime day,
  }) => VariablesMutationInsertMood._({
    r'mood': mood,
    if (need != null) r'need': need,
    r'share': share,
    r'day': day,
  });

  VariablesMutationInsertMood._(this._$data);

  factory VariablesMutationInsertMood.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mood = data['mood'];
    result$data['mood'] = fromJsonEnumMood((l$mood as String));
    if (data.containsKey('need')) {
      final l$need = data['need'];
      result$data['need'] = l$need == null ? null : fromJsonEnumMoodNeed((l$need as String));
    }
    final l$share = data['share'];
    result$data['share'] = fromJsonEnumMoodShare((l$share as String));
    final l$day = data['day'];
    result$data['day'] = DateTime.parse((l$day as String));
    return VariablesMutationInsertMood._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumMood get mood => (_$data['mood'] as EnumMood);

  EnumMoodNeed? get need => (_$data['need'] as EnumMoodNeed?);

  EnumMoodShare get share => (_$data['share'] as EnumMoodShare);

  DateTime get day => (_$data['day'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mood = mood;
    result$data['mood'] = toJsonEnumMood(l$mood);
    if (_$data.containsKey('need')) {
      final l$need = need;
      result$data['need'] = l$need == null ? null : toJsonEnumMoodNeed(l$need);
    }
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
    if (other is! VariablesMutationInsertMood || runtimeType != other.runtimeType) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (l$mood != lOther$mood) {
      return false;
    }
    final l$need = need;
    final lOther$need = other.need;
    if (_$data.containsKey('need') != other._$data.containsKey('need')) {
      return false;
    }
    if (l$need != lOther$need) {
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
    final l$mood = mood;
    final l$need = need;
    final l$share = share;
    final l$day = day;
    return Object.hashAll([l$mood, _$data.containsKey('need') ? l$need : const {}, l$share, l$day]);
  }
}

class MutationInsertMood {
  MutationInsertMood({this.insertIntoMoodsCollection, this.$__typename = 'Mutation'});

  factory MutationInsertMood.fromJson(Map<String, dynamic> json) {
    final l$insertIntoMoodsCollection = json['insertIntoMoodsCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertMood(
      insertIntoMoodsCollection: l$insertIntoMoodsCollection == null
          ? null
          : MutationInsertMoodinsertIntoMoodsCollection.fromJson(
              (l$insertIntoMoodsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertMoodinsertIntoMoodsCollection? insertIntoMoodsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoMoodsCollection = insertIntoMoodsCollection;
    _resultData['insertIntoMoodsCollection'] = l$insertIntoMoodsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoMoodsCollection = insertIntoMoodsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoMoodsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertMood || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoMoodsCollection = insertIntoMoodsCollection;
    final lOther$insertIntoMoodsCollection = other.insertIntoMoodsCollection;
    if (l$insertIntoMoodsCollection != lOther$insertIntoMoodsCollection) {
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

const documentNodeMutationInsertMood = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertMood'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'mood')),
          type: NamedTypeNode(name: NameNode(value: 'Mood'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'need')),
          type: NamedTypeNode(name: NameNode(value: 'MoodNeed'), isNonNull: false),
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
            name: NameNode(value: 'insertIntoMoodsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'mood'),
                          value: VariableNode(name: NameNode(value: 'mood')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'need'),
                          value: VariableNode(name: NameNode(value: 'need')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'share'),
                          value: VariableNode(name: NameNode(value: 'share')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'day'),
                          value: VariableNode(name: NameNode(value: 'day')),
                        ),
                      ],
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
MutationInsertMood _parserFnMutationInsertMood(Map<String, dynamic> data) =>
    MutationInsertMood.fromJson(data);
typedef OnMutationCompletedMutationInsertMood = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertMood?,
);

class OptionsMutationInsertMood extends graphql.MutationOptions<MutationInsertMood> {
  OptionsMutationInsertMood({
    String? operationName,
    required VariablesMutationInsertMood variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertMood? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertMood? onCompleted,
    graphql.OnMutationUpdate<MutationInsertMood>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationInsertMood(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertMood,
         parserFn: _parserFnMutationInsertMood,
       );

  final OnMutationCompletedMutationInsertMood? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertMood extends graphql.WatchQueryOptions<MutationInsertMood> {
  WatchOptionsMutationInsertMood({
    String? operationName,
    required VariablesMutationInsertMood variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertMood? typedOptimisticResult,
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
         document: documentNodeMutationInsertMood,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertMood,
       );
}

extension ClientExtensionMutationInsertMood on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertMood>> mutateInsertMood(
    OptionsMutationInsertMood options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertMood> watchMutationInsertMood(
    WatchOptionsMutationInsertMood options,
  ) => this.watchMutation(options);
}

class MutationInsertMoodinsertIntoMoodsCollection {
  MutationInsertMoodinsertIntoMoodsCollection({
    required this.affectedCount,
    required this.records,
    this.$__typename = 'MoodsInsertResponse',
  });

  factory MutationInsertMoodinsertIntoMoodsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationInsertMoodinsertIntoMoodsCollection(
      affectedCount: (l$affectedCount as int),
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationInsertMoodinsertIntoMoodsCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int affectedCount;

  final List<MutationInsertMoodinsertIntoMoodsCollectionrecords> records;

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
    if (other is! MutationInsertMoodinsertIntoMoodsCollection || runtimeType != other.runtimeType) {
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

class MutationInsertMoodinsertIntoMoodsCollectionrecords {
  MutationInsertMoodinsertIntoMoodsCollectionrecords({
    required this.id,
    required this.day,
    required this.mood,
    this.need,
    required this.share,
    this.$__typename = 'Moods',
  });

  factory MutationInsertMoodinsertIntoMoodsCollectionrecords.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$day = json['day'];
    final l$mood = json['mood'];
    final l$need = json['need'];
    final l$share = json['share'];
    final l$$__typename = json['__typename'];
    return MutationInsertMoodinsertIntoMoodsCollectionrecords(
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
    if (other is! MutationInsertMoodinsertIntoMoodsCollectionrecords ||
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
