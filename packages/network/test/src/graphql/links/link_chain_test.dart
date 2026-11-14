import 'dart:async';

import 'package:graphql/client.dart';
import 'package:network/src/graphql/links/link_chain.dart';
import 'package:network/src/graphql/links/timeout_link.dart';
import 'package:test/test.dart';

import '../../../helpers/link_helpers.dart';

void main() {
  late List<Request> sent;

  setUp(() => sent = []);

  Link build({
    required Stream<Response> Function(int call) handler,
    FutureOr<String?> Function()? tokenCallback,
    Future<bool> Function()? refreshSession,
    Duration queryTimeout = const Duration(milliseconds: 60),
    Duration mutationTimeout = const Duration(milliseconds: 200),
  }) => buildGraphQLLink(
    terminatingLink: terminating((request) {
      sent.add(request);

      return handler(sent.length);
    }),
    tokenCallback: tokenCallback,
    refreshSession: refreshSession,
    queryTimeout: queryTimeout,
    mutationTimeout: mutationTimeout,
    retryDelay: Duration.zero,
  );

  Stream<Response> slow(Duration delay) => Future<Response>.delayed(delay, okResponse).asStream();

  String? authorization(Request request) =>
      request.context.entry<HttpLinkHeaders>()?.headers['Authorization'];

  group('dedupe', () {
    test('shares one request between identical queries in flight, even with a token', () async {
      final link = build(
        handler: (_) => slow(const Duration(milliseconds: 20)),
        tokenCallback: () => 'abc',
      );

      await Future.wait([link.request(queryRequest()).first, link.request(queryRequest()).first]);

      expect(sent, hasLength(1));
    });

    test('keeps queries with different variables apart', () async {
      final link = build(handler: (_) => slow(const Duration(milliseconds: 20)));

      await Future.wait([
        link.request(queryRequest({'id': 1})).first,
        link.request(queryRequest({'id': 2})).first,
      ]);

      expect(sent, hasLength(2));
    });

    test('never merges mutations, even identical ones', () async {
      final link = build(handler: (_) => slow(const Duration(milliseconds: 20)));

      await Future.wait([
        link.request(mutationRequest()).first,
        link.request(mutationRequest()).first,
      ]);

      expect(sent, hasLength(2));
    });
  });

  test('a reload after the first request finished goes to the network again', () async {
    final link = build(handler: (_) => Stream.value(okResponse()));

    await link.request(queryRequest()).first;
    await link.request(queryRequest()).first;

    expect(sent, hasLength(2));
  });

  group('auth', () {
    test('waits for an asynchronous token', () async {
      final link = build(
        handler: (_) => Stream.value(okResponse()),
        tokenCallback: () async {
          await Future<void>.delayed(const Duration(milliseconds: 10));

          return 'late';
        },
      );

      await link.request(queryRequest()).first;

      expect(authorization(sent.single), 'Bearer late');
    });

    test('attaches the bearer token to every request', () async {
      final link = build(handler: (_) => Stream.value(okResponse()), tokenCallback: () => 'abc');

      await link.request(queryRequest()).first;

      expect(authorization(sent.single), 'Bearer abc');
    });

    test('sends no authorization header without a token', () async {
      final link = build(handler: (_) => Stream.value(okResponse()), tokenCallback: () => '');

      await link.request(queryRequest()).first;

      expect(authorization(sent.single), isNull);
    });

    test('the request sent again after a 401 carries the renewed token', () async {
      var token = 'old';
      final link = build(
        handler: (call) => call == 1 ? Stream.error(httpError(401)) : Stream.value(okResponse()),
        tokenCallback: () => token,
        refreshSession: () async {
          token = 'new';
          return true;
        },
      );

      await link.request(queryRequest()).first;

      expect(sent.map(authorization), ['Bearer old', 'Bearer new']);
    });
  });

  group('timeout and retry', () {
    test('retries a query that got no answer in time', () async {
      final link = build(
        handler: (call) =>
            call == 1 ? StreamController<Response>().stream : Stream.value(okResponse()),
      );

      await link.request(queryRequest()).first;

      expect(sent, hasLength(2));
    });

    test('gives up on a query that keeps timing out', () async {
      final link = build(handler: (_) => StreamController<Response>().stream);

      expect(await failureOf(link.request(queryRequest())), isA<RequestTimeoutException>());
      expect(sent, hasLength(2));
    });

    test('lets a mutation run longer than a query and does not retry it', () async {
      final link = build(handler: (_) => slow(const Duration(milliseconds: 120)));

      await link.request(mutationRequest()).first;

      expect(sent, hasLength(1));
    });

    test('fails a mutation that outlasts its limit without a second attempt', () async {
      final link = build(
        handler: (_) => StreamController<Response>().stream,
        mutationTimeout: const Duration(milliseconds: 40),
      );

      expect(await failureOf(link.request(mutationRequest())), isA<RequestTimeoutException>());
      expect(sent, hasLength(1));
    });
  });
}
