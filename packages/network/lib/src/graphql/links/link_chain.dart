import 'dart:async';

import 'package:graphql/client.dart';
import 'package:network/src/graphql/links/auth_refresh_link.dart';
import 'package:network/src/graphql/links/retry_link.dart';
import 'package:network/src/graphql/links/timeout_link.dart';

/// Composes the links a request passes through, outermost first: identical queries in flight are
/// shared, a failed query is retried, each attempt gets a deadline, an expired session is renewed
/// once, and the token is attached just before the [terminatingLink] sends it.
Link buildGraphQLLink({
  required Link terminatingLink,
  FutureOr<String?> Function()? tokenCallback,
  Future<bool> Function()? refreshSession,
  Duration queryTimeout = const Duration(seconds: 10),
  Duration mutationTimeout = const Duration(seconds: 30),
  int maxQueryAttempts = 2,
  Duration retryDelay = const Duration(milliseconds: 400),
}) {
  final authLink = AuthLink(
    getToken: () async {
      final accessToken = await tokenCallback?.call();
      if (accessToken == null || accessToken.isEmpty) return null;
      return 'Bearer $accessToken';
    },
  );

  return Link.from([
    DedupeLink(shouldDedupe: (request) => request.isQuery),
    RetryLink(maxAttempts: maxQueryAttempts, baseDelay: retryDelay),
    TimeoutLink(queryTimeout: queryTimeout, mutationTimeout: mutationTimeout),
    if (refreshSession != null) AuthRefreshLink(refreshSession: refreshSession),
    authLink,
    terminatingLink,
  ]);
}
