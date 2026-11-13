// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateHistoryDate {
  factory VariablesMutationUpdateHistoryDate({
    required String id,
    String? coupleId,
    required String title,
    required String kind,
    required int month,
    required int day,
    int? year,
    required bool yearly,
  }) => VariablesMutationUpdateHistoryDate._({
    r'id': id,
    if (coupleId != null) r'coupleId': coupleId,
    r'title': title,
    r'kind': kind,
    r'month': month,
    r'day': day,
    if (year != null) r'year': year,
    r'yearly': yearly,
  });

  VariablesMutationUpdateHistoryDate._(this._$data);

  factory VariablesMutationUpdateHistoryDate.fromJson(Map<String, dynamic> data) {
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
    result$data['kind'] = (l$kind as String);
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
    return VariablesMutationUpdateHistoryDate._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get coupleId => (_$data['coupleId'] as String?);

  String get title => (_$data['title'] as String);

  String get kind => (_$data['kind'] as String);

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
    result$data['kind'] = l$kind;
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
    if (other is! VariablesMutationUpdateHistoryDate || runtimeType != other.runtimeType) {
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

class MutationUpdateHistoryDate {
  MutationUpdateHistoryDate({
    required this.updateImportantDatesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateHistoryDate.fromJson(Map<String, dynamic> json) {
    final l$updateImportantDatesCollection = json['updateImportantDatesCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateHistoryDate(
      updateImportantDatesCollection:
          MutationUpdateHistoryDateupdateImportantDatesCollection.fromJson(
            (l$updateImportantDatesCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateHistoryDateupdateImportantDatesCollection updateImportantDatesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateImportantDatesCollection = updateImportantDatesCollection;
    _resultData['updateImportantDatesCollection'] = l$updateImportantDatesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateImportantDatesCollection = updateImportantDatesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateImportantDatesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateHistoryDate || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateImportantDatesCollection = updateImportantDatesCollection;
    final lOther$updateImportantDatesCollection = other.updateImportantDatesCollection;
    if (l$updateImportantDatesCollection != lOther$updateImportantDatesCollection) {
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

const documentNodeMutationUpdateHistoryDate = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateHistoryDate'),
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
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
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
            name: NameNode(value: 'updateImportantDatesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
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
MutationUpdateHistoryDate _parserFnMutationUpdateHistoryDate(Map<String, dynamic> data) =>
    MutationUpdateHistoryDate.fromJson(data);
typedef OnMutationCompletedMutationUpdateHistoryDate = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateHistoryDate?,
);

class OptionsMutationUpdateHistoryDate extends graphql.MutationOptions<MutationUpdateHistoryDate> {
  OptionsMutationUpdateHistoryDate({
    String? operationName,
    required VariablesMutationUpdateHistoryDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateHistoryDate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateHistoryDate? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateHistoryDate>? update,
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
                 data == null ? null : _parserFnMutationUpdateHistoryDate(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateHistoryDate,
         parserFn: _parserFnMutationUpdateHistoryDate,
       );

  final OnMutationCompletedMutationUpdateHistoryDate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateHistoryDate
    extends graphql.WatchQueryOptions<MutationUpdateHistoryDate> {
  WatchOptionsMutationUpdateHistoryDate({
    String? operationName,
    required VariablesMutationUpdateHistoryDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateHistoryDate? typedOptimisticResult,
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
         document: documentNodeMutationUpdateHistoryDate,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateHistoryDate,
       );
}

extension ClientExtensionMutationUpdateHistoryDate on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateHistoryDate>> mutateUpdateHistoryDate(
    OptionsMutationUpdateHistoryDate options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateHistoryDate> watchMutationUpdateHistoryDate(
    WatchOptionsMutationUpdateHistoryDate options,
  ) => this.watchMutation(options);
}

class MutationUpdateHistoryDateupdateImportantDatesCollection {
  MutationUpdateHistoryDateupdateImportantDatesCollection({
    required this.affectedCount,
    this.$__typename = 'ImportantDatesUpdateResponse',
  });

  factory MutationUpdateHistoryDateupdateImportantDatesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateHistoryDateupdateImportantDatesCollection(
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
    if (other is! MutationUpdateHistoryDateupdateImportantDatesCollection ||
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
