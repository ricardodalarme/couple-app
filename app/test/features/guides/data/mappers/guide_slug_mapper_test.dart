import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/guides/data/mappers/guide_slug_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('guides with their own kind keep it', () {
    expect('transition'.toConversationGuide(), EnumConversationGuide.transition);
    expect('money'.toConversationGuide(), EnumConversationGuide.money);
    expect('apology'.toConversationGuide(), EnumConversationGuide.apology);
    expect('difficult'.toConversationGuide(), EnumConversationGuide.difficult);
  });

  test('any other guide is a free prep', () {
    expect('family'.toConversationGuide(), EnumConversationGuide.free);
    expect('chores'.toConversationGuide(), EnumConversationGuide.free);
  });
}
