import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/queries/generated/MySettings.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';

extension MySettingsMapper on QueryMySettingsmySettings {
  AccountSettings toModel() => AccountSettings(
    theme: theme.toVariant(),
    partnerName: partnerName,
    togetherSince: togetherSince,
    onboardedAt: onboardedAt,
    shareReadReceipts: shareReadReceipts,
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
