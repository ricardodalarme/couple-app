import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/important_date_kind.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/models/memory_origin.dart';
import 'package:flutter_bloc_starter/features/history/data/models/story_event_kind.dart';

extension EnumDatePrecisionMapper on EnumDatePrecision {
  /// An unknown precision is read as a whole day.
  MilestoneDatePrecision toModel() => switch (this) {
    EnumDatePrecision.day || EnumDatePrecision.$unknown => MilestoneDatePrecision.day,
    EnumDatePrecision.month => MilestoneDatePrecision.month,
    EnumDatePrecision.year => MilestoneDatePrecision.year,
  };
}

extension MilestoneDatePrecisionMapper on MilestoneDatePrecision {
  /// A milestone with an unknown date is stored as an important date, which has no precision.
  EnumDatePrecision toRemote() => switch (this) {
    MilestoneDatePrecision.day || MilestoneDatePrecision.unknown => EnumDatePrecision.day,
    MilestoneDatePrecision.month => EnumDatePrecision.month,
    MilestoneDatePrecision.year => EnumDatePrecision.year,
  };
}

extension EnumStoryEventKindMapper on EnumStoryEventKind {
  MilestoneKind toMilestoneKind() => switch (this) {
    EnumStoryEventKind.met => MilestoneKind.met,
    EnumStoryEventKind.dating => MilestoneKind.dating,
    EnumStoryEventKind.engaged => MilestoneKind.engaged,
    EnumStoryEventKind.married => MilestoneKind.married,
    EnumStoryEventKind.custom || EnumStoryEventKind.$unknown => MilestoneKind.custom,
  };
}

extension StoryEventKindMapper on StoryEventKind {
  EnumStoryEventKind toRemote() => switch (this) {
    StoryEventKind.met => EnumStoryEventKind.met,
    StoryEventKind.dating => EnumStoryEventKind.dating,
    StoryEventKind.engaged => EnumStoryEventKind.engaged,
    StoryEventKind.married => EnumStoryEventKind.married,
    StoryEventKind.custom => EnumStoryEventKind.custom,
  };
}

extension EnumImportantDateKindMilestoneMapper on EnumImportantDateKind {
  MilestoneKind toMilestoneKind() => switch (this) {
    EnumImportantDateKind.first => MilestoneKind.first,
    EnumImportantDateKind.trip => MilestoneKind.trip,
    _ => MilestoneKind.custom,
  };
}

extension EnumMemoryOriginMapper on EnumMemoryOrigin {
  /// A plain memory with a place reads as a trip.
  MilestoneKind toMilestoneKind({String? place}) {
    final hasPlace = place != null && place.trim().isNotEmpty;
    return switch (this) {
      EnumMemoryOrigin.manual when hasPlace => MilestoneKind.trip,
      EnumMemoryOrigin.first => MilestoneKind.first,
      _ => MilestoneKind.custom,
    };
  }
}

extension MemoryOriginMapper on MemoryOrigin {
  EnumMemoryOrigin toRemote() => switch (this) {
    MemoryOrigin.manual => EnumMemoryOrigin.manual,
    MemoryOrigin.slip => EnumMemoryOrigin.slip,
    MemoryOrigin.card => EnumMemoryOrigin.card,
    MemoryOrigin.question => EnumMemoryOrigin.question,
    MemoryOrigin.game => EnumMemoryOrigin.game,
    MemoryOrigin.mission => EnumMemoryOrigin.mission,
    MemoryOrigin.share => EnumMemoryOrigin.share,
    MemoryOrigin.chat => EnumMemoryOrigin.chat,
    MemoryOrigin.first => EnumMemoryOrigin.first,
  };
}

extension MilestoneKindDateMapper on MilestoneKind {
  /// The important date kind a milestone with an unknown date is stored as.
  ImportantDateKind toImportantDateKind() => switch (this) {
    MilestoneKind.first => ImportantDateKind.first,
    MilestoneKind.trip => ImportantDateKind.trip,
    MilestoneKind.met ||
    MilestoneKind.dating ||
    MilestoneKind.engaged ||
    MilestoneKind.married => ImportantDateKind.relationship,
    MilestoneKind.home || MilestoneKind.custom => ImportantDateKind.custom,
  };

  /// The story event kind a milestone with a known date is stored as.
  StoryEventKind toStoryEventKind() => switch (this) {
    MilestoneKind.met => StoryEventKind.met,
    MilestoneKind.dating => StoryEventKind.dating,
    MilestoneKind.engaged => StoryEventKind.engaged,
    MilestoneKind.married => StoryEventKind.married,
    MilestoneKind.first ||
    MilestoneKind.trip ||
    MilestoneKind.home ||
    MilestoneKind.custom => StoryEventKind.custom,
  };
}
