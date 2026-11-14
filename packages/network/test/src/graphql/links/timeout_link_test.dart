import 'dart:async';

import 'package:graphql/client.dart';
import 'package:network/src/graphql/links/timeout_link.dart';
import 'package:test/test.dart';

import '../../../helpers/link_helpers.dart';

void main() {
  Link build({
    required Link source,
    Duration query = const Duration(milliseconds: 40),
    Duration mutation = const Duration(milliseconds: 300),
  }) => Link.from([TimeoutLink(queryTimeout: query, mutationTimeout: mutation), source]);

  test('passes a response that arrives in time', () async {
    final link = build(source: terminating((_) => Stream.value(okResponse())));

    final response = await link.request(queryRequest()).first;

    expect(response.data, {'a': 1});
  });

  test('fails a query that gets no response in time', () async {
    final link = build(source: terminating((_) => StreamController<Response>().stream));

    expect(await failureOf(link.request(queryRequest())), isA<RequestTimeoutException>());
  });

  test('gives a mutation its own, longer limit', () async {
    final link = build(
      source: terminating(
        (_) => Future<Response>.delayed(const Duration(milliseconds: 100), okResponse).asStream(),
      ),
    );

    expect(await failureOf(link.request(queryRequest())), isA<RequestTimeoutException>());
    expect((await link.request(mutationRequest()).first).data, {'a': 1});
  });

  test('cancels the source and ignores a response that arrives late', () async {
    final errors = <Object>[];
    var isCancelled = false;
    late final StreamController<Response> source;

    await runZonedGuarded(() async {
      source = StreamController<Response>(onCancel: () => isCancelled = true);
      addTearDown(source.close);
      final link = build(source: terminating((_) => source.stream));

      expect(await failureOf(link.request(queryRequest())), isA<RequestTimeoutException>());
      if (!source.isClosed) source.add(okResponse());
      await Future<void>.delayed(const Duration(milliseconds: 60));
    }, (error, _) => errors.add(error));

    expect(isCancelled, isTrue);
    expect(errors, isEmpty);
  });

  test('passes a source error through unchanged', () async {
    final link = build(source: terminating((_) => Stream.error(httpError(500))));

    expect(await failureOf(link.request(queryRequest())), isA<HttpLinkServerException>());
  });
}
