import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/local/hard_conversation_local_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/hard_conversation_draft.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/hard_conversation_repository.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatRepository() extends Mock implements ChatRepository;

class _MockNotesRepository() extends Mock implements NotesRepository;

class _MockHardConversationLocalDataSource()
    extends Mock
    implements HardConversationLocalDataSource;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late ChatRepository chatRepository;
  late NotesRepository notesRepository;
  late HardConversationLocalDataSource localDataSource;
  late AuthenticationRepository authenticationRepository;
  late HardConversationRepository repository;

  setUpAll(() {
    registerFallbackValue(ChatMode.hardConversation);
    registerFallbackValue(HardConversationTone.neutral);
  });

  setUp(() {
    chatRepository = _MockChatRepository();
    notesRepository = _MockNotesRepository();
    localDataSource = _MockHardConversationLocalDataSource();
    authenticationRepository = _MockAuthenticationRepository();
    repository = HardConversationRepository(
      chatRepository: chatRepository,
      notesRepository: notesRepository,
      localDataSource: localDataSource,
      authenticationRepository: authenticationRepository,
    );
    when(() => authenticationRepository.currentUserId).thenReturn('u1');
  });

  test('a draft from the last day is read back', () async {
    await withClock(Clock.fixed(DateTime(2026, 3, 10, 12)), () async {
      final draft = HardConversationDraft(
        step: HardConversationStep.whatINeed,
        whatChoice: 'Ela se sentiu ignorada',
        whatText: '',
        needChoice: 'Ser ouvido',
        needText: '',
        message: '',
        savedAt: clock.now(),
      );
      when(() => localDataSource.read('u1')).thenReturn(jsonEncode(draft.toMap()));

      final read = await repository.readDraft();

      expect(read?.step, HardConversationStep.whatINeed);
      expect(read?.whatChoice, 'Ela se sentiu ignorada');
      expect(read?.needChoice, 'Ser ouvido');
    });
  });

  test('a draft older than a day is cleared and forgotten', () async {
    await withClock(Clock.fixed(DateTime(2026, 3, 10, 12)), () async {
      final draft = HardConversationDraft(
        step: HardConversationStep.howToSay,
        whatChoice: 'Brigamos por dinheiro',
        whatText: '',
        needChoice: 'Combinar algo',
        needText: '',
        message: 'Podemos falar com calma?',
        savedAt: clock.now().subtract(const Duration(hours: 25)),
      );
      when(() => localDataSource.read('u1')).thenReturn(jsonEncode(draft.toMap()));
      when(() => localDataSource.clear(any())).thenAnswer((_) async {});

      final read = await repository.readDraft();

      expect(read, isNull);
      verify(() => localDataSource.clear('u1')).called(1);
    });
  });

  test('a malformed draft is cleared and forgotten', () async {
    when(() => localDataSource.read('u1')).thenReturn('not-json');
    when(() => localDataSource.clear(any())).thenAnswer((_) async {});

    final read = await repository.readDraft();

    expect(read, isNull);
    verify(() => localDataSource.clear('u1')).called(1);
  });

  test('saves and clears under the signed-in person', () async {
    when(
      () => localDataSource.write(
        userId: any(named: 'userId'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async {});
    when(() => localDataSource.clear(any())).thenAnswer((_) async {});
    final draft = HardConversationDraft(
      step: HardConversationStep.whatHappened,
      whatChoice: 'Foi um mal-entendido',
      whatText: '',
      needChoice: '',
      needText: '',
      message: '',
      savedAt: DateTime(2026, 3, 10, 12),
    );

    await repository.saveDraft(draft);
    await repository.clearDraft();

    verify(
      () => localDataSource.write(
        userId: 'u1',
        draft: any(named: 'draft'),
      ),
    ).called(1);
    verify(() => localDataSource.clear('u1')).called(1);
  });

  test('the prompt carries only the step answers and asks for one gentle sentence', () async {
    String? sent;
    List<Object?>? sentHistory;
    when(
      () => chatRepository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer((invocation) {
      sent = invocation.namedArguments[#message] as String;
      sentHistory = invocation.namedArguments[#history] as List<Object?>;
      return const Stream.empty();
    });

    await repository
        .generate(
          what: 'Ela se sentiu ignorada',
          need: 'Ser ouvido',
          locale: 'pt-BR',
          session: 'session-1',
          tone: HardConversationTone.gentler,
        )
        .drain<void>();

    expect(sent, contains('Ela se sentiu ignorada'));
    expect(sent, contains('Ser ouvido'));
    expect(sent, contains('frase de abertura'));
    expect(sent, isNot(contains('parceiro')));
    expect(sentHistory, isEmpty);
    verify(
      () => chatRepository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: 'pt-BR',
        mode: ChatMode.hardConversation,
        session: 'session-1',
      ),
    ).called(1);
  });

  test('sending the sentence uses the widget note', () async {
    when(
      () => notesRepository.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    ).thenAnswer((_) async {});

    await repository.sendAsNote('Podemos falar com calma?');

    verify(() => notesRepository.sendNote(body: 'Podemos falar com calma?', forWidget: true))
        .called(1);
  });
}
