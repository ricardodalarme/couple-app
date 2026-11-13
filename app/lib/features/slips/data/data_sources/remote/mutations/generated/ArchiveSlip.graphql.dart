// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationArchiveSlip {
  factory VariablesMutationArchiveSlip({required String id, bool? archived}) =>
      VariablesMutationArchiveSlip._({r'id': id, if (archived != null) r'archived': archived});

  VariablesMutationArchiveSlip._(this._$data);

  factory VariablesMutationArchiveSlip.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('archived')) {
      final l$archived = data['archived'];
      result$data['archived'] = (l$archived as bool?);
    }
    return VariablesMutationArchiveSlip._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  bool? get archived => (_$data['archived'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('archived')) {
      final l$archived = archived;
      result$data['archived'] = l$archived;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationArchiveSlip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (_$data.containsKey('archived') != other._$data.containsKey('archived')) {
      return false;
    }
    if (l$archived != lOther$archived) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$archived = archived;
    return Object.hashAll([l$id, _$data.containsKey('archived') ? l$archived : const {}]);
  }
}

class MutationArchiveSlip {
  MutationArchiveSlip({this.archiveSlip, this.$__typename = 'Mutation'});

  factory MutationArchiveSlip.fromJson(Map<String, dynamic> json) {
    final l$archiveSlip = json['archiveSlip'];
    final l$$__typename = json['__typename'];
    return MutationArchiveSlip(
      archiveSlip: l$archiveSlip == null
          ? null
          : MutationArchiveSliparchiveSlip.fromJson((l$archiveSlip as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationArchiveSliparchiveSlip? archiveSlip;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$archiveSlip = archiveSlip;
    _resultData['archiveSlip'] = l$archiveSlip?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$archiveSlip = archiveSlip;
    final l$$__typename = $__typename;
    return Object.hashAll([l$archiveSlip, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationArchiveSlip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$archiveSlip = archiveSlip;
    final lOther$archiveSlip = other.archiveSlip;
    if (l$archiveSlip != lOther$archiveSlip) {
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

const documentNodeMutationArchiveSlip = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ArchiveSlip'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'archived')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'archiveSlip'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'archived'),
                value: VariableNode(name: NameNode(value: 'archived')),
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
MutationArchiveSlip _parserFnMutationArchiveSlip(Map<String, dynamic> data) =>
    MutationArchiveSlip.fromJson(data);
typedef OnMutationCompletedMutationArchiveSlip = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationArchiveSlip?,
);

class OptionsMutationArchiveSlip extends graphql.MutationOptions<MutationArchiveSlip> {
  OptionsMutationArchiveSlip({
    String? operationName,
    required VariablesMutationArchiveSlip variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationArchiveSlip? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationArchiveSlip? onCompleted,
    graphql.OnMutationUpdate<MutationArchiveSlip>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationArchiveSlip(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationArchiveSlip,
         parserFn: _parserFnMutationArchiveSlip,
       );

  final OnMutationCompletedMutationArchiveSlip? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationArchiveSlip extends graphql.WatchQueryOptions<MutationArchiveSlip> {
  WatchOptionsMutationArchiveSlip({
    String? operationName,
    required VariablesMutationArchiveSlip variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationArchiveSlip? typedOptimisticResult,
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
         document: documentNodeMutationArchiveSlip,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationArchiveSlip,
       );
}

extension ClientExtensionMutationArchiveSlip on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationArchiveSlip>> mutateArchiveSlip(
    OptionsMutationArchiveSlip options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationArchiveSlip> watchMutationArchiveSlip(
    WatchOptionsMutationArchiveSlip options,
  ) => this.watchMutation(options);
}

class MutationArchiveSliparchiveSlip {
  MutationArchiveSliparchiveSlip({required this.id, this.$__typename = 'Slips'});

  factory MutationArchiveSliparchiveSlip.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationArchiveSliparchiveSlip(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
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
    if (other is! MutationArchiveSliparchiveSlip || runtimeType != other.runtimeType) {
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
