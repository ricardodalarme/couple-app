import 'package:core/core.dart';
import 'package:graphql/client.dart';
import 'package:graphql_query_compress/graphql_query_compress.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

abstract interface class GQLClient {
  Future<QueryResult<T>> query<T>(QueryOptions<T> options);
  ObservableQuery<T> watchQuery<T>(WatchQueryOptions<T> options);
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options);
}

class GQLClientImpl implements GQLClient {
  factory GQLClientImpl({
    required SecureStorageService storage,
  }) {
    final httpLink = HttpLink(
      Config.serverUrl,
      serializer: const RequestSerializerWithCompressor(),
    );
    final authLink = AuthLink(
      getToken: () async {
        final token = await storage.read(key: StorageKeys.accessToken);
        if (token == null) return null;
        return 'Bearer $token';
      },
    );
    final link = Link.from([authLink, httpLink]);

    return GQLClientImpl._(
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

  const GQLClientImpl._(this._client);

  final GraphQLClient _client;

  @override
  Future<QueryResult<T>> query<T>(QueryOptions<T> options) {
    return _client.query(options);
  }

  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) {
    return _client.mutate(options);
  }

  @override
  ObservableQuery<T> watchQuery<T>(WatchQueryOptions<T> options) {
    return _client.watchQuery(options);
  }
}
