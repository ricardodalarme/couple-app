import 'package:graphql/client.dart';
import 'package:graphql_query_compress/graphql_query_compress.dart';

class GQLClient {
  factory GQLClient({
    required String serverUrl,
    String? Function()? tokenCallback,
    Map<String, String> defaultHeaders = const {},
  }) {
    final httpLink = HttpLink(
      serverUrl,
      defaultHeaders: defaultHeaders,
      serializer: const RequestSerializerWithCompressor(),
    );

    final authLink = AuthLink(
      getToken: () {
        final accessToken = tokenCallback?.call();
        if (accessToken == null || accessToken.isEmpty) return null;
        return 'Bearer $accessToken';
      },
    );
    final link = Link.from([authLink, httpLink]);

    return GQLClient._(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
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

  const GQLClient._(this._client);

  final GraphQLClient _client;

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
