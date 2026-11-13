import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/services/support_app_version_service.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/cubit/support_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSupportRepository() extends Mock implements SupportRepository;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockSupportAppVersionService() extends Mock implements SupportAppVersionService;

void main() {
  late SupportRepository repository;
  late AuthenticationRepository authenticationRepository;
  late SupportAppVersionService appVersionService;
  late SupportCubit cubit;

  setUpAll(() => registerFallbackValue(SupportTopic.account));

  setUp(() {
    repository = _MockSupportRepository();
    authenticationRepository = _MockAuthenticationRepository();
    appVersionService = _MockSupportAppVersionService();
    cubit = SupportCubit(
      repository: repository,
      authenticationRepository: authenticationRepository,
      appVersionService: appVersionService,
    );
    when(() => authenticationRepository.currentUserId).thenReturn('profile-a');
    when(() => appVersionService.read()).thenAnswer((_) async => '0.1.1+3');
    when(
      () => repository.send(
        authorId: any(named: 'authorId'),
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    ).thenAnswer((_) async => SupportSendOutcome.sent);
  });

  test('starts on the account topic', () {
    expect(cubit.state.topic, SupportTopic.account);
  });

  test('a delivered message ends as sent', () async {
    cubit
      ..start(SupportTopic.bug)
      ..onMessageChanged('A tela travou')
      ..onReplyEmailChanged('eu@email.com');

    await cubit.send();

    expect(cubit.state.sendAction, const Success(SupportSendOutcome.sent));
    verify(
      () => repository.send(
        authorId: 'profile-a',
        topic: SupportTopic.bug,
        message: 'A tela travou',
        replyEmail: 'eu@email.com',
        appVersion: '0.1.1+3',
      ),
    ).called(1);
  });

  test('a queued message ends as queued', () async {
    when(
      () => repository.send(
        authorId: any(named: 'authorId'),
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    ).thenAnswer((_) async => SupportSendOutcome.queued);
    cubit.onMessageChanged('A tela travou');

    await cubit.send();

    expect(cubit.state.sendAction, const Success(SupportSendOutcome.queued));
  });

  test('a failure keeps the typed text and the chosen topic', () async {
    when(
      () => repository.send(
        authorId: any(named: 'authorId'),
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'RATE_LIMITED'));
    cubit
      ..start(SupportTopic.billing)
      ..onMessageChanged('Cobrança');

    await cubit.send();

    expect(cubit.state.sendAction, const Initial());
    expect(cubit.state.message.value, 'Cobrança');
    expect(cubit.state.topic, SupportTopic.billing);
  });

  test('a signed-out person cannot send and keeps the text', () async {
    when(() => authenticationRepository.currentUserId).thenReturn(null);
    cubit.onMessageChanged('Oi');

    await cubit.send();

    expect(cubit.state.sendAction, const Initial());
    expect(cubit.state.message.value, 'Oi');
    verifyNever(
      () => repository.send(
        authorId: any(named: 'authorId'),
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    );
  });

  test('cannot send an empty or over-long message', () async {
    await cubit.send();
    cubit.onMessageChanged('a' * (supportMessageMaxLength + 1));
    await cubit.send();

    verifyNever(
      () => repository.send(
        authorId: any(named: 'authorId'),
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    );
  });

  test('counts message length in code points, like the server', () async {
    cubit.onMessageChanged('😀' * (supportMessageMaxLength + 1));

    await cubit.send();
    expect(cubit.state.message.errorName, 'tooLong');

    cubit.onMessageChanged('😀' * supportMessageMaxLength);

    expect(cubit.state.message.isValid, isTrue);
  });

  test('rejects an invalid or over-long reply email', () async {
    cubit
      ..onMessageChanged('Oi')
      ..onReplyEmailChanged('sem-arroba');

    await cubit.send();
    expect(cubit.state.replyEmail.errorName, 'invalid');

    final longEmail = '${'a' * 250}@x.io';
    expect(longEmail.length, greaterThan(supportReplyEmailMaxLength));
    cubit.onReplyEmailChanged(longEmail);
    await cubit.send();

    expect(cubit.state.replyEmail.errorName, 'tooLong');
    verifyNever(
      () => repository.send(
        authorId: any(named: 'authorId'),
        topic: any(named: 'topic'),
        message: any(named: 'message'),
        replyEmail: any(named: 'replyEmail'),
        appVersion: any(named: 'appVersion'),
      ),
    );
  });
}
