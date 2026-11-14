import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';

extension GuideSlugMapper on String {
  /// The stored kind of conversation prep for a guide slug; guides without their own kind are free preps.
  EnumConversationGuide toConversationGuide() => switch (this) {
    'transition' => EnumConversationGuide.transition,
    'money' => EnumConversationGuide.money,
    'apology' => EnumConversationGuide.apology,
    'difficult' => EnumConversationGuide.difficult,
    _ => EnumConversationGuide.free,
  };
}
