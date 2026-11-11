import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatRepository() extends Mock implements ChatRepository;

void main() {
  late ChatRepository repository;

  setUpAll(() => registerFallbackValue(ChatMode.free));

  setUp(() {
    repository = _MockChatRepository();
    when(repository.getStatus).thenAnswer((_) async => (messagesLeft: 5, isEnabled: true));
    when(repository.enable).thenAnswer((_) async {});
    when(() => repository.saveAsSlip(any())).thenAnswer((_) async {});
  });

  void stubReply(Stream<ChatEvent> Function() events) {
    when(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
      ),
    ).thenAnswer((_) => events());
  }

  ChatCubit build() => ChatCubit(chatRepository: repository);

  test('without the consent the chat asks first and sends nothing', () async {
    when(repository.getStatus).thenAnswer((_) async => (messagesLeft: 5, isEnabled: false));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.stage, const Success(ChatStage.needsConsent));
  });

  test('turning it on reads the status again', () async {
    final cubit = build();

    await cubit.enable();

    verify(repository.enable).called(1);
    expect(cubit.state.stage, const Success(ChatStage.ready));
  });

  test('no messages left shows the limit', () async {
    when(repository.getStatus).thenAnswer((_) async => (messagesLeft: 0, isEnabled: true));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.stage, const Success(ChatStage.limitReached));
  });

  test('the reply streams in, then offers the options', () async {
    stubReply(
      () => Stream.fromIterable([
        const ChatDelta('Oi, '),
        const ChatDelta('estou aqui.'),
        const ChatDone(['Estou cansada', 'Quero desabafar']),
      ]),
    );
    final cubit = build();
    await cubit.load();

    await cubit.send('Oi');

    expect(cubit.state.messages.last.text, 'Oi, estou aqui.');
    expect(cubit.state.messages.last.isStreaming, isFalse);
    expect(cubit.state.options, ['Estou cansada', 'Quero desabafar']);
    expect(cubit.state.messagesLeft, 4);
    expect(cubit.state.isReplying, isFalse);
  });

  test('crisis wording is answered on the device and never sent', () async {
    final cubit = build();
    await cubit.load();

    await cubit.send('às vezes penso em me matar');

    expect(cubit.state.messages.last.isCrisis, isTrue);
    verifyNever(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
      ),
    );
  });

  test('a stream that breaks keeps what arrived and offers a retry', () async {
    stubReply(() async* {
      yield const ChatDelta('Parte da resposta');
      throw Exception('connection lost');
    });
    final cubit = build();
    await cubit.load();

    await cubit.send('Oi');

    expect(cubit.state.messages.last.isInterrupted, isTrue);
    expect(cubit.state.messages.last.text, 'Parte da resposta');
    expect(cubit.state.isReplying, isFalse);
  });

  test('the daily limit reached mid-chat locks the composer', () async {
    stubReply(() => Stream.value(const ChatError('CHAT_LIMIT')));
    final cubit = build();
    await cubit.load();

    await cubit.send('Oi');

    expect(cubit.state.stage, const Success(ChatStage.limitReached));
    expect(cubit.state.messages.where((m) => m.role == ChatRole.mascot), isEmpty);
  });

  test('an unconfigured server shows the unavailable stage', () async {
    stubReply(() => Stream.value(const ChatError('CHAT_UNAVAILABLE')));
    final cubit = build();
    await cubit.load();

    await cubit.send('Oi');

    expect(cubit.state.stage, const Success(ChatStage.unavailable));
  });

  test('a very long or empty message is not sent', () async {
    final cubit = build();
    await cubit.load();

    await cubit.send('   ');
    await cubit.send('a' * (chatMessageMaxLength + 1));

    expect(cubit.state.messages, isEmpty);
  });

  test('a reply can be saved as a slip', () async {
    stubReply(
      () => Stream.fromIterable([const ChatDelta('Um passo pequeno.'), const ChatDone([])]),
    );
    final cubit = build();
    await cubit.load();
    await cubit.send('Oi');

    await cubit.saveAsSlip(cubit.state.messages.last);

    verify(() => repository.saveAsSlip('Um passo pequeno.')).called(1);
  });

  group('parseChatLine', () {
    test('reads delta, done, crisis and error events', () {
      expect(parseChatLine('data: {"type":"delta","text":"oi"}'), isA<ChatDelta>());
      expect((parseChatLine('data: {"type":"done","options":["a","b"]}')! as ChatDone).options, [
        'a',
        'b',
      ]);
      expect(parseChatLine('data: {"type":"crisis"}'), isA<ChatCrisis>());
      expect(
        (parseChatLine('data: {"type":"error","code":"CHAT_LIMIT"}')! as ChatError).code,
        'CHAT_LIMIT',
      );
    });

    test('a plain error body becomes an error event', () {
      expect((parseChatLine('{"error":"UNAUTHORIZED"}')! as ChatError).code, 'UNAUTHORIZED');
    });

    test('blank lines and noise are ignored', () {
      expect(parseChatLine(''), isNull);
      expect(parseChatLine('data: not json'), isNull);
    });
  });

  test('crisis detection covers both languages and ignores ordinary talk', () {
    expect(looksLikeCrisis('quero morrer'), isTrue);
    expect(looksLikeCrisis('I want to die'), isTrue);
    expect(looksLikeCrisis('ele me bate'), isTrue);
    expect(looksLikeCrisis('Brigamos por causa da louça'), isFalse);
  });
}
