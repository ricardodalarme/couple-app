import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';

extension EnumMoodMapper on EnumMood {
  /// Null for a mood this version does not know, so it stays hidden.
  MoodKind? toModel() => switch (this) {
    EnumMood.happy => MoodKind.happy,
    EnumMood.tired => MoodKind.tired,
    EnumMood.sad => MoodKind.sad,
    EnumMood.stressed => MoodKind.stressed,
    EnumMood.loving => MoodKind.loving,
    EnumMood.playful => MoodKind.playful,
    EnumMood.$unknown => null,
  };
}

extension MoodKindMapper on MoodKind {
  EnumMood toRemote() => switch (this) {
    MoodKind.happy => EnumMood.happy,
    MoodKind.tired => EnumMood.tired,
    MoodKind.sad => EnumMood.sad,
    MoodKind.stressed => EnumMood.stressed,
    MoodKind.loving => EnumMood.loving,
    MoodKind.playful => EnumMood.playful,
  };
}

extension EnumMoodNeedMapper on EnumMoodNeed {
  /// Null for a need this version does not know.
  NeedKind? toModel() => switch (this) {
    EnumMoodNeed.listen => NeedKind.listen,
    EnumMoodNeed.opinion => NeedKind.opinion,
    EnumMoodNeed.hug => NeedKind.hug,
    EnumMoodNeed.space => NeedKind.space,
    EnumMoodNeed.$unknown => null,
  };
}

extension NeedKindMapper on NeedKind {
  EnumMoodNeed toRemote() => switch (this) {
    NeedKind.listen => EnumMoodNeed.listen,
    NeedKind.opinion => EnumMoodNeed.opinion,
    NeedKind.hug => EnumMoodNeed.hug,
    NeedKind.space => EnumMoodNeed.space,
  };
}

extension EnumMoodShareMapper on EnumMoodShare {
  /// An unknown audience is treated as private.
  MoodShare toModel() => switch (this) {
    EnumMoodShare.none => MoodShare.none,
    EnumMoodShare.mood => MoodShare.mood,
    EnumMoodShare.mood_need => MoodShare.moodNeed,
    EnumMoodShare.$unknown => MoodShare.none,
  };
}

extension MoodShareMapper on MoodShare {
  EnumMoodShare toRemote() => switch (this) {
    MoodShare.none => EnumMoodShare.none,
    MoodShare.mood => EnumMoodShare.mood,
    MoodShare.moodNeed => EnumMoodShare.mood_need,
  };
}
