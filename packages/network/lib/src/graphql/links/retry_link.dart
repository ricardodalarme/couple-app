import 'dart:async';
import 'dart:math';

import 'package:graphql/client.dart';
import 'package:network/src/graphql/links/timeout_link.dart';

/// Runs a query again after a transient failure, waiting longer each time.
///
/// A rate limited request waits for the `Retry-After` the server asked for, up to [maxDelay].
///
/// Only queries are retried. A mutation that timed out may already be committed, and repeating it
/// would turn a success into an error, so its failure is left for the person to retry.
class RetryLink({
  final int maxAttempts = 2,
  final Duration baseDelay = const Duration(milliseconds: 400),
  final Duration maxDelay = const Duration(seconds: 5),
  final Random? random,
  final Future<void> Function(Duration duration) wait = _wait,
}) extends Link {
  static final Random _shared = Random();

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    if (!request.isQuery) {
      yield* forward!(request);
      return;
    }

    for (var attempt = 1; ; attempt++) {
      var hasResponse = false;
      Object failure;
      try {
        await for (final response in forward!(request)) {
          hasResponse = true;
          yield response;
        }

        return;
      } on Object catch (error) {
        if (hasResponse || attempt >= maxAttempts || !_isTransientFailure(error)) rethrow;
        failure = error;
      }
      await wait(_delay(failure, attempt));
    }
  }

  Duration _delay(Object failure, int attempt) {
    final delay = _retryAfter(failure) ?? _backoff(attempt);

    return delay > maxDelay ? maxDelay : delay;
  }

  Duration? _retryAfter(Object failure) {
    if (failure is! HttpLinkServerException || failure.statusCode != 429) return null;
    final seconds = int.tryParse(failure.response.headers['retry-after'] ?? '');

    return seconds == null ? null : Duration(seconds: seconds);
  }

  Duration _backoff(int attempt) {
    final jitter = 1 + (random ?? _shared).nextDouble() * 0.25;

    return baseDelay * (1 << (attempt - 1)) * jitter;
  }
}

/// Whether [error] says nothing about the request itself: it never reached the server, got no answer
/// in time, was rate limited, or hit a server or gateway that failed.
bool _isTransientFailure(Object error) => switch (error) {
  RequestTimeoutException() => true,
  HttpLinkServerException(:final statusCode) => statusCode == 429 || (statusCode ?? 0) >= 500,
  ServerException(parsedResponse: null, statusCode: null) => true,
  _ => false,
};

Future<void> _wait(Duration duration) => Future<void>.delayed(duration);
