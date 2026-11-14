import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_plan.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_status.dart';

extension EnumEntitlementPlanMapper on EnumEntitlementPlan {
  /// An unknown plan reads as null so the screen falls back to a plain "Plus is active".
  PlusPlan? toModel() => switch (this) {
    EnumEntitlementPlan.plus_monthly => PlusPlan.monthly,
    EnumEntitlementPlan.plus_annual => PlusPlan.annual,
    EnumEntitlementPlan.plus_gift => PlusPlan.gift,
    EnumEntitlementPlan.$unknown => null,
  };
}

extension EnumEntitlementStatusMapper on EnumEntitlementStatus {
  /// An unknown status reads as null so the screen hides the status row.
  PlusStatus? toModel() => switch (this) {
    EnumEntitlementStatus.trialing => PlusStatus.trialing,
    EnumEntitlementStatus.active => PlusStatus.active,
    EnumEntitlementStatus.grace => PlusStatus.grace,
    EnumEntitlementStatus.billing_issue => PlusStatus.billingIssue,
    EnumEntitlementStatus.expired => PlusStatus.expired,
    EnumEntitlementStatus.refunded => PlusStatus.refunded,
    EnumEntitlementStatus.$unknown => null,
  };
}
