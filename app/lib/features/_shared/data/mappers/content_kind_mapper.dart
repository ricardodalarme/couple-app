import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/_shared/data/models/content_kind.dart';

extension ContentKindMapper on ContentKind {
  EnumContentKind toRemote() => switch (this) {
    ContentKind.question => EnumContentKind.question,
    ContentKind.touchCard => EnumContentKind.touch_card,
    ContentKind.moodTip => EnumContentKind.mood_tip,
    ContentKind.meOrYou => EnumContentKind.me_or_you,
    ContentKind.howWell => EnumContentKind.how_well,
    ContentKind.neverHaveWe => EnumContentKind.never_have_we,
    ContentKind.mission => EnumContentKind.mission,
  };
}
