import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';

extension EnumLearnedItemTargetMapper on EnumLearnedItemTarget {
  LearnedTarget toModel() => switch (this) {
    EnumLearnedItemTarget.partner_fact => LearnedTarget.partnerFact,
    EnumLearnedItemTarget.date => LearnedTarget.date,
    EnumLearnedItemTarget.memory => LearnedTarget.memory,
    EnumLearnedItemTarget.commitment => LearnedTarget.commitment,
    EnumLearnedItemTarget.$unknown => throw const FormatException('Unknown learning target'),
  };
}

extension LearnedTargetMapper on LearnedTarget {
  EnumLearnedItemTarget toRemote() => switch (this) {
    LearnedTarget.partnerFact => EnumLearnedItemTarget.partner_fact,
    LearnedTarget.date => EnumLearnedItemTarget.date,
    LearnedTarget.memory => EnumLearnedItemTarget.memory,
    LearnedTarget.commitment => EnumLearnedItemTarget.commitment,
  };
}

extension EnumLearnedItemStatusMapper on EnumLearnedItemStatus {
  LearnedStatus toModel() => switch (this) {
    EnumLearnedItemStatus.pending => LearnedStatus.pending,
    EnumLearnedItemStatus.confirmed => LearnedStatus.confirmed,
    EnumLearnedItemStatus.rejected => LearnedStatus.rejected,
    EnumLearnedItemStatus.$unknown => throw const FormatException('Unknown learning status'),
  };
}

extension LearnedStatusMapper on LearnedStatus {
  EnumLearnedItemStatus toRemote() => switch (this) {
    LearnedStatus.pending => EnumLearnedItemStatus.pending,
    LearnedStatus.confirmed => EnumLearnedItemStatus.confirmed,
    LearnedStatus.rejected => EnumLearnedItemStatus.rejected,
  };
}
