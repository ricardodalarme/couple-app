import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

/// The editable profile fields read together from the person's own rows.
final class const ProfileDetails({
  required final String profileId,
  required final String displayName,
  final String? pronouns,
  final String timeZone = 'UTC',
  final AppThemeVariant theme = AppThemeVariant.rose,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  const new fake()
    : this(
        profileId: 'fake',
        displayName: 'Nome Sobrenome',
        pronouns: 'ela/dela',
        timeZone: 'America/Sao_Paulo',
      );

  ProfileDetails copyWith({
    String? displayName,
    String? pronouns,
    bool clearPronouns = false,
    String? timeZone,
    AppThemeVariant? theme,
  }) => ProfileDetails(
    profileId: profileId,
    displayName: displayName ?? this.displayName,
    pronouns: clearPronouns ? null : pronouns ?? this.pronouns,
    timeZone: timeZone ?? this.timeZone,
    theme: theme ?? this.theme,
  );

  @override
  List<Object?> get props => [profileId, displayName, pronouns, timeZone, theme];
}
