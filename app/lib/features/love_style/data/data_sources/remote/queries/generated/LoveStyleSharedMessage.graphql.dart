// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryLoveStyleSharedMessage {
  factory VariablesQueryLoveStyleSharedMessage({required String id}) =>
      VariablesQueryLoveStyleSharedMessage._({r'id': id});

  VariablesQueryLoveStyleSharedMessage._(this._$data);

  factory VariablesQueryLoveStyleSharedMessage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesQueryLoveStyleSharedMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryLoveStyleSharedMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class QueryLoveStyleSharedMessage {
  QueryLoveStyleSharedMessage({this.partnerMessagesByPk, this.$__typename = 'Query'});

  factory QueryLoveStyleSharedMessage.fromJson(Map<String, dynamic> json) {
    final l$partnerMessagesByPk = json['partnerMessagesByPk'];
    final l$$__typename = json['__typename'];
    return QueryLoveStyleSharedMessage(
      partnerMessagesByPk: l$partnerMessagesByPk == null
          ? null
          : QueryLoveStyleSharedMessagepartnerMessagesByPk.fromJson(
              (l$partnerMessagesByPk as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLoveStyleSharedMessagepartnerMessagesByPk? partnerMessagesByPk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$partnerMessagesByPk = partnerMessagesByPk;
    _resultData['partnerMessagesByPk'] = l$partnerMessagesByPk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$partnerMessagesByPk = partnerMessagesByPk;
    final l$$__typename = $__typename;
    return Object.hashAll([l$partnerMessagesByPk, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryLoveStyleSharedMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$partnerMessagesByPk = partnerMessagesByPk;
    final lOther$partnerMessagesByPk = other.partnerMessagesByPk;
    if (l$partnerMessagesByPk != lOther$partnerMessagesByPk) {
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

const documentNodeQueryLoveStyleSharedMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'LoveStyleSharedMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'partnerMessagesByPk'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
QueryLoveStyleSharedMessage _parserFnQueryLoveStyleSharedMessage(Map<String, dynamic> data) =>
    QueryLoveStyleSharedMessage.fromJson(data);
typedef OnQueryCompleteQueryLoveStyleSharedMessage = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryLoveStyleSharedMessage?,
);

class OptionsQueryLoveStyleSharedMessage extends graphql.QueryOptions<QueryLoveStyleSharedMessage> {
  OptionsQueryLoveStyleSharedMessage({
    String? operationName,
    required VariablesQueryLoveStyleSharedMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLoveStyleSharedMessage? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryLoveStyleSharedMessage? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFnQueryLoveStyleSharedMessage(data),
               ),
         onError: onError,
         document: documentNodeQueryLoveStyleSharedMessage,
         parserFn: _parserFnQueryLoveStyleSharedMessage,
       );

  final OnQueryCompleteQueryLoveStyleSharedMessage? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryLoveStyleSharedMessage
    extends graphql.WatchQueryOptions<QueryLoveStyleSharedMessage> {
  WatchOptionsQueryLoveStyleSharedMessage({
    String? operationName,
    required VariablesQueryLoveStyleSharedMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLoveStyleSharedMessage? typedOptimisticResult,
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
         document: documentNodeQueryLoveStyleSharedMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryLoveStyleSharedMessage,
       );
}

class FetchMoreOptionsQueryLoveStyleSharedMessage extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryLoveStyleSharedMessage({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryLoveStyleSharedMessage variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryLoveStyleSharedMessage,
       );
}

extension ClientExtensionQueryLoveStyleSharedMessage on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryLoveStyleSharedMessage>> queryLoveStyleSharedMessage(
    OptionsQueryLoveStyleSharedMessage options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryLoveStyleSharedMessage> watchQueryLoveStyleSharedMessage(
    WatchOptionsQueryLoveStyleSharedMessage options,
  ) => this.watchQuery(options);

  void writeQueryLoveStyleSharedMessage({
    required QueryLoveStyleSharedMessage data,
    required VariablesQueryLoveStyleSharedMessage variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryLoveStyleSharedMessage),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryLoveStyleSharedMessage? readQueryLoveStyleSharedMessage({
    required VariablesQueryLoveStyleSharedMessage variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryLoveStyleSharedMessage),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryLoveStyleSharedMessage.fromJson(result);
  }
}

class QueryLoveStyleSharedMessagepartnerMessagesByPk {
  QueryLoveStyleSharedMessagepartnerMessagesByPk({
    required this.id,
    this.$__typename = 'PartnerMessages',
  });

  factory QueryLoveStyleSharedMessagepartnerMessagesByPk.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryLoveStyleSharedMessagepartnerMessagesByPk(
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
    if (other is! QueryLoveStyleSharedMessagepartnerMessagesByPk ||
        runtimeType != other.runtimeType) {
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
