import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/support_data_source.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/support_local_data_source.dart';
import 'package:flutter_bloc_starter/features/help/data/models/pending_support_request.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class _MockSupportDataSource() extends Mock implements SupportDataSource;

class _MockSupportLocalDataSource() extends Mock implements SupportLocalDataSource;

class _MockPreferencesService() extends Mock implements PreferencesService;

void main() {
  late SupportDataSource remote;
  late SupportLocalDataSource local;
  late SupportRepository repository;

  PendingSupportRequest pending(String id, {String authorId = 'a', String message = 'Mensagem'}) =>
      PendingSupportRequest(
        id: id,
        authorId: authorId,
        topic: SupportTopic.billing,
        message: message,
        createdAt: DateTime.utc(2026, 11, 10),
      );

  setUpAll(() => registerFallbackValue(<PendingSupportRequest>[]));

  setUp(() {
    remote = _MockSupportDataSource();
    local = _MockSupportLocalDataSource();
    repository = SupportRepository(dataSource: remote, localDataSource: local);
    when(() => local.readPending()).thenReturn(const []);
    when(() => local.writePending(any())).thenAnswer((_) async {});
    when(() => local.readDiscarded()).thenReturn(false);
    when(() => local.writeDiscarded(value: any(named: 'value'))).thenAnswer((_) async {});
    when(
      () => remote.createSupportRequest(
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    ).thenAnswer((_) async {});
  });

  group('send', () {
    test('sends the request and reports it was delivered', () async {
      final outcome = await repository.send(
        authorId: 'a',
        topic: SupportTopic.account,
        message: 'Não consigo entrar',
        replyEmail: 'eu@email.com',
        appVersion: '0.1.1+3',
      );

      expect(outcome, SupportSendOutcome.sent);
      verify(
        () => remote.createSupportRequest(
          topic: 'account',
          message: 'Não consigo entrar',
          replyEmail: 'eu@email.com',
          appVersion: '0.1.1+3',
        ),
      ).called(1);
      verifyNever(() => local.writePending(any()));
    });

    test('keeps the request with its author when offline', () async {
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));

      final outcome = await repository.send(
        authorId: 'a',
        topic: SupportTopic.bug,
        message: 'A tela travou',
      );

      expect(outcome, SupportSendOutcome.queued);
      final saved = verify(() => local.writePending(captureAny())).captured.single;
      final request = (saved as List<PendingSupportRequest>).single;
      expect(request.authorId, 'a');
      expect(request.topic, SupportTopic.bug);
      expect(request.message, 'A tela travou');
    });

    test('rethrows the rate limit instead of queueing it', () {
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: 'RATE_LIMITED'));

      expect(
        () => repository.send(authorId: 'a', topic: SupportTopic.other, message: 'x'),
        throwsA(
          isA<LocalizedException>().having((error) => error.l10nKey, 'l10nKey', 'RATE_LIMITED'),
        ),
      );
      verifyNever(() => local.writePending(any()));
    });

    test('rethrows a permanent rejection instead of queueing it', () {
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: 'INVALID_MESSAGE'));

      expect(
        () => repository.send(authorId: 'a', topic: SupportTopic.other, message: 'x'),
        throwsA(isA<LocalizedException>()),
      );
      verifyNever(() => local.writePending(any()));
    });
  });

  group('pendingCount', () {
    test('counts only the requests of the signed-in profile', () {
      when(() => local.readPending())
          .thenReturn([pending('a1'), pending('b1', authorId: 'b'), pending('a2')]);

      expect(repository.pendingCount(authorId: 'a'), 2);
      expect(repository.pendingCount(authorId: 'b'), 1);
      expect(repository.pendingCount(authorId: 'c'), 0);
    });
  });

  group('flushPending', () {
    test('sends only the current profile and leaves the other queue alone', () async {
      var queue = <PendingSupportRequest>[
        pending('a1', message: 'Do A'),
        pending('b1', authorId: 'b', message: 'Do B'),
      ];
      when(() => local.readPending()).thenAnswer((_) => List.of(queue));
      when(() => local.writePending(any())).thenAnswer((invocation) async {
        queue = List.of(invocation.positionalArguments.single as List<PendingSupportRequest>);
      });

      final dropped = await repository.flushPending(authorId: 'a');

      expect(dropped, 0);
      expect(queue.map((request) => request.message), ['Do B']);
      verify(
        () => remote.createSupportRequest(
          topic: 'billing',
          message: 'Do A',
          replyEmail: null,
          appVersion: null,
        ),
      ).called(1);
      verifyNever(
        () => remote.createSupportRequest(
          topic: 'billing',
          message: 'Do B',
          replyEmail: null,
          appVersion: null,
        ),
      );
    });

    test('drops a permanently rejected request and sends the rest', () async {
      var queue = <PendingSupportRequest>[
        pending('poison', message: 'poison'),
        pending('good', message: 'good'),
      ];
      when(() => local.readPending()).thenAnswer((_) => List.of(queue));
      when(() => local.writePending(any())).thenAnswer((invocation) async {
        queue = List.of(invocation.positionalArguments.single as List<PendingSupportRequest>);
      });
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: 'poison',
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: 'INVALID_MESSAGE'));

      final dropped = await repository.flushPending(authorId: 'a');

      expect(dropped, 1);
      expect(queue, isEmpty);
      verify(() => local.writeDiscarded(value: true)).called(1);
      verify(
        () => remote.createSupportRequest(
          topic: 'billing',
          message: 'good',
          replyEmail: null,
          appVersion: null,
        ),
      ).called(1);
    });

    test('keeps everything when the connection is still down', () async {
      final waiting = [pending('a1'), pending('a2')];
      when(() => local.readPending()).thenReturn(waiting);
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));

      final dropped = await repository.flushPending(authorId: 'a');

      expect(dropped, 0);
      verifyNever(() => local.writePending(any()));
      verify(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).called(1);
    });

    test('stops on the daily rate limit and keeps the rest', () async {
      final waiting = [pending('a1'), pending('a2')];
      when(() => local.readPending()).thenReturn(waiting);
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: 'RATE_LIMITED'));

      final dropped = await repository.flushPending(authorId: 'a');

      expect(dropped, 0);
      verifyNever(() => local.writePending(any()));
    });
  });

  test('clearPending removes every profile queue', () async {
    await repository.clearPending();

    verify(() => local.writePending(const [])).called(1);
    verify(() => local.writeDiscarded(value: false)).called(1);
  });

  group('corrupt queue', () {
    late PreferencesService preferences;

    setUp(() {
      preferences = _MockPreferencesService();
      when(() => preferences.readString(key: any(named: 'key'))).thenReturn('{not json');
      when(
        () => preferences.writeString(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});
      repository = SupportRepository(
        dataSource: remote,
        localDataSource: SupportLocalDataSource(preferencesService: preferences),
      );
    });

    test('still queues a new request', () async {
      when(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      ).thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));

      final outcome = await repository.send(
        authorId: 'a',
        topic: SupportTopic.bug,
        message: 'A tela travou',
      );

      expect(outcome, SupportSendOutcome.queued);
      verify(
        () => preferences.writeString(
          key: 'pendingSupportRequests',
          value: any(named: 'value'),
        ),
      ).called(1);
    });

    test('still flushes without throwing', () async {
      final dropped = await repository.flushPending(authorId: 'a');

      expect(dropped, 0);
      verifyNever(
        () => remote.createSupportRequest(
          topic: any(named: 'topic'),
          message: any(named: 'message'),
          replyEmail: any(named: 'replyEmail'),
          appVersion: any(named: 'appVersion'),
        ),
      );
    });
  });
}
