import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/local/guides_local_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/guides_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_catalogue.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGuidesDataSource() extends Mock implements GuidesDataSource;

class _MockGuidesLocalDataSource() extends Mock implements GuidesLocalDataSource;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late GuidesDataSource dataSource;
  late GuidesLocalDataSource localDataSource;
  late AuthenticationRepository authenticationRepository;
  late GuidesRepository repository;

  setUpAll(() {
    registerFallbackValue('');
    registerFallbackValue(
      GuideProgress(
        stepIndex: 0,
        answers: const [],
        savedAt: DateTime(2026, 11, 11),
        contentVersion: 'abc12345',
      ),
    );
  });

  setUp(() {
    dataSource = _MockGuidesDataSource();
    localDataSource = _MockGuidesLocalDataSource();
    authenticationRepository = _MockAuthenticationRepository();
    when(() => authenticationRepository.currentUserId).thenReturn('user-a');
    repository = GuidesRepository(
      dataSource: dataSource,
      localDataSource: localDataSource,
      authenticationRepository: authenticationRepository,
    );
  });

  test('the catalogue is localized without reading the server', () async {
    final guides = await repository.getGuides(languageCode: 'en');

    expect(guides, hasLength(guideCatalogue.length));
    expect(guides.first.title, 'Transition');
    expect(guides.last.title, 'Distance');
    expect(guides.every((guide) => guide.prompts.length == 4), isTrue);
    verifyNever(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    );
  });

  test('progress is scoped to the signed-in user', () async {
    final progress = GuideProgress(
      stepIndex: 1,
      answers: const ['um', ''],
      savedAt: DateTime(2026, 11, 11),
      contentVersion: 'abc12345',
    );
    when(() => localDataSource.readProgress('money', ownerId: 'user-a'))
        .thenAnswer((_) async => progress);
    when(() => localDataSource.writeProgress('money', progress, ownerId: 'user-a'))
        .thenAnswer((_) async {});

    await repository.getProgress('money');
    await repository.saveProgress('money', progress);

    verify(() => localDataSource.readProgress('money', ownerId: 'user-a')).called(1);
    verify(() => localDataSource.writeProgress('money', progress, ownerId: 'user-a')).called(1);

    when(() => authenticationRepository.currentUserId).thenReturn('user-b');
    when(() => localDataSource.readProgress('money', ownerId: 'user-b'))
        .thenAnswer((_) async => null);

    expect(await repository.getProgress('money'), isNull);
    verify(() => localDataSource.readProgress('money', ownerId: 'user-b')).called(1);
  });

  test('a local storage failure becomes a localized exception', () async {
    when(() => localDataSource.writeProgress(any(), any(), ownerId: any(named: 'ownerId')))
        .thenThrow(Exception('disk full'));

    await expectLater(
      repository.saveProgress(
        'money',
        GuideProgress(
          stepIndex: 0,
          answers: const [],
          savedAt: DateTime(2026, 11, 11),
          contentVersion: 'abc12345',
        ),
      ),
      throwsA(isA<LocalizedException>()),
    );
  });

  test('the first save inserts and later saves update the same row', () async {
    when(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async => 'prep-1');
    when(
      () => dataSource.updatePrep(
        id: any(named: 'id'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async {});

    final id = await repository.savePrep(
      prepId: null,
      guide: 'money',
      topic: 'Dinheiro',
      notes: 'Uma nota',
      draft: 'Uma nota',
    );
    final updated = await repository.savePrep(
      prepId: id,
      guide: 'money',
      topic: 'Dinheiro',
      notes: 'Uma nota nova',
      draft: 'Uma nota nova',
    );

    expect(id, 'prep-1');
    expect(updated, 'prep-1');
    verify(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: EnumConversationGuide.money,
        topic: 'Dinheiro',
        notes: 'Uma nota',
        draft: 'Uma nota',
      ),
    ).called(1);
    verify(
      () => dataSource.updatePrep(
        id: 'prep-1',
        guide: EnumConversationGuide.money,
        topic: 'Dinheiro',
        notes: 'Uma nota nova',
        draft: 'Uma nota nova',
      ),
    ).called(1);
  });

  test('a missing saved row is inserted again with a new id', () async {
    when(
      () => dataSource.updatePrep(
        id: any(named: 'id'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenThrow(const NoDataException());
    when(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async => 'prep-2');

    final id = await repository.savePrep(
      prepId: 'prep-1',
      guide: 'money',
      topic: 'Dinheiro',
      notes: 'Uma nota',
      draft: null,
    );

    expect(id, 'prep-2');
    verify(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: EnumConversationGuide.money,
        topic: 'Dinheiro',
        notes: 'Uma nota',
        draft: null,
      ),
    ).called(1);
  });

  test('notes are capped at the server limit before saving', () async {
    when(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async => 'prep-1');

    await repository.savePrep(
      prepId: null,
      guide: 'money',
      topic: 'Dinheiro',
      notes: 'a' * 6000,
      draft: null,
    );

    final captured = verify(
      () => dataSource.insertPrep(
        id: any(named: 'id'),
        guide: EnumConversationGuide.money,
        topic: 'Dinheiro',
        notes: captureAny(named: 'notes'),
        draft: null,
      ),
    ).captured.single;

    expect((captured as String).length, conversationNotesMaxLength);
  });
}
