// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertHistoryDate {
  factory VariablesMutationInsertHistoryDate({
    required String id,
    String? coupleId,
    required String title,
    required EnumImportantDateKind kind,
    required int month,
    required int day,
    int? year,
    required bool yearly,
  }) => VariablesMutationInsertHistoryDate._({
    r'id': id,
    if (coupleId != null) r'coupleId': coupleId,
    r'title': title,
    r'kind': kind,
    r'month': month,
    r'day': day,
    if (year != null) r'year': year,
    r'yearly': yearly,
  });

  VariablesMutationInsertHistoryDate._(this._$data);

  factory VariablesMutationInsertHistoryDate.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$kind = data['kind'];
    result$data['kind'] = fromJsonEnumImportantDateKind((l$kind as String));
    final l$month = data['month'];
    result$data['month'] = (l$month as int);
    final l$day = data['day'];
    result$data['day'] = (l$day as int);
    if (data.containsKey('year')) {
      final l$year = data['year'];
      result$data['year'] = (l$year as int?);
    }
    final l$yearly = data['yearly'];
    result$data['yearly'] = (l$yearly as bool);
    return VariablesMutationInsertHistoryDate._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get coupleId => (_$data['coupleId'] as String?);

  String get title => (_$data['title'] as String);

  EnumImportantDateKind get kind => (_$data['kind'] as EnumImportantDateKind);

  int get month => (_$data['month'] as int);

  int get day => (_$data['day'] as int);

  int? get year => (_$data['year'] as int?);

  bool get yearly => (_$data['yearly'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    final l$title = title;
    result$data['title'] = l$title;
    final l$kind = kind;
    result$data['kind'] = toJsonEnumImportantDateKind(l$kind);
    final l$month = month;
    result$data['month'] = l$month;
    final l$day = day;
    result$data['day'] = l$day;
    if (_$data.containsKey('year')) {
      final l$year = year;
      result$data['year'] = l$year;
    }
    final l$yearly = yearly;
    result$data['yearly'] = l$yearly;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertHistoryDate || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (_$data.containsKey('coupleId') != other._$data.containsKey('coupleId')) {
      return false;
    }
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (_$data.containsKey('year') != other._$data.containsKey('year')) {
      return false;
    }
    if (l$year != lOther$year) {
      return false;
    }
    final l$yearly = yearly;
    final lOther$yearly = other.yearly;
    if (l$yearly != lOther$yearly) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$coupleId = coupleId;
    final l$title = title;
    final l$kind = kind;
    final l$month = month;
    final l$day = day;
    final l$year = year;
    final l$yearly = yearly;
    return Object.hashAll([
      l$id,
      _$data.containsKey('coupleId') ? l$coupleId : const {},
      l$title,
      l$kind,
      l$month,
      l$day,
      _$data.containsKey('year') ? l$year : const {},
      l$yearly,
    ]);
  }
}

class MutationInsertHistoryDate {
  MutationInsertHistoryDate({
    this.insertIntoImportantDatesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertHistoryDate.fromJson(Map<String, dynamic> json) {
    final l$insertIntoImportantDatesCollection = json['insertIntoImportantDatesCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertHistoryDate(
      insertIntoImportantDatesCollection: l$insertIntoImportantDatesCollection == null
          ? null
          : MutationInsertHistoryDateinsertIntoImportantDatesCollection.fromJson(
              (l$insertIntoImportantDatesCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertHistoryDateinsertIntoImportantDatesCollection?
  insertIntoImportantDatesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoImportantDatesCollection = insertIntoImportantDatesCollection;
    _resultData['insertIntoImportantDatesCollection'] = l$insertIntoImportantDatesCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoImportantDatesCollection = insertIntoImportantDatesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoImportantDatesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertHistoryDate || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoImportantDatesCollection = insertIntoImportantDatesCollection;
    final lOther$insertIntoImportantDatesCollection = other.insertIntoImportantDatesCollection;
    if (l$insertIntoImportantDatesCollection != lOther$insertIntoImportantDatesCollection) {
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

const documentNodeMutationInsertHistoryDate = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertHistoryDate'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'ImportantDateKind'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'month')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'day')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'year')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'yearly')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoImportantDatesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'kind'),
                          value: VariableNode(name: NameNode(value: 'kind')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'month'),
                          value: VariableNode(name: NameNode(value: 'month')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'day'),
                          value: VariableNode(name: NameNode(value: 'day')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'year'),
                          value: VariableNode(name: NameNode(value: 'year')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'yearly'),
                          value: VariableNode(name: NameNode(value: 'yearly')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'origin'),
                          value: EnumValueNode(name: NameNode(value: 'manual')),
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
MutationInsertHistoryDate _parserFnMutationInsertHistoryDate(Map<String, dynamic> data) =>
    MutationInsertHistoryDate.fromJson(data);
typedef OnMutationCompletedMutationInsertHistoryDate = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertHistoryDate?,
);

class OptionsMutationInsertHistoryDate extends graphql.MutationOptions<MutationInsertHistoryDate> {
  OptionsMutationInsertHistoryDate({
    String? operationName,
    required VariablesMutationInsertHistoryDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertHistoryDate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertHistoryDate? onCompleted,
    graphql.OnMutationUpdate<MutationInsertHistoryDate>? update,
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
                 data == null ? null : _parserFnMutationInsertHistoryDate(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertHistoryDate,
         parserFn: _parserFnMutationInsertHistoryDate,
       );

  final OnMutationCompletedMutationInsertHistoryDate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertHistoryDate
    extends graphql.WatchQueryOptions<MutationInsertHistoryDate> {
  WatchOptionsMutationInsertHistoryDate({
    String? operationName,
    required VariablesMutationInsertHistoryDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertHistoryDate? typedOptimisticResult,
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
         document: documentNodeMutationInsertHistoryDate,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertHistoryDate,
       );
}

extension ClientExtensionMutationInsertHistoryDate on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertHistoryDate>> mutateInsertHistoryDate(
    OptionsMutationInsertHistoryDate options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertHistoryDate> watchMutationInsertHistoryDate(
    WatchOptionsMutationInsertHistoryDate options,
  ) => this.watchMutation(options);
}

class MutationInsertHistoryDateinsertIntoImportantDatesCollection {
  MutationInsertHistoryDateinsertIntoImportantDatesCollection({
    required this.affectedCount,
    this.$__typename = 'ImportantDatesInsertResponse',
  });

  factory MutationInsertHistoryDateinsertIntoImportantDatesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationInsertHistoryDateinsertIntoImportantDatesCollection(
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
    if (other is! MutationInsertHistoryDateinsertIntoImportantDatesCollection ||
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
