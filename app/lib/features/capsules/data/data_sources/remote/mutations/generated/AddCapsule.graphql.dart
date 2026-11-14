// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddCapsule {
  factory VariablesMutationAddCapsule({
    required String id,
    required String body,
    required DateTime opensOn,
    String? coupleId,
  }) => VariablesMutationAddCapsule._({
    r'id': id,
    r'body': body,
    r'opensOn': opensOn,
    if (coupleId != null) r'coupleId': coupleId,
  });

  VariablesMutationAddCapsule._(this._$data);

  factory VariablesMutationAddCapsule.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    final l$opensOn = data['opensOn'];
    result$data['opensOn'] = DateTime.parse((l$opensOn as String));
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationAddCapsule._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get body => (_$data['body'] as String);

  DateTime get opensOn => (_$data['opensOn'] as DateTime);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$body = body;
    result$data['body'] = l$body;
    final l$opensOn = opensOn;
    result$data['opensOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$opensOn);
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
    if (other is! VariablesMutationAddCapsule || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$opensOn = opensOn;
    final lOther$opensOn = other.opensOn;
    if (l$opensOn != lOther$opensOn) {
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
    final l$id = id;
    final l$body = body;
    final l$opensOn = opensOn;
    final l$coupleId = coupleId;
    return Object.hashAll([
      l$id,
      l$body,
      l$opensOn,
      _$data.containsKey('coupleId') ? l$coupleId : const {},
    ]);
  }
}

class MutationAddCapsule {
  MutationAddCapsule({this.insertIntoCapsulesCollection, this.$__typename = 'Mutation'});

  factory MutationAddCapsule.fromJson(Map<String, dynamic> json) {
    final l$insertIntoCapsulesCollection = json['insertIntoCapsulesCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddCapsule(
      insertIntoCapsulesCollection: l$insertIntoCapsulesCollection == null
          ? null
          : MutationAddCapsuleinsertIntoCapsulesCollection.fromJson(
              (l$insertIntoCapsulesCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddCapsuleinsertIntoCapsulesCollection? insertIntoCapsulesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoCapsulesCollection = insertIntoCapsulesCollection;
    _resultData['insertIntoCapsulesCollection'] = l$insertIntoCapsulesCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoCapsulesCollection = insertIntoCapsulesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoCapsulesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddCapsule || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoCapsulesCollection = insertIntoCapsulesCollection;
    final lOther$insertIntoCapsulesCollection = other.insertIntoCapsulesCollection;
    if (l$insertIntoCapsulesCollection != lOther$insertIntoCapsulesCollection) {
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

const documentNodeMutationAddCapsule = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddCapsule'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'body')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'opensOn')),
          type: NamedTypeNode(name: NameNode(value: 'Date'), isNonNull: true),
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
            name: NameNode(value: 'insertIntoCapsulesCollection'),
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
                          name: NameNode(value: 'body'),
                          value: VariableNode(name: NameNode(value: 'body')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'opensOn'),
                          value: VariableNode(name: NameNode(value: 'opensOn')),
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
MutationAddCapsule _parserFnMutationAddCapsule(Map<String, dynamic> data) =>
    MutationAddCapsule.fromJson(data);
typedef OnMutationCompletedMutationAddCapsule = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddCapsule?,
);

class OptionsMutationAddCapsule extends graphql.MutationOptions<MutationAddCapsule> {
  OptionsMutationAddCapsule({
    String? operationName,
    required VariablesMutationAddCapsule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddCapsule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddCapsule? onCompleted,
    graphql.OnMutationUpdate<MutationAddCapsule>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'AddCapsule',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationAddCapsule(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddCapsule,
         parserFn: _parserFnMutationAddCapsule,
       );

  final OnMutationCompletedMutationAddCapsule? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddCapsule extends graphql.WatchQueryOptions<MutationAddCapsule> {
  WatchOptionsMutationAddCapsule({
    String? operationName,
    required VariablesMutationAddCapsule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddCapsule? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'AddCapsule',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationAddCapsule,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddCapsule,
       );
}

extension ClientExtensionMutationAddCapsule on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddCapsule>> mutateAddCapsule(
    OptionsMutationAddCapsule options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddCapsule> watchMutationAddCapsule(
    WatchOptionsMutationAddCapsule options,
  ) => this.watchMutation(options);
}

class MutationAddCapsuleinsertIntoCapsulesCollection {
  MutationAddCapsuleinsertIntoCapsulesCollection({
    required this.affectedCount,
    this.$__typename = 'CapsulesInsertResponse',
  });

  factory MutationAddCapsuleinsertIntoCapsulesCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddCapsuleinsertIntoCapsulesCollection(
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
    if (other is! MutationAddCapsuleinsertIntoCapsulesCollection ||
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
