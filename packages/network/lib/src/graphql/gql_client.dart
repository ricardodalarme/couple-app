import 'dart:async';

import 'package:graphql/client.dart';
import 'package:graphql_query_compress/graphql_query_compress.dart';
import 'package:network/src/graphql/links/link_chain.dart';

class const GQLClient._(final GraphQLClient _client) {
  factory({
    required String serverUrl,
    FutureOr<String?> Function()? tokenCallback,
    Future<bool> Function()? refreshSession,
    Map<String, String> defaultHeaders = const {},
    Duration queryTimeout = const Duration(seconds: 10),
    Duration mutationTimeout = const Duration(seconds: 30),
  }) {
    final link = buildGraphQLLink(
      terminatingLink: HttpLink(
        serverUrl,
        defaultHeaders: defaultHeaders,
        serializer: const RequestSerializerWithCompressor(),
      ),
      tokenCallback: tokenCallback,
      refreshSession: refreshSession,
      queryTimeout: queryTimeout,
      mutationTimeout: mutationTimeout,
    );

    return GQLClient._(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
        // TimeoutLink owns the deadlines; the client's own timer completes a request twice.
        queryRequestTimeout: null,
        defaultPolicies: DefaultPolicies(
          query: Policies.safe(
            FetchPolicy.cacheAndNetwork,
            ErrorPolicy.none,
            CacheRereadPolicy.mergeOptimistic,
          ),
        ),
      ),
    );
  }

  Future<QueryResult<T>> query<T>(QueryOptions<T> options) {
    return _client.query(options);
  }

  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) {
    return _client.mutate(options);
  }

  ObservableQuery<T> watchQuery<T>(WatchQueryOptions<T> options) {
    return _client.watchQuery(options);
  }
}
