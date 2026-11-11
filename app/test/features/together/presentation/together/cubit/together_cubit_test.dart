import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockCheckinRepository() extends Mock implements CheckinRepository;

class _MockListsRepository() extends Mock implements ListsRepository;

class _MockQuestionsRepository() extends Mock implements QuestionsRepository;

void main() {
  late PairingRepository pairingRepository;
  late CheckinRepository checkinRepository;
  late ListsRepository listsRepository;
  late QuestionsRepository questionsRepository;

  setUp(() {
    pairingRepository = _MockPairingRepository();
    checkinRepository = _MockCheckinRepository();
    listsRepository = _MockListsRepository();
    questionsRepository = _MockQuestionsRepository();
    when(pairingRepository.getPartner).thenAnswer((_) async => null);
    when(checkinRepository.isCurrentWeekDismissed).thenAnswer((_) async => false);
    when(listsRepository.getLists).thenAnswer((_) async => const []);
    when(questionsRepository.getPrompt).thenAnswer(
      (_) async => const QuestionPrompt(
        slug: 'first-meeting',
        title: 'What do you remember?',
        isPaired: true,
        selfId: 'me',
      ),
    );
  });

  TogetherCubit build() => TogetherCubit(
    pairingRepository: pairingRepository,
    checkinRepository: checkinRepository,
    listsRepository: listsRepository,
    questionsRepository: questionsRepository,
  );

  test('a dismissed week hides the check-in entry', () async {
    when(checkinRepository.isCurrentWeekDismissed).thenAnswer((_) async => true);
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.showCheckin, isFalse);
  });

  test('an unreadable dismissal keeps the entry visible', () async {
    when(checkinRepository.isCurrentWeekDismissed).thenThrow(Exception());
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.showCheckin, isTrue);
  });

  test('the lists entry shows how many lists the couple has', () async {
    when(listsRepository.getLists)
        .thenAnswer((_) async => const [CoupleList(id: 'l1', title: 'Viagens', kind: 'travel')]);
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.listCount, 1);
  });

  test('an unreadable list count leaves the entry without a number', () async {
    when(listsRepository.getLists).thenThrow(Exception());
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.listCount, 0);
  });
}
