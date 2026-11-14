import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/mappers/learned_item_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a learning target survives a trip to the remote enum and back', () {
    for (final value in LearnedTarget.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a learning status survives a trip to the remote enum and back', () {
    for (final value in LearnedStatus.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a multi-word target keeps its stored spelling', () {
    expect(LearnedTarget.partnerFact.toRemote(), EnumLearnedItemTarget.partner_fact);
  });

  test('an unknown value is an error, not a guess', () {
    expect(() => EnumLearnedItemTarget.$unknown.toModel(), throwsFormatException);
    expect(() => EnumLearnedItemStatus.$unknown.toModel(), throwsFormatException);
  });
}
