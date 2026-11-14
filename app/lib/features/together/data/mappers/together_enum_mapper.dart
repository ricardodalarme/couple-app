import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea_status.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual_cadence.dart';

extension EnumRitualCadenceMapper on EnumRitualCadence {
  RitualCadence toModel() => switch (this) {
    EnumRitualCadence.daily => RitualCadence.daily,
    EnumRitualCadence.weekly => RitualCadence.weekly,
    EnumRitualCadence.biweekly => RitualCadence.biweekly,
    EnumRitualCadence.monthly => RitualCadence.monthly,
    EnumRitualCadence.$unknown => throw const FormatException('Unknown ritual cadence'),
  };
}

extension RitualCadenceMapper on RitualCadence {
  EnumRitualCadence toRemote() => switch (this) {
    RitualCadence.daily => EnumRitualCadence.daily,
    RitualCadence.weekly => EnumRitualCadence.weekly,
    RitualCadence.biweekly => EnumRitualCadence.biweekly,
    RitualCadence.monthly => EnumRitualCadence.monthly,
  };
}

extension EnumDateIdeaStatusMapper on EnumDateIdeaStatus {
  DateIdeaStatus toModel() => switch (this) {
    EnumDateIdeaStatus.saved => DateIdeaStatus.saved,
    EnumDateIdeaStatus.planned => DateIdeaStatus.planned,
    EnumDateIdeaStatus.done => DateIdeaStatus.done,
    EnumDateIdeaStatus.$unknown => throw const FormatException('Unknown date idea status'),
  };
}

extension DateIdeaStatusMapper on DateIdeaStatus {
  EnumDateIdeaStatus toRemote() => switch (this) {
    DateIdeaStatus.saved => EnumDateIdeaStatus.saved,
    DateIdeaStatus.planned => EnumDateIdeaStatus.planned,
    DateIdeaStatus.done => EnumDateIdeaStatus.done,
  };
}
