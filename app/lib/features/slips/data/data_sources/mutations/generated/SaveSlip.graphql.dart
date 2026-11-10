// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSaveSlip {
  factory VariablesMutationSaveSlip({
    required String id,
    required String body,
    String? kind,
    String? feeling,
    String? planNote,
    bool? forCard,
    DateTime? createdAt,
  }) => VariablesMutationSaveSlip._({
    r'id': id,
    r'body': body,
    if (kind != null) r'kind': kind,
    if (feeling != null) r'feeling': feeling,
    if (planNote != null) r'planNote': planNote,
    if (forCard != null) r'forCard': forCard,
    if (createdAt != null) r'createdAt': createdAt,
  });

  VariablesMutationSaveSlip._(this._$data);

  factory VariablesMutationSaveSlip.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    if (data.containsKey('kind')) {
      final l$kind = data['kind'];
      result$data['kind'] = (l$kind as String?);
    }
    if (data.containsKey('feeling')) {
      final l$feeling = data['feeling'];
      result$data['feeling'] = (l$feeling as String?);
    }
    if (data.containsKey('planNote')) {
      final l$planNote = data['planNote'];
      result$data['planNote'] = (l$planNote as String?);
    }
    if (data.containsKey('forCard')) {
      final l$forCard = data['forCard'];
      result$data['forCard'] = (l$forCard as bool?);
    }
    if (data.containsKey('createdAt')) {
      final l$createdAt = data['createdAt'];
      result$data['createdAt'] = l$createdAt == null
          ? null
          : DateTime.parse((l$createdAt as String));
    }
    return VariablesMutationSaveSlip._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get body => (_$data['body'] as String);

  String? get kind => (_$data['kind'] as String?);

  String? get feeling => (_$data['feeling'] as String?);

  String? get planNote => (_$data['planNote'] as String?);

  bool? get forCard => (_$data['forCard'] as bool?);

  DateTime? get createdAt => (_$data['createdAt'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$body = body;
    result$data['body'] = l$body;
    if (_$data.containsKey('kind')) {
      final l$kind = kind;
      result$data['kind'] = l$kind;
    }
    if (_$data.containsKey('feeling')) {
      final l$feeling = feeling;
      result$data['feeling'] = l$feeling;
    }
    if (_$data.containsKey('planNote')) {
      final l$planNote = planNote;
      result$data['planNote'] = l$planNote;
    }
    if (_$data.containsKey('forCard')) {
      final l$forCard = forCard;
      result$data['forCard'] = l$forCard;
    }
    if (_$data.containsKey('createdAt')) {
      final l$createdAt = createdAt;
      result$data['createdAt'] = l$createdAt?.toIso8601String();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSaveSlip || runtimeType != other.runtimeType) {
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
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (_$data.containsKey('kind') != other._$data.containsKey('kind')) {
      return false;
    }
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$feeling = feeling;
    final lOther$feeling = other.feeling;
    if (_$data.containsKey('feeling') != other._$data.containsKey('feeling')) {
      return false;
    }
    if (l$feeling != lOther$feeling) {
      return false;
    }
    final l$planNote = planNote;
    final lOther$planNote = other.planNote;
    if (_$data.containsKey('planNote') != other._$data.containsKey('planNote')) {
      return false;
    }
    if (l$planNote != lOther$planNote) {
      return false;
    }
    final l$forCard = forCard;
    final lOther$forCard = other.forCard;
    if (_$data.containsKey('forCard') != other._$data.containsKey('forCard')) {
      return false;
    }
    if (l$forCard != lOther$forCard) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (_$data.containsKey('createdAt') != other._$data.containsKey('createdAt')) {
      return false;
    }
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$body = body;
    final l$kind = kind;
    final l$feeling = feeling;
    final l$planNote = planNote;
    final l$forCard = forCard;
    final l$createdAt = createdAt;
    return Object.hashAll([
      l$id,
      l$body,
      _$data.containsKey('kind') ? l$kind : const {},
      _$data.containsKey('feeling') ? l$feeling : const {},
      _$data.containsKey('planNote') ? l$planNote : const {},
      _$data.containsKey('forCard') ? l$forCard : const {},
      _$data.containsKey('createdAt') ? l$createdAt : const {},
    ]);
  }
}

class MutationSaveSlip {
  MutationSaveSlip({this.saveSlip, this.$__typename = 'Mutation'});

  factory MutationSaveSlip.fromJson(Map<String, dynamic> json) {
    final l$saveSlip = json['saveSlip'];
    final l$$__typename = json['__typename'];
    return MutationSaveSlip(
      saveSlip: l$saveSlip == null
          ? null
          : MutationSaveSlipsaveSlip.fromJson((l$saveSlip as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSaveSlipsaveSlip? saveSlip;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$saveSlip = saveSlip;
    _resultData['saveSlip'] = l$saveSlip?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$saveSlip = saveSlip;
    final l$$__typename = $__typename;
    return Object.hashAll([l$saveSlip, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSaveSlip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$saveSlip = saveSlip;
    final lOther$saveSlip = other.saveSlip;
    if (l$saveSlip != lOther$saveSlip) {
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

const documentNodeMutationSaveSlip = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SaveSlip'),
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
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'feeling')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'planNote')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'forCard')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'createdAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'saveSlip'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'body'),
                value: VariableNode(name: NameNode(value: 'body')),
              ),
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: VariableNode(name: NameNode(value: 'kind')),
              ),
              ArgumentNode(
                name: NameNode(value: 'feeling'),
                value: VariableNode(name: NameNode(value: 'feeling')),
              ),
              ArgumentNode(
                name: NameNode(value: 'planNote'),
                value: VariableNode(name: NameNode(value: 'planNote')),
              ),
              ArgumentNode(
                name: NameNode(value: 'forCard'),
                value: VariableNode(name: NameNode(value: 'forCard')),
              ),
              ArgumentNode(
                name: NameNode(value: 'createdAt'),
                value: VariableNode(name: NameNode(value: 'createdAt')),
              ),
            ],
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
MutationSaveSlip _parserFnMutationSaveSlip(Map<String, dynamic> data) =>
    MutationSaveSlip.fromJson(data);
typedef OnMutationCompletedMutationSaveSlip = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSaveSlip?,
);

class OptionsMutationSaveSlip extends graphql.MutationOptions<MutationSaveSlip> {
  OptionsMutationSaveSlip({
    String? operationName,
    required VariablesMutationSaveSlip variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveSlip? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSaveSlip? onCompleted,
    graphql.OnMutationUpdate<MutationSaveSlip>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationSaveSlip(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSaveSlip,
         parserFn: _parserFnMutationSaveSlip,
       );

  final OnMutationCompletedMutationSaveSlip? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSaveSlip extends graphql.WatchQueryOptions<MutationSaveSlip> {
  WatchOptionsMutationSaveSlip({
    String? operationName,
    required VariablesMutationSaveSlip variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSaveSlip? typedOptimisticResult,
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
         document: documentNodeMutationSaveSlip,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSaveSlip,
       );
}

extension ClientExtensionMutationSaveSlip on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSaveSlip>> mutateSaveSlip(
    OptionsMutationSaveSlip options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSaveSlip> watchMutationSaveSlip(
    WatchOptionsMutationSaveSlip options,
  ) => this.watchMutation(options);
}

class MutationSaveSlipsaveSlip {
  MutationSaveSlipsaveSlip({required this.id, this.$__typename = 'Slips'});

  factory MutationSaveSlipsaveSlip.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSaveSlipsaveSlip(id: (l$id as String), $__typename: (l$$__typename as String));
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSaveSlipsaveSlip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
