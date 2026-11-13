// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddSharedDate {
  factory VariablesMutationAddSharedDate({
    required String title,
    required int month,
    required int day,
    required int year,
    String? coupleId,
  }) => VariablesMutationAddSharedDate._({
    r'title': title,
    r'month': month,
    r'day': day,
    r'year': year,
    if (coupleId != null) r'coupleId': coupleId,
  });

  VariablesMutationAddSharedDate._(this._$data);

  factory VariablesMutationAddSharedDate.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$month = data['month'];
    result$data['month'] = (l$month as int);
    final l$day = data['day'];
    result$data['day'] = (l$day as int);
    final l$year = data['year'];
    result$data['year'] = (l$year as int);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationAddSharedDate._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  int get month => (_$data['month'] as int);

  int get day => (_$data['day'] as int);

  int get year => (_$data['year'] as int);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$month = month;
    result$data['month'] = l$month;
    final l$day = day;
    result$data['day'] = l$day;
    final l$year = year;
    result$data['year'] = l$year;
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddSharedDate || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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
    if (l$year != lOther$year) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$month = month;
    final l$day = day;
    final l$year = year;
    final l$coupleId = coupleId;
    return Object.hashAll([
      l$title,
      l$month,
      l$day,
      l$year,
      _$data.containsKey('coupleId') ? l$coupleId : const {},
    ]);
  }
}

class MutationAddSharedDate {
  MutationAddSharedDate({this.insertIntoImportantDatesCollection, this.$__typename = 'Mutation'});

  factory MutationAddSharedDate.fromJson(Map<String, dynamic> json) {
    final l$insertIntoImportantDatesCollection = json['insertIntoImportantDatesCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddSharedDate(
      insertIntoImportantDatesCollection: l$insertIntoImportantDatesCollection == null
          ? null
          : MutationAddSharedDateinsertIntoImportantDatesCollection.fromJson(
              (l$insertIntoImportantDatesCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddSharedDateinsertIntoImportantDatesCollection? insertIntoImportantDatesCollection;

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
    if (other is! MutationAddSharedDate || runtimeType != other.runtimeType) {
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

const documentNodeMutationAddSharedDate = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddSharedDate'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
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
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
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
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'kind'),
                          value: StringValueNode(value: 'custom', isBlock: false),
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
                          value: BooleanValueNode(value: false),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'remindDays'),
                          value: ListValueNode(values: [IntValueNode(value: '1')]),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
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
MutationAddSharedDate _parserFnMutationAddSharedDate(Map<String, dynamic> data) =>
    MutationAddSharedDate.fromJson(data);
typedef OnMutationCompletedMutationAddSharedDate = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddSharedDate?,
);

class OptionsMutationAddSharedDate extends graphql.MutationOptions<MutationAddSharedDate> {
  OptionsMutationAddSharedDate({
    String? operationName,
    required VariablesMutationAddSharedDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddSharedDate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddSharedDate? onCompleted,
    graphql.OnMutationUpdate<MutationAddSharedDate>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationAddSharedDate(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddSharedDate,
         parserFn: _parserFnMutationAddSharedDate,
       );

  final OnMutationCompletedMutationAddSharedDate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddSharedDate extends graphql.WatchQueryOptions<MutationAddSharedDate> {
  WatchOptionsMutationAddSharedDate({
    String? operationName,
    required VariablesMutationAddSharedDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddSharedDate? typedOptimisticResult,
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
         document: documentNodeMutationAddSharedDate,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddSharedDate,
       );
}

extension ClientExtensionMutationAddSharedDate on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddSharedDate>> mutateAddSharedDate(
    OptionsMutationAddSharedDate options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddSharedDate> watchMutationAddSharedDate(
    WatchOptionsMutationAddSharedDate options,
  ) => this.watchMutation(options);
}

class MutationAddSharedDateinsertIntoImportantDatesCollection {
  MutationAddSharedDateinsertIntoImportantDatesCollection({
    required this.affectedCount,
    this.$__typename = 'ImportantDatesInsertResponse',
  });

  factory MutationAddSharedDateinsertIntoImportantDatesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddSharedDateinsertIntoImportantDatesCollection(
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
    if (other is! MutationAddSharedDateinsertIntoImportantDatesCollection ||
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
