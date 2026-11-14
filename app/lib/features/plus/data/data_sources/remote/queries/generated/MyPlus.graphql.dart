// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyPlus {
  QueryMyPlus({this.myPlus, this.$__typename = 'Query'});

  factory QueryMyPlus.fromJson(Map<String, dynamic> json) {
    final l$myPlus = json['myPlus'];
    final l$$__typename = json['__typename'];
    return QueryMyPlus(
      myPlus: l$myPlus == null
          ? null
          : QueryMyPlusmyPlus.fromJson((l$myPlus as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyPlusmyPlus? myPlus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myPlus = myPlus;
    _resultData['myPlus'] = l$myPlus?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myPlus = myPlus;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myPlus, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyPlus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myPlus = myPlus;
    final lOther$myPlus = other.myPlus;
    if (l$myPlus != lOther$myPlus) {
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

const documentNodeQueryMyPlus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyPlus'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myPlus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'hasPlus'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'paidByPartner'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'plan'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slipsLeftThisMonth'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardsLeftThisMonth'),
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
QueryMyPlus _parserFnQueryMyPlus(Map<String, dynamic> data) => QueryMyPlus.fromJson(data);
typedef OnQueryCompleteQueryMyPlus = FutureOr<void> Function(Map<String, dynamic>?, QueryMyPlus?);

class OptionsQueryMyPlus extends graphql.QueryOptions<QueryMyPlus> {
  OptionsQueryMyPlus({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyPlus? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyPlus? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'MyPlus',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyPlus(data)),
         onError: onError,
         document: documentNodeQueryMyPlus,
         parserFn: _parserFnQueryMyPlus,
       );

  final OnQueryCompleteQueryMyPlus? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyPlus extends graphql.WatchQueryOptions<QueryMyPlus> {
  WatchOptionsQueryMyPlus({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyPlus? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'MyPlus',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMyPlus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyPlus,
       );
}

class FetchMoreOptionsQueryMyPlus extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyPlus({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyPlus);
}

extension ClientExtensionQueryMyPlus on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyPlus>> queryMyPlus([OptionsQueryMyPlus? options]) async =>
      await this.query(options ?? OptionsQueryMyPlus());

  graphql.ObservableQuery<QueryMyPlus> watchQueryMyPlus([WatchOptionsQueryMyPlus? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryMyPlus());

  void writeQueryMyPlus({required QueryMyPlus data, bool broadcast = true}) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyPlus)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMyPlus? readQueryMyPlus({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyPlus)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyPlus.fromJson(result);
  }
}

class QueryMyPlusmyPlus {
  QueryMyPlusmyPlus({
    this.hasPlus,
    this.paidByPartner,
    this.plan,
    this.status,
    this.slipsLeftThisMonth,
    this.cardsLeftThisMonth,
    this.$__typename = 'PlusState',
  });

  factory QueryMyPlusmyPlus.fromJson(Map<String, dynamic> json) {
    final l$hasPlus = json['hasPlus'];
    final l$paidByPartner = json['paidByPartner'];
    final l$plan = json['plan'];
    final l$status = json['status'];
    final l$slipsLeftThisMonth = json['slipsLeftThisMonth'];
    final l$cardsLeftThisMonth = json['cardsLeftThisMonth'];
    final l$$__typename = json['__typename'];
    return QueryMyPlusmyPlus(
      hasPlus: (l$hasPlus as bool?),
      paidByPartner: (l$paidByPartner as bool?),
      plan: l$plan == null ? null : fromJsonEnumEntitlementPlan((l$plan as String)),
      status: l$status == null ? null : fromJsonEnumEntitlementStatus((l$status as String)),
      slipsLeftThisMonth: (l$slipsLeftThisMonth as int?),
      cardsLeftThisMonth: (l$cardsLeftThisMonth as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? hasPlus;

  final bool? paidByPartner;

  final EnumEntitlementPlan? plan;

  final EnumEntitlementStatus? status;

  final int? slipsLeftThisMonth;

  final int? cardsLeftThisMonth;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasPlus = hasPlus;
    _resultData['hasPlus'] = l$hasPlus;
    final l$paidByPartner = paidByPartner;
    _resultData['paidByPartner'] = l$paidByPartner;
    final l$plan = plan;
    _resultData['plan'] = l$plan == null ? null : toJsonEnumEntitlementPlan(l$plan);
    final l$status = status;
    _resultData['status'] = l$status == null ? null : toJsonEnumEntitlementStatus(l$status);
    final l$slipsLeftThisMonth = slipsLeftThisMonth;
    _resultData['slipsLeftThisMonth'] = l$slipsLeftThisMonth;
    final l$cardsLeftThisMonth = cardsLeftThisMonth;
    _resultData['cardsLeftThisMonth'] = l$cardsLeftThisMonth;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasPlus = hasPlus;
    final l$paidByPartner = paidByPartner;
    final l$plan = plan;
    final l$status = status;
    final l$slipsLeftThisMonth = slipsLeftThisMonth;
    final l$cardsLeftThisMonth = cardsLeftThisMonth;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasPlus,
      l$paidByPartner,
      l$plan,
      l$status,
      l$slipsLeftThisMonth,
      l$cardsLeftThisMonth,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyPlusmyPlus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasPlus = hasPlus;
    final lOther$hasPlus = other.hasPlus;
    if (l$hasPlus != lOther$hasPlus) {
      return false;
    }
    final l$paidByPartner = paidByPartner;
    final lOther$paidByPartner = other.paidByPartner;
    if (l$paidByPartner != lOther$paidByPartner) {
      return false;
    }
    final l$plan = plan;
    final lOther$plan = other.plan;
    if (l$plan != lOther$plan) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$slipsLeftThisMonth = slipsLeftThisMonth;
    final lOther$slipsLeftThisMonth = other.slipsLeftThisMonth;
    if (l$slipsLeftThisMonth != lOther$slipsLeftThisMonth) {
      return false;
    }
    final l$cardsLeftThisMonth = cardsLeftThisMonth;
    final lOther$cardsLeftThisMonth = other.cardsLeftThisMonth;
    if (l$cardsLeftThisMonth != lOther$cardsLeftThisMonth) {
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
