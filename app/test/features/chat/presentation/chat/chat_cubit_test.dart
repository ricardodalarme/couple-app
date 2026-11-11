import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatRepository() extends Mock implements ChatRepository;

class _MockLearnedItemsRepository() extends Mock implements LearnedItemsRepository;

void main() {
  late ChatRepository repository;
  late LearnedItemsRepository learnedItemsRepository;

  setUpAll(() {
    registerFallbackValue(ChatMode.free);
    registerFallbackValue(LearnedTarget.partnerFact);
  });

  setUp(() {
    repository = _MockChatRepository();
    learnedItemsRepository = _MockLearnedItemsRepository();
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: true, hasPlus: true));
    when(repository.enable).thenAnswer((_) async {});
    when(() => repository.saveAsSlip(any())).thenAnswer((_) async {});
    when(
      () => learnedItemsRepository.add(
        target: any(named: 'target'),
        text: any(named: 'text'),
        excerpt: any(named: 'excerpt'),
      ),
    ).thenAnswer((_) async {});
  });

  void stubReply(Stream<ChatEvent> Function() events) {
    when(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer((_) => events());
  }

  ChatCubit build() =>
      ChatCubit(chatRepository: repository, learnedItemsRepository: learnedItemsRepository);

  test('without the consent the chat asks first and sends nothing', () async {
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: false, hasPlus: true));
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
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 20, isEnabled: true, hasPlus: true));
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
        session: any(named: 'session'),
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

  test('a reply can be saved as a pending learning', () async {
    final cubit = build();

    await cubit.saveLearning(
      target: LearnedTarget.partnerFact,
      text: 'Prefere café sem açúcar',
      excerpt: 'Uma resposta da conversa',
    );

    verify(
      () => learnedItemsRepository.add(
        target: LearnedTarget.partnerFact,
        text: 'Prefere café sem açúcar',
        excerpt: 'Uma resposta da conversa',
      ),
    ).called(1);
  });

  test('a free person sees the Plus gate before the consent step', () async {
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 0, isEnabled: false, hasPlus: false));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.stage, const Success(ChatStage.plusRequired));
    expect(cubit.state.hasPlus, isFalse);
  });

  test('crisis text is never replayed as history', () async {
    final histories = <List<ChatMessage>>[];
    when(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer((invocation) {
      histories.add(invocation.namedArguments[#history] as List<ChatMessage>);

      return Stream.fromIterable([const ChatDelta('Estou aqui.'), const ChatDone([])]);
    });
    final cubit = build();
    await cubit.load();

    await cubit.send('quero morrer');
    await cubit.send('Oi, tudo bem?');

    expect(histories, hasLength(1));
    expect(histories.single.map((turn) => turn.text), isNot(contains('quero morrer')));
  });

  test('retry resends the interrupted turn, not the latest message', () async {
    final sent = <String>[];
    when(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer((invocation) {
      final message = invocation.namedArguments[#message] as String;
      sent.add(message);
      if (message == 'primeira') {
        return (() async* {
          yield const ChatDelta('Parte da primeira');
          throw Exception('connection lost');
        })();
      }

      return Stream.fromIterable([const ChatDelta('Segunda resposta'), const ChatDone([])]);
    });
    final cubit = build();
    await cubit.load();

    await cubit.send('primeira');
    final interrupted = cubit.state.messages.firstWhere((message) => message.isInterrupted);
    await cubit.send('segunda');
    await cubit.retry(interrupted);

    expect(sent, ['primeira', 'segunda', 'primeira']);
    expect(cubit.state.messages.where((message) => message.text == 'primeira'), hasLength(1));
    expect(cubit.state.messages.any((message) => message.text == 'segunda'), isTrue);
  });

  test('a stream that never closes is interrupted by the idle timeout', () async {
    final controller = StreamController<ChatEvent>();
    addTearDown(controller.close);
    when(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer((_) => controller.stream);
    final cubit = ChatCubit(
      chatRepository: repository,
      learnedItemsRepository: learnedItemsRepository,
      idleTimeout: const Duration(milliseconds: 10),
    );
    await cubit.load();

    await cubit.send('Oi');

    expect(cubit.state.messages.last.isInterrupted, isTrue);
    expect(cubit.state.isReplying, isFalse);
  });

  test('the same session is sent with every message so the prompt cache can be reused', () async {
    final sessions = <String>[];
    when(
      () => repository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer((invocation) {
      sessions.add(invocation.namedArguments[#session] as String);

      return Stream.fromIterable([const ChatDelta('Oi'), const ChatDone([])]);
    });
    final cubit = build();
    await cubit.load();

    await cubit.send('Oi');
    await cubit.send('Tudo bem?');

    expect(sessions, hasLength(2));
    expect(sessions.toSet(), hasLength(1));
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
    const crisisPhrases = [
      'não quero mais viver',
      'não quero viver',
      'queria desaparecer',
      'não aguento mais',
      'me cortei',
      'tomei os remédios',
      'autolesão',
      "I don't want to live",
      'I dont want to live',
      'end my life',
      'better off dead',
      'quero morrer',
      'ele me bate',
    ];
    for (final phrase in crisisPhrases) {
      expect(looksLikeCrisis(phrase), isTrue, reason: phrase);
    }
    for (final phrase in ['vou me matar de rir', 'Brigamos por causa da louça']) {
      expect(looksLikeCrisis(phrase), isFalse, reason: phrase);
    }
  });
}
