import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/remote/queries/generated/MySettings.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_goal_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_phase_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';

extension MySettingsMapper on QueryMySettingsmySettings {
  AccountSettings toModel() => AccountSettings(
    theme: theme.toVariant(),
    profileId: profileId,
    timeZone: timeZone,
    partnerName: partnerName,
    togetherSince: togetherSince,
    onboardedAt: onboardedAt,
    shareReadReceipts: shareReadReceipts,
    widgetInDiscreet: widgetInDiscreet,
    heavyDaySharing: heavyDaySharing.toModel(),
    phase: phase?.toModel(),
    goals: [for (final goal in goals) ?goal?.toRelationshipGoal()],
    locale: locale,
  );
}

extension EnumAppThemeMapper on EnumAppTheme {
  AppThemeVariant toVariant() => switch (this) {
    .azul => AppThemeVariant.blue,
    .neutro => AppThemeVariant.neutral,
    _ => AppThemeVariant.rose,
  };
}

extension AppThemeVariantMapper on AppThemeVariant {
  EnumAppTheme toServerTheme() => switch (this) {
    .blue => EnumAppTheme.azul,
    .neutral => EnumAppTheme.neutro,
    .rose => EnumAppTheme.rosa,
  };
}

extension EnumHeavyDaySharingMapper on EnumHeavyDaySharing {
  /// An unknown setting is treated as off.
  HeavyDaySharing toModel() => switch (this) {
    EnumHeavyDaySharing.off || EnumHeavyDaySharing.$unknown => HeavyDaySharing.off,
    EnumHeavyDaySharing.ask => HeavyDaySharing.ask,
    EnumHeavyDaySharing.always => HeavyDaySharing.always,
  };
}

extension HeavyDaySharingMapper on HeavyDaySharing {
  EnumHeavyDaySharing toRemote() => switch (this) {
    HeavyDaySharing.off => EnumHeavyDaySharing.off,
    HeavyDaySharing.ask => EnumHeavyDaySharing.ask,
    HeavyDaySharing.always => EnumHeavyDaySharing.always,
  };
}
