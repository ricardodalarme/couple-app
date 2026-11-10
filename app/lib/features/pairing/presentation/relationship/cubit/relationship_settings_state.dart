part of 'relationship_settings_cubit.dart';

final class const RelationshipSettingsState({
  final Resource<RelationshipDetails> details = const Loading(),
  final Resource<void> saveAction = const Initial(),
  final bool? hasPartner,
  final bool partnerLoadFailed = false,
}) with Equatable {
  /// The loaded relationship fields, or null while loading or failed.
  RelationshipDetails? get current => switch (details) {
    Success(:final value) => value,
    _ => null,
  };

  RelationshipSettingsState copyWith({
    Resource<RelationshipDetails>? details,
    Resource<void>? saveAction,
    bool? hasPartner,
    bool? partnerLoadFailed,
  }) {
    return RelationshipSettingsState(
      details: details ?? this.details,
      saveAction: saveAction ?? this.saveAction,
      hasPartner: hasPartner ?? this.hasPartner,
      partnerLoadFailed: partnerLoadFailed ?? this.partnerLoadFailed,
    );
  }

  @override
  List<Object?> get props => [details, saveAction, hasPartner, partnerLoadFailed];
}
