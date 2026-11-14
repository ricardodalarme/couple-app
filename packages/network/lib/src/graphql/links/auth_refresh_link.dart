import 'dart:async';

import 'package:graphql/client.dart';

/// Renews the session once when the server answers 401, then sends the request again.
///
/// Place it outside the `AuthLink`, so the repeated request reads the new token. Requests that fail
/// at the same time share one renewal. When the renewal fails, or the repeated request is rejected
/// again, the error is returned to the caller.
class AuthRefreshLink({required final Future<bool> Function() refreshSession}) extends Link {
  Future<bool>? _refreshing;

  late final ErrorLink _errorLink = ErrorLink(onException: _onException);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) =>
      _errorLink.request(request, forward);

  Stream<Response>? _onException(Request request, NextLink forward, LinkException exception) =>
      exception is HttpLinkServerException && exception.statusCode == 401
      ? _retry(request, forward, exception)
      : null;

  Future<bool> _refresh() => _refreshing ??= _renew().whenComplete(() => _refreshing = null);

  Future<bool> _renew() async {
    try {
      return await refreshSession();
    } on Object {
      return false;
    }
  }

  Stream<Response> _retry(Request request, NextLink forward, LinkException exception) async* {
    if (!await _refresh()) throw exception;

    yield* forward(request);
  }
}
