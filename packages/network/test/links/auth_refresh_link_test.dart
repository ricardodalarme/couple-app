import 'dart:async';

import 'package:graphql/client.dart';
import 'package:network/src/graphql/links/auth_refresh_link.dart';
import 'package:test/test.dart';

import 'support.dart';

void main() {
  late int sent;
  late int refreshes;

  setUp(() {
    sent = 0;
    refreshes = 0;
  });

  Link build({
    required Stream<Response> Function(int call) handler,
    Future<bool> Function()? refresh,
  }) => Link.from([
    AuthRefreshLink(
      refreshSession:
          refresh ??
          () async {
            refreshes++;
            return true;
          },
    ),
    terminating((_) => handler(++sent)),
  ]);

  test('renews the session on a 401 and sends the request again', () async {
    final link = build(
      handler: (call) => call == 1 ? Stream.error(httpError(401)) : Stream.value(okResponse()),
    );

    final response = await link.request(queryRequest()).first;

    expect(response.data, {'a': 1});
    expect(refreshes, 1);
    expect(sent, 2);
  });

  test('also repeats a mutation, since a 401 means it never ran', () async {
    final link = build(
      handler: (call) => call == 1 ? Stream.error(httpError(401)) : Stream.value(okResponse()),
    );

    await link.request(mutationRequest()).first;

    expect(sent, 2);
  });

  test('shares one renewal between requests that fail together', () async {
    final gate = Completer<bool>();
    final link = build(
      handler: (call) => call <= 2 ? Stream.error(httpError(401)) : Stream.value(okResponse()),
      refresh: () {
        refreshes++;
        return gate.future;
      },
    );

    final first = link.request(queryRequest({'n': 1})).first;
    final second = link.request(queryRequest({'n': 2})).first;
    await Future<void>.delayed(Duration.zero);
    gate.complete(true);
    await Future.wait([first, second]);

    expect(refreshes, 1);
  });

  test('returns the 401 when the renewal fails', () async {
    final link = build(handler: (_) => Stream.error(httpError(401)), refresh: () async => false);

    expect(await failureOf(link.request(queryRequest())), isA<HttpLinkServerException>());
    expect(sent, 1);
  });

  test('returns the 401 when the renewal throws', () async {
    final link = build(
      handler: (_) => Stream.error(httpError(401)),
      refresh: () async => throw StateError('offline'),
    );

    expect(await failureOf(link.request(queryRequest())), isA<HttpLinkServerException>());
  });

  test('does not loop when the repeated request is rejected again', () async {
    final link = build(handler: (_) => Stream.error(httpError(401)));

    final error = await failureOf(link.request(queryRequest()));

    expect((error! as HttpLinkServerException).statusCode, 401);
    expect(sent, 2);
    expect(refreshes, 1);
  });

  test('leaves other failures alone', () async {
    final link = build(handler: (_) => Stream.error(httpError(500)));

    await failureOf(link.request(queryRequest()));

    expect(refreshes, 0);
    expect(sent, 1);
  });
}
