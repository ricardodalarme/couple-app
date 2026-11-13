part of 'profile_settings_cubit.dart';

final class const ProfileSettingsState({
  final Resource<ProfileDetails> details = const Loading(),
  final Resource<void> saveAction = const Initial(),
  final String? loginProvider,
  final FormInput<String>? nameDraft,
  final FormInput<String>? pronounsDraft,
}) with Equatable {
  /// The loaded fields, or null while loading or failed.
  ProfileDetails? get current => switch (details) {
    Success(:final value) => value,
    _ => null,
  };

  ProfileSettingsState copyWith({
    Resource<ProfileDetails>? details,
    Resource<void>? saveAction,
    String? loginProvider,
    FormInput<String>? nameDraft,
    FormInput<String>? pronounsDraft,
  }) {
    return ProfileSettingsState(
      details: details ?? this.details,
      saveAction: saveAction ?? this.saveAction,
      loginProvider: loginProvider ?? this.loginProvider,
      nameDraft: nameDraft ?? this.nameDraft,
      pronounsDraft: pronounsDraft ?? this.pronounsDraft,
    );
  }

  @override
  List<Object?> get props => [details, saveAction, loginProvider, nameDraft, pronounsDraft];
}
