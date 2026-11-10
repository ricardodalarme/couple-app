part of 'profile_setup_cubit.dart';

final class const ProfileSetupState({
  final String name = '',
  final String partnerName = '',
  final AppThemeVariant theme = AppThemeVariant.rose,
  final DateTime? togetherSince,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether the name holds something to save.
  bool get canSave => ProfileSetupCubit.sanitizeName(name).isNotEmpty;

  ProfileSetupState copyWith({
    String? name,
    String? partnerName,
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
