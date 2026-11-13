// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertHistoryMemory {
  factory VariablesMutationInsertHistoryMemory({
    required String id,
    String? coupleId,
    required String title,
    String? body,
    required DateTime happenedOn,
    required String datePrecision,
    String? place,
    required String origin,
  }) => VariablesMutationInsertHistoryMemory._({
    r'id': id,
    if (coupleId != null) r'coupleId': coupleId,
    r'title': title,
    if (body != null) r'body': body,
    r'happenedOn': happenedOn,
    r'datePrecision': datePrecision,
    if (place != null) r'place': place,
    r'origin': origin,
  });

  VariablesMutationInsertHistoryMemory._(this._$data);

  factory VariablesMutationInsertHistoryMemory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    final l$happenedOn = data['happenedOn'];
    result$data['happenedOn'] = DateTime.parse((l$happenedOn as String));
    final l$datePrecision = data['datePrecision'];
    result$data['datePrecision'] = (l$datePrecision as String);
    if (data.containsKey('place')) {
      final l$place = data['place'];
      result$data['place'] = (l$place as String?);
    }
    final l$origin = data['origin'];
    result$data['origin'] = (l$origin as String);
    return VariablesMutationInsertHistoryMemory._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get coupleId => (_$data['coupleId'] as String?);

  String get title => (_$data['title'] as String);

  String? get body => (_$data['body'] as String?);

  DateTime get happenedOn => (_$data['happenedOn'] as DateTime);

  String get datePrecision => (_$data['datePrecision'] as String);

  String? get place => (_$data['place'] as String?);

  String get origin => (_$data['origin'] as String);

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
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    final l$happenedOn = happenedOn;
    result$data['happenedOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$happenedOn);
    final l$datePrecision = datePrecision;
    result$data['datePrecision'] = l$datePrecision;
    if (_$data.containsKey('place')) {
      final l$place = place;
      result$data['place'] = l$place;
    }
    final l$origin = origin;
    result$data['origin'] = l$origin;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertHistoryMemory || runtimeType != other.runtimeType) {
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
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    final l$happenedOn = happenedOn;
    final lOther$happenedOn = other.happenedOn;
    if (l$happenedOn != lOther$happenedOn) {
      return false;
    }
    final l$datePrecision = datePrecision;
    final lOther$datePrecision = other.datePrecision;
    if (l$datePrecision != lOther$datePrecision) {
      return false;
    }
    final l$place = place;
    final lOther$place = other.place;
    if (_$data.containsKey('place') != other._$data.containsKey('place')) {
      return false;
    }
    if (l$place != lOther$place) {
      return false;
    }
    final l$origin = origin;
    final lOther$origin = other.origin;
    if (l$origin != lOther$origin) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$coupleId = coupleId;
    final l$title = title;
    final l$body = body;
    final l$happenedOn = happenedOn;
    final l$datePrecision = datePrecision;
    final l$place = place;
    final l$origin = origin;
    return Object.hashAll([
      l$id,
      _$data.containsKey('coupleId') ? l$coupleId : const {},
      l$title,
      _$data.containsKey('body') ? l$body : const {},
      l$happenedOn,
      l$datePrecision,
      _$data.containsKey('place') ? l$place : const {},
      l$origin,
    ]);
  }
}

class MutationInsertHistoryMemory {
  MutationInsertHistoryMemory({this.insertIntoMemoriesCollection, this.$__typename = 'Mutation'});

  factory MutationInsertHistoryMemory.fromJson(Map<String, dynamic> json) {
    final l$insertIntoMemoriesCollection = json['insertIntoMemoriesCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertHistoryMemory(
      insertIntoMemoriesCollection: l$insertIntoMemoriesCollection == null
          ? null
          : MutationInsertHistoryMemoryinsertIntoMemoriesCollection.fromJson(
              (l$insertIntoMemoriesCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertHistoryMemoryinsertIntoMemoriesCollection? insertIntoMemoriesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoMemoriesCollection = insertIntoMemoriesCollection;
    _resultData['insertIntoMemoriesCollection'] = l$insertIntoMemoriesCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoMemoriesCollection = insertIntoMemoriesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoMemoriesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertHistoryMemory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoMemoriesCollection = insertIntoMemoriesCollection;
    final lOther$insertIntoMemoriesCollection = other.insertIntoMemoriesCollection;
    if (l$insertIntoMemoriesCollection != lOther$insertIntoMemoriesCollection) {
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

const documentNodeMutationInsertHistoryMemory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertHistoryMemory'),
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
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'happenedOn')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'datePrecision')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'place')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'origin')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoMemoriesCollection'),
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
                          name: NameNode(value: 'body'),
                          value: VariableNode(name: NameNode(value: 'body')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'happenedOn'),
                          value: VariableNode(name: NameNode(value: 'happenedOn')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'datePrecision'),
                          value: VariableNode(name: NameNode(value: 'datePrecision')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'place'),
                          value: VariableNode(name: NameNode(value: 'place')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'origin'),
                          value: VariableNode(name: NameNode(value: 'origin')),
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
MutationInsertHistoryMemory _parserFnMutationInsertHistoryMemory(Map<String, dynamic> data) =>
    MutationInsertHistoryMemory.fromJson(data);
typedef OnMutationCompletedMutationInsertHistoryMemory = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertHistoryMemory?,
);

class OptionsMutationInsertHistoryMemory
    extends graphql.MutationOptions<MutationInsertHistoryMemory> {
  OptionsMutationInsertHistoryMemory({
    String? operationName,
    required VariablesMutationInsertHistoryMemory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertHistoryMemory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertHistoryMemory? onCompleted,
    graphql.OnMutationUpdate<MutationInsertHistoryMemory>? update,
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
                 data == null ? null : _parserFnMutationInsertHistoryMemory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertHistoryMemory,
         parserFn: _parserFnMutationInsertHistoryMemory,
       );

  final OnMutationCompletedMutationInsertHistoryMemory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertHistoryMemory
    extends graphql.WatchQueryOptions<MutationInsertHistoryMemory> {
  WatchOptionsMutationInsertHistoryMemory({
    String? operationName,
    required VariablesMutationInsertHistoryMemory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertHistoryMemory? typedOptimisticResult,
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
         document: documentNodeMutationInsertHistoryMemory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertHistoryMemory,
       );
}

extension ClientExtensionMutationInsertHistoryMemory on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertHistoryMemory>> mutateInsertHistoryMemory(
    OptionsMutationInsertHistoryMemory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertHistoryMemory> watchMutationInsertHistoryMemory(
    WatchOptionsMutationInsertHistoryMemory options,
  ) => this.watchMutation(options);
}

class MutationInsertHistoryMemoryinsertIntoMemoriesCollection {
  MutationInsertHistoryMemoryinsertIntoMemoriesCollection({
    required this.affectedCount,
    this.$__typename = 'MemoriesInsertResponse',
  });

  factory MutationInsertHistoryMemoryinsertIntoMemoriesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationInsertHistoryMemoryinsertIntoMemoriesCollection(
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
    if (other is! MutationInsertHistoryMemoryinsertIntoMemoriesCollection ||
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
