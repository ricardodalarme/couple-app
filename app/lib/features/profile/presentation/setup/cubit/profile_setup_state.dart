part of 'profile_setup_cubit.dart';

final class const ProfileSetupState({
  final FormInput<String> name = const FormInput(''),
  final FormInput<String> partnerName = const FormInput(''),
  final AppThemeVariant theme = AppThemeVariant.rose,
  final DateTime? togetherSince,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  ProfileSetupState copyWith({
    FormInput<String>? name,
    FormInput<String>? partnerName,
    AppThemeVariant? theme,
    DateTime? togetherSince,
    Resource<void>? saveAction,
  }) {
    return ProfileSetupState(
      name: name ?? this.name,
      partnerName: partnerName ?? this.partnerName,
      theme: theme ?? this.theme,
      togetherSince: togetherSince ?? this.togetherSince,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [name, partnerName, theme, togetherSince, saveAction];
}
