import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/fragments/generated/GiftWishFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/mappers/gift_mapper.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps a wish with the flags the server computed', () {
    final gift = FragmentGiftWishFragment(
      id: 'g1',
      title: 'Livro',
      note: 'Capa dura',
      budget: EnumGiftBudget.low,
      status: EnumGiftIdeaStatus.planned,
      isMine: true,
      isShared: true,
    ).toModel();

    expect(gift.id, 'g1');
    expect(gift.note, 'Capa dura');
    expect(gift.budget, GiftBudget.low);
    expect(gift.status, GiftIdeaStatus.planned);
    expect(gift.isMine, isTrue);
    expect(gift.isShared, isTrue);
  });

  test('a flag the server did not return is false and an unknown budget is left out', () {
    final gift = FragmentGiftWishFragment(
      id: 'g1',
      title: 'Livro',
      budget: EnumGiftBudget.$unknown,
      status: EnumGiftIdeaStatus.idea,
    ).toModel();

    expect(gift.isMine, isFalse);
    expect(gift.isShared, isFalse);
    expect(gift.budget, isNull);
  });
}
