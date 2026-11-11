import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';

/// Segment tab in the widgets gallery (`X-145`).
enum WidgetGallerySegment() {
  own,
  couple,
}

/// Widget families offered by the app across home screen and lock screen.
enum WidgetFamilyKind() {
  ownSmall,
  ownMedium,
  lockScreen,
  coupleCounter,
  couplePhotos,
  partnerNote,
  cardEncounter,
}

/// Content source selected in the widget configuration screen (`X-154`).
enum WidgetContentSource() {
  favorites,
  recent,
  dailyIdea,
}

/// Rotation frequency selected in the widget configuration screen (`X-154`).
enum WidgetRotationCadence() {
  daily,
  everySixHours,
  manual,
}

/// User-configurable widget privacy and rotation settings (`X-154`).
final class const WidgetPreferences({
  required final String profileId,
  required final bool showNames,
  required final bool hideInDiscreet,
  required final bool allowPartnerNotes,
  required final bool onLockScreen,
  required final WidgetContentSource contentSource,
  required final WidgetRotationCadence rotationCadence,
}) with Equatable {
  factory fake() => const WidgetPreferences(
    profileId: '00000000-0000-0000-0000-000000000000',
    showNames: true,
    hideInDiscreet: true,
    allowPartnerNotes: true,
    onLockScreen: false,
    contentSource: WidgetContentSource.favorites,
    rotationCadence: WidgetRotationCadence.daily,
  );

  WidgetPreferences copyWith({
    String? profileId,
    bool? showNames,
    bool? hideInDiscreet,
    bool? allowPartnerNotes,
    bool? onLockScreen,
    WidgetContentSource? contentSource,
    WidgetRotationCadence? rotationCadence,
  }) => WidgetPreferences(
    profileId: profileId ?? this.profileId,
    showNames: showNames ?? this.showNames,
    hideInDiscreet: hideInDiscreet ?? this.hideInDiscreet,
    allowPartnerNotes: allowPartnerNotes ?? this.allowPartnerNotes,
    onLockScreen: onLockScreen ?? this.onLockScreen,
    contentSource: contentSource ?? this.contentSource,
    rotationCadence: rotationCadence ?? this.rotationCadence,
  );

  @override
  List<Object?> get props => [
    profileId,
    showNames,
    hideInDiscreet,
    allowPartnerNotes,
    onLockScreen,
    contentSource,
    rotationCadence,
  ];
}

/// Combined state returned for the gallery, preview boards, and configuration screen.
final class const WidgetOverview({
  required final WidgetPayload payload,
  required final WidgetPreferences preferences,
  final bool hasPhoto = false,
}) with Equatable {
  factory fake() =>
      WidgetOverview(payload: WidgetPayload.fake(), preferences: WidgetPreferences.fake());

  WidgetOverview copyWith({
    WidgetPayload? payload,
    WidgetPreferences? preferences,
    bool? hasPhoto,
  }) => WidgetOverview(
    payload: payload ?? this.payload,
    preferences: preferences ?? this.preferences,
    hasPhoto: hasPhoto ?? this.hasPhoto,
  );

  @override
  List<Object?> get props => [payload, preferences, hasPhoto];
}
