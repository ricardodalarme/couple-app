// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertStoryEvent {
  factory VariablesMutationInsertStoryEvent({
    required String id,
    String? coupleId,
    required String kind,
    String? title,
    required DateTime happenedOn,
    required String datePrecision,
  }) => VariablesMutationInsertStoryEvent._({
    r'id': id,
    if (coupleId != null) r'coupleId': coupleId,
    r'kind': kind,
    if (title != null) r'title': title,
    r'happenedOn': happenedOn,
    r'datePrecision': datePrecision,
  });

  VariablesMutationInsertStoryEvent._(this._$data);

  factory VariablesMutationInsertStoryEvent.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    final l$kind = data['kind'];
    result$data['kind'] = (l$kind as String);
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    final l$happenedOn = data['happenedOn'];
    result$data['happenedOn'] = DateTime.parse((l$happenedOn as String));
    final l$datePrecision = data['datePrecision'];
    result$data['datePrecision'] = (l$datePrecision as String);
    return VariablesMutationInsertStoryEvent._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get coupleId => (_$data['coupleId'] as String?);

  String get kind => (_$data['kind'] as String);

  String? get title => (_$data['title'] as String?);

  DateTime get happenedOn => (_$data['happenedOn'] as DateTime);

  String get datePrecision => (_$data['datePrecision'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    final l$kind = kind;
    result$data['kind'] = l$kind;
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    final l$happenedOn = happenedOn;
    result$data['happenedOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$happenedOn);
    final l$datePrecision = datePrecision;
    result$data['datePrecision'] = l$datePrecision;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertStoryEvent || runtimeType != other.runtimeType) {
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
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$coupleId = coupleId;
    final l$kind = kind;
    final l$title = title;
    final l$happenedOn = happenedOn;
    final l$datePrecision = datePrecision;
    return Object.hashAll([
      l$id,
      _$data.containsKey('coupleId') ? l$coupleId : const {},
      l$kind,
      _$data.containsKey('title') ? l$title : const {},
      l$happenedOn,
      l$datePrecision,
    ]);
  }
}

class MutationInsertStoryEvent {
  MutationInsertStoryEvent({this.insertIntoStoryEventsCollection, this.$__typename = 'Mutation'});

  factory MutationInsertStoryEvent.fromJson(Map<String, dynamic> json) {
    final l$insertIntoStoryEventsCollection = json['insertIntoStoryEventsCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertStoryEvent(
      insertIntoStoryEventsCollection: l$insertIntoStoryEventsCollection == null
          ? null
          : MutationInsertStoryEventinsertIntoStoryEventsCollection.fromJson(
              (l$insertIntoStoryEventsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertStoryEventinsertIntoStoryEventsCollection? insertIntoStoryEventsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoStoryEventsCollection = insertIntoStoryEventsCollection;
    _resultData['insertIntoStoryEventsCollection'] = l$insertIntoStoryEventsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoStoryEventsCollection = insertIntoStoryEventsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoStoryEventsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertStoryEvent || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoStoryEventsCollection = insertIntoStoryEventsCollection;
    final lOther$insertIntoStoryEventsCollection = other.insertIntoStoryEventsCollection;
    if (l$insertIntoStoryEventsCollection != lOther$insertIntoStoryEventsCollection) {
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

const documentNodeMutationInsertStoryEvent = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertStoryEvent'),
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
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
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
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoStoryEventsCollection'),
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
                          name: NameNode(value: 'kind'),
                          value: VariableNode(name: NameNode(value: 'kind')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'happenedOn'),
                          value: VariableNode(name: NameNode(value: 'happenedOn')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'datePrecision'),
                          value: VariableNode(name: NameNode(value: 'datePrecision')),
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
MutationInsertStoryEvent _parserFnMutationInsertStoryEvent(Map<String, dynamic> data) =>
    MutationInsertStoryEvent.fromJson(data);
typedef OnMutationCompletedMutationInsertStoryEvent = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertStoryEvent?,
);

class OptionsMutationInsertStoryEvent extends graphql.MutationOptions<MutationInsertStoryEvent> {
  OptionsMutationInsertStoryEvent({
    String? operationName,
    required VariablesMutationInsertStoryEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertStoryEvent? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertStoryEvent? onCompleted,
    graphql.OnMutationUpdate<MutationInsertStoryEvent>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationInsertStoryEvent(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertStoryEvent,
         parserFn: _parserFnMutationInsertStoryEvent,
       );

  final OnMutationCompletedMutationInsertStoryEvent? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertStoryEvent
    extends graphql.WatchQueryOptions<MutationInsertStoryEvent> {
  WatchOptionsMutationInsertStoryEvent({
    String? operationName,
    required VariablesMutationInsertStoryEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertStoryEvent? typedOptimisticResult,
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
         document: documentNodeMutationInsertStoryEvent,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertStoryEvent,
       );
}

extension ClientExtensionMutationInsertStoryEvent on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertStoryEvent>> mutateInsertStoryEvent(
    OptionsMutationInsertStoryEvent options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertStoryEvent> watchMutationInsertStoryEvent(
    WatchOptionsMutationInsertStoryEvent options,
  ) => this.watchMutation(options);
}

class MutationInsertStoryEventinsertIntoStoryEventsCollection {
  MutationInsertStoryEventinsertIntoStoryEventsCollection({
    required this.affectedCount,
    this.$__typename = 'StoryEventsInsertResponse',
  });

  factory MutationInsertStoryEventinsertIntoStoryEventsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationInsertStoryEventinsertIntoStoryEventsCollection(
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
    if (other is! MutationInsertStoryEventinsertIntoStoryEventsCollection ||
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
