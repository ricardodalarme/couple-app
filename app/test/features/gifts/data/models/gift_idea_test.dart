import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a wish without a couple id is private', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro');

    expect(gift.isShared, isFalse);
    expect(gift.isMine, isFalse);
  });

  test('a wish with a couple id is shared', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro', coupleId: 'couple-1', isMine: true);

    expect(gift.isShared, isTrue);
    expect(gift.isMine, isTrue);
  });

  test('details keep identity and visibility', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro', coupleId: 'couple-1', isMine: true);

    final edited = gift.withDetails(title: 'Livro de poemas', note: 'Capa dura', budget: 'low');

    expect(edited.id, gift.id);
    expect(edited.title, 'Livro de poemas');
    expect(edited.note, 'Capa dura');
    expect(edited.budget, 'low');
    expect(edited.isShared, isTrue);
    expect(edited.isMine, isTrue);
  });

  test('changing the couple id changes only visibility', () {
    const gift = GiftIdea(id: 'g1', title: 'Livro', isMine: true);

    expect(gift.withCoupleId('couple-1').isShared, isTrue);
    expect(gift.withCoupleId(null).isShared, isFalse);
  });
}
