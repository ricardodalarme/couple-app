import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/cards_data_source.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/queries/generated/CardDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/queries/generated/MyCards.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardsDataSource() extends Mock implements CardsDataSource;

void main() {
  late CardsDataSource dataSource;
  late CardsRepository repository;

  final weekStart = DateTime(2026, 11, 9);

  QueryMyCardscardsCollectionedgesnode node({required String id, bool? isMine}) =>
      QueryMyCardscardsCollectionedgesnode(id: id, isMine: isMine, weekStart: weekStart);

  QueryMyCardscardsCollection cards(List<QueryMyCardscardsCollectionedgesnode> nodes) =>
      QueryMyCardscardsCollection(
        edges: [for (final node in nodes) QueryMyCardscardsCollectionedges(node: node)],
        pageInfo: QueryMyCardscardsCollectionpageInfo(hasNextPage: false),
      );

  setUp(() {
    dataSource = _MockCardsDataSource();
    repository = CardsRepository(dataSource: dataSource);
  });

  test('the history reads each card ownership from the server flag', () async {
    when(
      () => dataSource.getCards(
        first: any(named: 'first'),
        after: any(named: 'after'),
      ),
    ).thenAnswer(
      (_) async => cards([node(id: 'mine', isMine: true), node(id: 'theirs', isMine: false)]),
    );

    final page = await repository.getHistory();

    expect(page.items.map((card) => card.id), ['mine', 'theirs']);
    expect(page.items.map((card) => card.isMine), [true, false]);
  });

  test('a card without the server flag is not treated as the person own', () async {
    when(
      () => dataSource.getCards(
        first: any(named: 'first'),
        after: any(named: 'after'),
      ),
    ).thenAnswer((_) async => cards([node(id: 'unknown')]));

    final page = await repository.getHistory();

    expect(page.items.single.isMine, isFalse);
  });

  test('the detail reads ownership from the server flag', () async {
    when(() => dataSource.getCard('c1')).thenAnswer(
      (_) async => QueryCardDetailcardsByPk(
        id: 'c1',
        status: EnumCardStatus.sent,
        weekStart: weekStart,
        isMine: false,
      ),
    );

    final detail = await repository.getDetail(id: 'c1');

    expect(detail.isMine, isFalse);
    expect(detail.card.id, 'c1');
  });

  test('a card the server does not return is a not-found failure', () async {
    when(() => dataSource.getCard('gone')).thenAnswer((_) async => null);

    await expectLater(
      repository.getDetail(id: 'gone'),
      throwsA(
        isA<LocalizedException>().having(
          (exception) => exception.l10nKey,
          'l10nKey',
          'CARD_NOT_FOUND',
        ),
      ),
    );
  });
}
