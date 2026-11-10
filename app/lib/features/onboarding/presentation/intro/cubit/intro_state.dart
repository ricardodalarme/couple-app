part of 'intro_cubit.dart';

final class const IntroState({
  final String? phase,
  final List<String> goals = const [],
  final AppThemeVariant theme = AppThemeVariant.rose,
}) with Equatable {
  IntroState copyWith({
    String? phase,
    List<String>? goals,
    AppThemeVariant? theme,
    bool clearPhase = false,
  }) {
    return IntroState(
      phase: clearPhase ? null : phase ?? this.phase,
      goals: goals ?? this.goals,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [phase, goals, theme];
}
