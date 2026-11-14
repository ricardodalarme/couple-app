import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a wish without a couple id is private', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro');

    expect(gift.isShared, isFalse);
    expect(gift.isMine, isFalse);
  });

  test('a shared wish', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro', isShared: true, isMine: true);

    expect(gift.isShared, isTrue);
    expect(gift.isMine, isTrue);
  });

  test('details keep identity and visibility', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro', isShared: true, isMine: true);

    final edited = gift.withDetails(
      title: 'Livro de poemas',
      note: 'Capa dura',
      budget: GiftBudget.low,
    );

    expect(edited.id, gift.id);
    expect(edited.title, 'Livro de poemas');
    expect(edited.note, 'Capa dura');
    expect(edited.budget, GiftBudget.low);
    expect(edited.isShared, isTrue);
    expect(edited.isMine, isTrue);
  });

  test('changing visibility changes only visibility', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro', isMine: true);

    expect(gift.withShared(isShared: true).isShared, isTrue);
    expect(gift.withShared(isShared: false).isShared, isFalse);
  });
}
