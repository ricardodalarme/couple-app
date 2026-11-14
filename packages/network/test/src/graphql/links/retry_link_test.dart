import 'dart:async';

import 'package:graphql/client.dart';
import 'package:network/src/graphql/links/retry_link.dart';
import 'package:network/src/graphql/links/timeout_link.dart';
import 'package:test/test.dart';

import '../../../helpers/link_helpers.dart';

void main() {
  late List<Duration> waits;
  late int calls;

  setUp(() {
    waits = [];
    calls = 0;
  });

  Link build(Stream<Response> Function(int call) handler, {int maxAttempts = 3}) => Link.from([
    RetryLink(
      maxAttempts: maxAttempts,
      baseDelay: const Duration(milliseconds: 100),
      random: NoJitter(),
      wait: (duration) async => waits.add(duration),
    ),
    terminating((_) => handler(++calls)),
  ]);

  test('retries a query after a transient failure and returns the later response', () async {
    final link = build(
      (call) => call < 3 ? Stream.error(transportError()) : Stream.value(okResponse()),
    );

    final response = await link.request(queryRequest()).first;

    expect(response.data, {'a': 1});
    expect(calls, 3);
  });

  test('waits twice as long before each new attempt', () async {
    final link = build(
      (call) => call < 3 ? Stream.error(httpError(503)) : Stream.value(okResponse()),
    );

    await link.request(queryRequest()).first;

    expect(waits, [const Duration(milliseconds: 100), const Duration(milliseconds: 200)]);
  });

  test('gives up after the last attempt and returns the failure', () async {
    final link = build((_) => Stream.error(httpError(504)), maxAttempts: 2);

    expect(await failureOf(link.request(queryRequest())), isA<HttpLinkServerException>());
    expect(calls, 2);
  });

  test('retries a request that timed out', () async {
    final link = build(
      (call) => call == 1
          ? Stream.error(const RequestTimeoutException(Duration(seconds: 1)))
          : Stream.value(okResponse()),
    );

    await link.request(queryRequest()).first;

    expect(calls, 2);
  });

  for (final status in [400, 401, 403, 404]) {
    test('does not retry an answer with status $status', () async {
      final link = build((_) => Stream.error(httpError(status)));

      await failureOf(link.request(queryRequest()));

      expect(calls, 1);
    });
  }

  for (final status in [429, 500, 502, 503, 504, 522]) {
    test('retries an answer with status $status', () async {
      final link = build(
        (call) => call == 1 ? Stream.error(httpError(status)) : Stream.value(okResponse()),
      );

      await link.request(queryRequest()).first;

      expect(calls, 2);
    });
  }

  test('waits for the Retry-After of a rate limited request', () async {
    final link = build(
      (call) => call == 1
          ? Stream.error(httpError(429, headers: {'retry-after': '3'}))
          : Stream.value(okResponse()),
    );

    await link.request(queryRequest()).first;

    expect(waits, [const Duration(seconds: 3)]);
  });

  test('never waits longer than the maximum delay', () async {
    final link = build(
      (call) => call == 1
          ? Stream.error(httpError(429, headers: {'retry-after': '60'}))
          : Stream.value(okResponse()),
    );

    await link.request(queryRequest()).first;

    expect(waits, [const Duration(seconds: 5)]);
  });

  test('does not retry a response that carries GraphQL errors', () async {
    final link = build(
      (_) => Stream.value(
        const Response(
          errors: [GraphQLError(message: 'NOT_PAIRED')],
          response: {},
        ),
      ),
    );

    final response = await link.request(queryRequest()).first;

    expect(response.errors, isNotEmpty);
    expect(calls, 1);
  });

  test('never retries a mutation', () async {
    final link = build((_) => Stream.error(transportError()));

    expect(await failureOf(link.request(mutationRequest())), isA<ServerException>());
    expect(calls, 1);
  });

  test('does not retry once a response was delivered', () async {
    final link = build((_) async* {
      yield okResponse();
      throw transportError();
    });

    final events = <Object>[];
    await link
        .request(queryRequest())
        .map<Object>((r) => r)
        .handleError(events.add)
        .forEach(events.add);

    expect(calls, 1);
    expect(events.whereType<Response>(), hasLength(1));
  });
}
