import 'package:flutter_bloc_starter/features/chat/data/data_sources/learned_items_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/mutations/generated/AddLearnedItem.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/queries/generated/LearnedItems.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLearnedItemsDataSource() extends Mock implements LearnedItemsDataSource;

void main() {
  late LearnedItemsDataSource dataSource;
  late LearnedItemsRepository repository;

  setUp(() {
    dataSource = _MockLearnedItemsDataSource();
    repository = LearnedItemsRepository(dataSource: dataSource);
  });

  QueryLearnedItemslearnedItemsCollectionedgesnode item({
    String id = 'l1',
    String target = 'partner_fact',
    String text = 'Gosta de café',
    String? excerpt = 'Da conversa',
    String status = 'pending',
    DateTime? createdAt,
  }) => QueryLearnedItemslearnedItemsCollectionedgesnode(
    id: id,
    target: target,
    text: text,
    excerpt: excerpt,
    status: status,
    createdAt: createdAt ?? DateTime(2026, 11, 11),
  );

  test('maps the target and status wire values', () async {
    when(dataSource.getItems).thenAnswer(
      (_) async => [
        item(),
        item(id: 'l2', target: 'date', status: 'confirmed'),
        item(id: 'l3', target: 'memory', status: 'rejected'),
        item(id: 'l4', target: 'commitment'),
      ],
    );

    final items = await repository.getItems();

    expect(items.map((item) => item.target), [
      LearnedTarget.partnerFact,
      LearnedTarget.date,
      LearnedTarget.memory,
      LearnedTarget.commitment,
    ]);
    expect(items.map((item) => item.status), [
      LearnedStatus.pending,
      LearnedStatus.confirmed,
      LearnedStatus.rejected,
      LearnedStatus.pending,
    ]);
    expect(items.first.createdAt, DateTime(2026, 11, 11));
  });

  test('saves the text trimmed and cuts the excerpt to its limit', () async {
    when(
      () => dataSource.add(
        target: any(named: 'target'),
        text: any(named: 'text'),
        excerpt: any(named: 'excerpt'),
      ),
    ).thenAnswer(
      (_) async => MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords(
        id: 'l1',
        createdAt: DateTime(2026, 11, 11),
      ),
    );

    await repository.add(
      target: LearnedTarget.partnerFact,
      text: '  Gosta de café  ',
      excerpt: 'a' * (learnedExcerptMaxLength + 10),
    );

    verify(
      () => dataSource.add(
        target: 'partner_fact',
        text: 'Gosta de café',
        excerpt: 'a' * learnedExcerptMaxLength,
      ),
    ).called(1);
  });

  test('edits the text, changes the status and deletes by id', () async {
    when(
      () => dataSource.updateText(
        id: any(named: 'id'),
        text: any(named: 'text'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => dataSource.setStatus(
        id: any(named: 'id'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});
    when(() => dataSource.delete(any())).thenAnswer((_) async {});

    await repository.updateText('l1', '  Gosta de chá  ');
    await repository.setStatus('l1', LearnedStatus.confirmed);
    await repository.delete('l1');

    verify(() => dataSource.updateText(id: 'l1', text: 'Gosta de chá')).called(1);
    verify(() => dataSource.setStatus(id: 'l1', status: 'confirmed')).called(1);
    verify(() => dataSource.delete('l1')).called(1);
  });
}
