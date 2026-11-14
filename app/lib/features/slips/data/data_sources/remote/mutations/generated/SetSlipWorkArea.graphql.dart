// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetSlipWorkArea {
  factory VariablesMutationSetSlipWorkArea({required String id, String? workArea}) =>
      VariablesMutationSetSlipWorkArea._({r'id': id, if (workArea != null) r'workArea': workArea});

  VariablesMutationSetSlipWorkArea._(this._$data);

  factory VariablesMutationSetSlipWorkArea.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('workArea')) {
      final l$workArea = data['workArea'];
      result$data['workArea'] = (l$workArea as String?);
    }
    return VariablesMutationSetSlipWorkArea._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get workArea => (_$data['workArea'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('workArea')) {
      final l$workArea = workArea;
      result$data['workArea'] = l$workArea;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetSlipWorkArea || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$workArea = workArea;
    final lOther$workArea = other.workArea;
    if (_$data.containsKey('workArea') != other._$data.containsKey('workArea')) {
      return false;
    }
    if (l$workArea != lOther$workArea) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$workArea = workArea;
    return Object.hashAll([l$id, _$data.containsKey('workArea') ? l$workArea : const {}]);
  }
}

class MutationSetSlipWorkArea {
  MutationSetSlipWorkArea({this.setSlipDetails, this.$__typename = 'Mutation'});

  factory MutationSetSlipWorkArea.fromJson(Map<String, dynamic> json) {
    final l$setSlipDetails = json['setSlipDetails'];
    final l$$__typename = json['__typename'];
    return MutationSetSlipWorkArea(
      setSlipDetails: l$setSlipDetails == null
          ? null
          : MutationSetSlipWorkAreasetSlipDetails.fromJson(
              (l$setSlipDetails as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetSlipWorkAreasetSlipDetails? setSlipDetails;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setSlipDetails = setSlipDetails;
    _resultData['setSlipDetails'] = l$setSlipDetails?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setSlipDetails = setSlipDetails;
    final l$$__typename = $__typename;
    return Object.hashAll([l$setSlipDetails, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetSlipWorkArea || runtimeType != other.runtimeType) {
      return false;
    }
    final l$setSlipDetails = setSlipDetails;
    final lOther$setSlipDetails = other.setSlipDetails;
    if (l$setSlipDetails != lOther$setSlipDetails) {
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

const documentNodeMutationSetSlipWorkArea = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetSlipWorkArea'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'workArea')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'setSlipDetails'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'workArea'),
                value: VariableNode(name: NameNode(value: 'workArea')),
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
MutationSetSlipWorkArea _parserFnMutationSetSlipWorkArea(Map<String, dynamic> data) =>
    MutationSetSlipWorkArea.fromJson(data);
typedef OnMutationCompletedMutationSetSlipWorkArea = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetSlipWorkArea?,
);

class OptionsMutationSetSlipWorkArea extends graphql.MutationOptions<MutationSetSlipWorkArea> {
  OptionsMutationSetSlipWorkArea({
    String? operationName,
    required VariablesMutationSetSlipWorkArea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSlipWorkArea? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetSlipWorkArea? onCompleted,
    graphql.OnMutationUpdate<MutationSetSlipWorkArea>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetSlipWorkArea',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationSetSlipWorkArea(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSetSlipWorkArea,
         parserFn: _parserFnMutationSetSlipWorkArea,
       );

  final OnMutationCompletedMutationSetSlipWorkArea? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetSlipWorkArea
    extends graphql.WatchQueryOptions<MutationSetSlipWorkArea> {
  WatchOptionsMutationSetSlipWorkArea({
    String? operationName,
    required VariablesMutationSetSlipWorkArea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSlipWorkArea? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetSlipWorkArea',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetSlipWorkArea,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetSlipWorkArea,
       );
}

extension ClientExtensionMutationSetSlipWorkArea on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetSlipWorkArea>> mutateSetSlipWorkArea(
    OptionsMutationSetSlipWorkArea options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetSlipWorkArea> watchMutationSetSlipWorkArea(
    WatchOptionsMutationSetSlipWorkArea options,
  ) => this.watchMutation(options);
}

class MutationSetSlipWorkAreasetSlipDetails {
  MutationSetSlipWorkAreasetSlipDetails({required this.id, this.$__typename = 'Slips'});

  factory MutationSetSlipWorkAreasetSlipDetails.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSetSlipWorkAreasetSlipDetails(
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
    if (other is! MutationSetSlipWorkAreasetSlipDetails || runtimeType != other.runtimeType) {
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
