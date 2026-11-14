import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea_status.dart';

extension EnumGiftBudgetMapper on EnumGiftBudget {
  GiftBudget? toModel() => switch (this) {
    EnumGiftBudget.free => GiftBudget.free,
    EnumGiftBudget.low => GiftBudget.low,
    EnumGiftBudget.medium => GiftBudget.medium,
    EnumGiftBudget.high => GiftBudget.high,
    EnumGiftBudget.$unknown => null,
  };
}

extension GiftBudgetMapper on GiftBudget {
  EnumGiftBudget toRemote() => switch (this) {
    GiftBudget.free => EnumGiftBudget.free,
    GiftBudget.low => EnumGiftBudget.low,
    GiftBudget.medium => EnumGiftBudget.medium,
    GiftBudget.high => EnumGiftBudget.high,
  };
}

extension EnumGiftIdeaStatusMapper on EnumGiftIdeaStatus {
  GiftIdeaStatus toModel() => switch (this) {
    EnumGiftIdeaStatus.idea => GiftIdeaStatus.idea,
    EnumGiftIdeaStatus.planned => GiftIdeaStatus.planned,
    EnumGiftIdeaStatus.given => GiftIdeaStatus.given,
    EnumGiftIdeaStatus.$unknown => GiftIdeaStatus.idea,
  };
}

extension GiftIdeaStatusMapper on GiftIdeaStatus {
  EnumGiftIdeaStatus toRemote() => switch (this) {
    GiftIdeaStatus.idea => EnumGiftIdeaStatus.idea,
    GiftIdeaStatus.planned => EnumGiftIdeaStatus.planned,
    GiftIdeaStatus.given => EnumGiftIdeaStatus.given,
  };
}
