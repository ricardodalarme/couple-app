import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/mappers/gift_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a gift budget survives a trip to the remote enum and back', () {
    for (final value in GiftBudget.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a gift idea status survives a trip to the remote enum and back', () {
    for (final value in GiftIdeaStatus.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown budget is left out and an unknown status is an idea', () {
    expect(EnumGiftBudget.$unknown.toModel(), isNull);
    expect(EnumGiftIdeaStatus.$unknown.toModel(), GiftIdeaStatus.idea);
  });
}
