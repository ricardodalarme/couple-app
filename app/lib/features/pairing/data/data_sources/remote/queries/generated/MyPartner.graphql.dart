// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyPartner {
  QueryMyPartner({this.myPartner, this.$__typename = 'Query'});

  factory QueryMyPartner.fromJson(Map<String, dynamic> json) {
    final l$myPartner = json['myPartner'];
    final l$$__typename = json['__typename'];
    return QueryMyPartner(
      myPartner: l$myPartner == null
          ? null
          : QueryMyPartnermyPartner.fromJson((l$myPartner as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyPartnermyPartner? myPartner;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myPartner = myPartner;
    _resultData['myPartner'] = l$myPartner?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myPartner = myPartner;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myPartner, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyPartner || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myPartner = myPartner;
    final lOther$myPartner = other.myPartner;
    if (l$myPartner != lOther$myPartner) {
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

const documentNodeQueryMyPartner = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyPartner'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myPartner'),
            alias: null,
            arguments: [],
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
                  name: NameNode(value: 'displayName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'avatarPath'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'avatarKind'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'city'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'pronouns'),
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
QueryMyPartner _parserFnQueryMyPartner(Map<String, dynamic> data) => QueryMyPartner.fromJson(data);
typedef OnQueryCompleteQueryMyPartner = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyPartner?,
);

class OptionsQueryMyPartner extends graphql.QueryOptions<QueryMyPartner> {
  OptionsQueryMyPartner({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyPartner? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyPartner? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyPartner(data)),
         onError: onError,
         document: documentNodeQueryMyPartner,
         parserFn: _parserFnQueryMyPartner,
       );

  final OnQueryCompleteQueryMyPartner? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyPartner extends graphql.WatchQueryOptions<QueryMyPartner> {
  WatchOptionsQueryMyPartner({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyPartner? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMyPartner,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyPartner,
       );
}

class FetchMoreOptionsQueryMyPartner extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyPartner({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyPartner);
}

extension ClientExtensionQueryMyPartner on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyPartner>> queryMyPartner([
    OptionsQueryMyPartner? options,
  ]) async => await this.query(options ?? OptionsQueryMyPartner());

  graphql.ObservableQuery<QueryMyPartner> watchQueryMyPartner([
    WatchOptionsQueryMyPartner? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMyPartner());

  void writeQueryMyPartner({required QueryMyPartner data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyPartner)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMyPartner? readQueryMyPartner({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyPartner)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyPartner.fromJson(result);
  }
}

class QueryMyPartnermyPartner {
  QueryMyPartnermyPartner({
    required this.id,
    this.displayName,
    this.avatarPath,
    required this.avatarKind,
    this.city,
    this.pronouns,
    this.$__typename = 'Profiles',
  });

  factory QueryMyPartnermyPartner.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$displayName = json['displayName'];
    final l$avatarPath = json['avatarPath'];
    final l$avatarKind = json['avatarKind'];
    final l$city = json['city'];
    final l$pronouns = json['pronouns'];
    final l$$__typename = json['__typename'];
    return QueryMyPartnermyPartner(
      id: (l$id as String),
      displayName: (l$displayName as String?),
      avatarPath: (l$avatarPath as String?),
      avatarKind: fromJsonEnumAvatarKind((l$avatarKind as String)),
      city: (l$city as String?),
      pronouns: (l$pronouns as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? displayName;

  final String? avatarPath;

  final EnumAvatarKind avatarKind;

  final String? city;

  final String? pronouns;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$avatarPath = avatarPath;
    _resultData['avatarPath'] = l$avatarPath;
    final l$avatarKind = avatarKind;
    _resultData['avatarKind'] = toJsonEnumAvatarKind(l$avatarKind);
    final l$city = city;
    _resultData['city'] = l$city;
    final l$pronouns = pronouns;
    _resultData['pronouns'] = l$pronouns;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$displayName = displayName;
    final l$avatarPath = avatarPath;
    final l$avatarKind = avatarKind;
    final l$city = city;
    final l$pronouns = pronouns;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$displayName,
      l$avatarPath,
      l$avatarKind,
      l$city,
      l$pronouns,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyPartnermyPartner || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$avatarPath = avatarPath;
    final lOther$avatarPath = other.avatarPath;
    if (l$avatarPath != lOther$avatarPath) {
      return false;
    }
    final l$avatarKind = avatarKind;
    final lOther$avatarKind = other.avatarKind;
    if (l$avatarKind != lOther$avatarKind) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$pronouns = pronouns;
    final lOther$pronouns = other.pronouns;
    if (l$pronouns != lOther$pronouns) {
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
