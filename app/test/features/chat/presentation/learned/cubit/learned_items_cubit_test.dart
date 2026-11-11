import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/cubit/learned_items_cubit.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLearnedItemsRepository() extends Mock implements LearnedItemsRepository;

class _MockPartnerRepository() extends Mock implements PartnerRepository;

void main() {
  late LearnedItemsRepository learnedItemsRepository;
  late PartnerRepository partnerRepository;

  final partnerItem = LearnedItem(
    id: 'l1',
    target: LearnedTarget.partnerFact,
    text: 'Gosta de café',
    excerpt: 'Da conversa',
    status: LearnedStatus.pending,
    createdAt: DateTime(2026, 11, 11),
  );

  setUpAll(() {
    registerFallbackValue(LearnedStatus.pending);
    registerFallbackValue(LearnedTarget.partnerFact);
  });

  setUp(() {
    learnedItemsRepository = _MockLearnedItemsRepository();
    partnerRepository = _MockPartnerRepository();
    when(learnedItemsRepository.getItems).thenAnswer((_) async => [partnerItem]);
    when(() => learnedItemsRepository.setStatus(any(), any())).thenAnswer((_) async {});
    when(() => learnedItemsRepository.updateText(any(), any())).thenAnswer((_) async {});
    when(
      () => partnerRepository.addFact(
        id: any(named: 'id'),
        label: any(named: 'label'),
        value: any(named: 'value'),
        category: any(named: 'category'),
      ),
    ).thenAnswer((_) async {});
  });

  LearnedItemsCubit build() => LearnedItemsCubit(
    learnedItemsRepository: learnedItemsRepository,
    partnerRepository: partnerRepository,
  );

  test('loads pending and confirmed items, hiding rejected ones', () async {
    when(learnedItemsRepository.getItems).thenAnswer(
      (_) async => [
        partnerItem,
        LearnedItem(
          id: 'l2',
          target: LearnedTarget.date,
          text: 'Jantar',
          status: LearnedStatus.confirmed,
          createdAt: DateTime(2026, 11, 11),
        ),
        LearnedItem(
          id: 'l3',
          target: LearnedTarget.memory,
          text: 'Praia',
          status: LearnedStatus.rejected,
          createdAt: DateTime(2026, 11, 11),
        ),
      ],
    );
    final cubit = build();

    await cubit.load();

    expect(cubit.state.pending.map((item) => item.id), ['l1']);
    expect(cubit.state.confirmed.map((item) => item.id), ['l2']);
  });

  test('confirming a partner fact also saves a private note about the partner', () async {
    final cubit = build();

    await cubit.confirm(partnerItem, partnerFactLabel: 'Da conversa');

    verify(() => learnedItemsRepository.setStatus('l1', LearnedStatus.confirmed)).called(1);
    verify(
      () => partnerRepository.addFact(
        id: any(named: 'id'),
        label: 'Da conversa',
        value: 'Gosta de café',
        category: null,
      ),
    ).called(1);
  });

  test('confirming any other target does not touch the partner notes', () async {
    final cubit = build();
    final dateItem = LearnedItem(
      id: 'l2',
      target: LearnedTarget.date,
      text: 'Jantar',
      status: LearnedStatus.pending,
      createdAt: DateTime(2026, 11, 11),
    );

    await cubit.confirm(dateItem, partnerFactLabel: 'Da conversa');

    verify(() => learnedItemsRepository.setStatus('l2', LearnedStatus.confirmed)).called(1);
    verifyNever(
      () => partnerRepository.addFact(
        id: any(named: 'id'),
        label: any(named: 'label'),
        value: any(named: 'value'),
        category: any(named: 'category'),
      ),
    );
  });

  test('editing saves the new text and reads the list again', () async {
    final cubit = build();

    await cubit.edit(partnerItem, 'Gosta de chá');

    verify(() => learnedItemsRepository.updateText('l1', 'Gosta de chá')).called(1);
    verify(learnedItemsRepository.getItems).called(1);
  });

  test('discarding hides the item after the reload', () async {
    final cubit = build();

    await cubit.discard(partnerItem);

    verify(() => learnedItemsRepository.setStatus('l1', LearnedStatus.rejected)).called(1);
  });

  test('a failed change keeps the list and reports the failure', () async {
    when(() => learnedItemsRepository.updateText(any(), any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();
    final failure = cubit.stream
        .map((state) => state.action)
        .firstWhere((action) => action is Failure);

    await cubit.edit(partnerItem, 'Gosta de chá');

    expect(await failure, isA<Failure>());
    expect(cubit.state.items, isA<Success<List<LearnedItem>>>());
  });
}
