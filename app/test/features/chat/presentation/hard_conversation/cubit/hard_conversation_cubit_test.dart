import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/hard_conversation_draft.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/hard_conversation_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/hard_conversation/cubit/hard_conversation_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHardConversationRepository() extends Mock implements HardConversationRepository;

class _MockChatRepository() extends Mock implements ChatRepository;

void main() {
  late HardConversationRepository repository;
  late ChatRepository chatRepository;

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(HardConversationTone.neutral);
    registerFallbackValue(
      HardConversationDraft(
        step: HardConversationStep.whatHappened,
        whatChoice: '',
        whatText: '',
        needChoice: '',
        needText: '',
        message: '',
        savedAt: DateTime(2026),
      ),
    );
  });

  setUp(() {
    repository = _MockHardConversationRepository();
    chatRepository = _MockChatRepository();
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: true, hasPlus: true));
    when(repository.readDraft).thenAnswer((_) async => null);
    when(repository.clearDraft).thenAnswer((_) async {});
    when(() => repository.saveDraft(any())).thenAnswer((_) async {});
    when(() => repository.sendAsNote(any())).thenAnswer((_) async {});
  });

  void stubReply(Stream<ChatEvent> Function() events) {
    when(
      () => repository.generate(
        what: any(named: 'what'),
        need: any(named: 'need'),
        locale: any(named: 'locale'),
        session: any(named: 'session'),
        tone: any(named: 'tone'),
      ),
    ).thenAnswer((_) => events());
  }

  HardConversationCubit build() =>
      HardConversationCubit(repository: repository, chatRepository: chatRepository);

  Future<void> advanceToSay(HardConversationCubit cubit) async {
    await cubit.selectWhat('Ela se sentiu ignorada');
    await cubit.next();
    await cubit.selectNeed('Ser ouvido');
    await cubit.next();
  }

  test('a fresh draft starts at the first step with the gate ready', () async {
    final cubit = build();

    await cubit.load();

    expect(cubit.state.status, const Success<void>(null));
    expect(cubit.state.gate, HardConversationGate.ready);
    expect(cubit.state.step, HardConversationStep.whatHappened);
  });

  test('the last draft is hydrated back into the steps', () async {
    when(repository.readDraft).thenAnswer(
      (_) async => HardConversationDraft(
        step: HardConversationStep.howToSay,
        whatChoice: 'Brigamos por dinheiro',
        whatText: '',
        needChoice: 'Combinar algo',
        needText: '',
        message: 'Podemos falar com calma?',
        savedAt: DateTime(2026),
      ),
    );
    final cubit = build();

    await cubit.load();

    expect(cubit.state.step, HardConversationStep.howToSay);
    expect(cubit.state.whatChoice, 'Brigamos por dinheiro');
    expect(cubit.state.needChoice, 'Combinar algo');
    expect(cubit.state.message, 'Podemos falar com calma?');
  });

  test('the gate follows Plus, consent and today usage', () async {
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 0, isEnabled: false, hasPlus: false));
    var cubit = build();
    await cubit.load();
    expect(cubit.state.gate, HardConversationGate.plusRequired);

    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: false, hasPlus: true));
    cubit = build();
    await cubit.load();
    expect(cubit.state.gate, HardConversationGate.needsConsent);

    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 20, isEnabled: true, hasPlus: true));
    cubit = build();
    await cubit.load();
    expect(cubit.state.gate, HardConversationGate.limitReached);
  });

  test('turning the chat on loads the steps again', () async {
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: false, hasPlus: true));
    final cubit = build();
    await cubit.load();
    when(chatRepository.enable).thenAnswer((_) async {});
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: true, hasPlus: true));

    await cubit.enable();

    verify(chatRepository.enable).called(1);
    expect(cubit.state.gate, HardConversationGate.ready);
  });

  test('the steps move forward and the model writes the sentence', () async {
    stubReply(
      () => Stream.fromIterable([
        const ChatDelta('Percebi que fiquei no celular. '),
        const ChatDelta('Posso te ouvir agora?'),
        const ChatDone([]),
      ]),
    );
    final cubit = build();
    await cubit.load();

    await advanceToSay(cubit);

    expect(cubit.state.step, HardConversationStep.howToSay);
    expect(cubit.state.message, 'Percebi que fiquei no celular. Posso te ouvir agora?');
    expect(cubit.state.isGenerating, isFalse);
    verify(
      () => repository.generate(
        what: 'Ela se sentiu ignorada',
        need: 'Ser ouvido',
        locale: any(named: 'locale'),
        session: any(named: 'session'),
        tone: HardConversationTone.neutral,
      ),
    ).called(1);
  });

  test('the draft keeps the step and the answers while the person is away', () async {
    stubReply(() => Stream.fromIterable([const ChatDelta('Oi.'), const ChatDone([])]));
    final cubit = build();
    await cubit.load();

    await cubit.selectWhat('Ela se sentiu ignorada');
    await cubit.next();

    final draft =
        verify(() => repository.saveDraft(captureAny())).captured.last as HardConversationDraft;
    expect(draft.step, HardConversationStep.whatINeed);
    expect(draft.whatChoice, 'Ela se sentiu ignorada');
  });

  test('asking again with another tone uses the same answers', () async {
    stubReply(() => Stream.fromIterable([const ChatDelta('Primeira.'), const ChatDone([])]));
    final cubit = build();
    await cubit.load();
    await advanceToSay(cubit);

    stubReply(() => Stream.fromIterable([const ChatDelta('Mais direta.'), const ChatDone([])]));
    await cubit.regenerate(HardConversationTone.moreDirect);

    expect(cubit.state.message, 'Mais direta.');
    verify(
      () => repository.generate(
        what: 'Ela se sentiu ignorada',
        need: 'Ser ouvido',
        locale: any(named: 'locale'),
        session: any(named: 'session'),
        tone: HardConversationTone.moreDirect,
      ),
    ).called(1);
  });

  test('editing the sentence never asks the model again', () async {
    stubReply(() => Stream.fromIterable([const ChatDelta('Primeira.'), const ChatDone([])]));
    final cubit = build();
    await cubit.load();
    await advanceToSay(cubit);

    await cubit.onMessageChanged('Uma frase editada.');

    expect(cubit.state.message, 'Uma frase editada.');
    verify(
      () => repository.generate(
        what: any(named: 'what'),
        need: any(named: 'need'),
        locale: any(named: 'locale'),
        session: any(named: 'session'),
        tone: any(named: 'tone'),
      ),
    ).called(1);
  });

  test('the limit, the consent and an unconfigured server change the gate', () async {
    for (final (code, gate) in [
      ('CHAT_LIMIT', HardConversationGate.limitReached),
      ('CHAT_DISABLED', HardConversationGate.needsConsent),
      ('CHAT_UNAVAILABLE', HardConversationGate.unavailable),
    ]) {
      stubReply(() => Stream.value(ChatError(code)));
      final cubit = build();
      await cubit.load();

      await advanceToSay(cubit);

      expect(cubit.state.gate, gate, reason: code);
      expect(cubit.state.message, isEmpty);
    }
  });

  test('an upstream error keeps the steps and reports the failure', () async {
    stubReply(() => Stream.value(const ChatError('UPSTREAM')));
    final cubit = build();
    await cubit.load();

    await advanceToSay(cubit);

    expect(cubit.state.gate, HardConversationGate.ready);
    expect(cubit.state.generateAction, isA<Failure>());
  });

  test('a stream that breaks reports the failure', () async {
    stubReply(() async* {
      yield const ChatDelta('Parte');
      throw Exception('offline');
    });
    final cubit = build();
    await cubit.load();

    await advanceToSay(cubit);

    expect(cubit.state.isGenerating, isFalse);
    expect(cubit.state.generateAction, isA<Failure>());
  });

  test('sending the sentence uses the note and clears the local draft', () async {
    stubReply(
      () => Stream.fromIterable([const ChatDelta('Podemos conversar?'), const ChatDone([])]),
    );
    final cubit = build();
    await cubit.load();
    await advanceToSay(cubit);

    await cubit.send();

    verify(() => repository.sendAsNote('Podemos conversar?')).called(1);
    verify(repository.clearDraft).called(1);
    expect(cubit.state.sendAction, const Initial());
  });

  test('a failed send keeps the sentence', () async {
    stubReply(
      () => Stream.fromIterable([const ChatDelta('Podemos conversar?'), const ChatDone([])]),
    );
    when(() => repository.sendAsNote(any())).thenThrow(Exception('offline'));
    final cubit = build();
    await cubit.load();
    await advanceToSay(cubit);

    await cubit.send();

    expect(cubit.state.message, 'Podemos conversar?');
    expect(cubit.state.sendAction, const Initial());
  });

  test('a new stream is not started while the last one is running', () async {
    final controller = StreamController<ChatEvent>();
    addTearDown(controller.close);
    stubReply(() => controller.stream);
    final cubit = build();
    await cubit.load();
    await cubit.selectWhat('Ela se sentiu ignorada');
    await cubit.next();
    await cubit.selectNeed('Ser ouvido');

    final running = cubit.next();
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isGenerating, isTrue);

    await cubit.regenerate(HardConversationTone.gentler);

    verify(
      () => repository.generate(
        what: any(named: 'what'),
        need: any(named: 'need'),
        locale: any(named: 'locale'),
        session: any(named: 'session'),
        tone: any(named: 'tone'),
      ),
    ).called(1);

    await controller.close();
    await running;
  });
}
