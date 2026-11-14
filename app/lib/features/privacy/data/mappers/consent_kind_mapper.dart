import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';

/// Converts the consent kinds the database stores into the app's enum and back.
extension RemoteConsentKindMapper on EnumConsentKind {
  ConsentKind toModel() => switch (this) {
    EnumConsentKind.sensitive_data => ConsentKind.sensitiveData,
    EnumConsentKind.analytics => ConsentKind.analytics,
    EnumConsentKind.marketing => ConsentKind.marketing,
    EnumConsentKind.ai => ConsentKind.ai,
    EnumConsentKind.terms => ConsentKind.terms,
    EnumConsentKind.sensitive_tracks => ConsentKind.sensitiveTracks,
    EnumConsentKind.$unknown => throw ArgumentError('Unknown consent kind: $this'),
  };
}

extension ConsentKindMapper on ConsentKind {
  EnumConsentKind toRemote() => switch (this) {
    ConsentKind.sensitiveData => EnumConsentKind.sensitive_data,
    ConsentKind.analytics => EnumConsentKind.analytics,
    ConsentKind.marketing => EnumConsentKind.marketing,
    ConsentKind.ai => EnumConsentKind.ai,
    ConsentKind.terms => EnumConsentKind.terms,
    ConsentKind.sensitiveTracks => EnumConsentKind.sensitive_tracks,
  };
}
