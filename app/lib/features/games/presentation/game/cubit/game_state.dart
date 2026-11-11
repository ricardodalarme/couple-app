part of 'game_cubit.dart';

final class const GameState({
  final Resource<GamePlay> play = const Loading(),
  final String draft = '',
  final Resource<void> action = const Initial(),
}) with Equatable {
  /// The loaded game, or null while loading or failed.
  GamePlay? get current => switch (play) {
    Success(:final value) => value,
    _ => null,
  };

  /// Whether an invitation, answer or other change is being sent.
  bool get isBusy => action.isLoading;

  bool get canSubmit => draft.trim().isNotEmpty && !isBusy;

  GameState copyWith({Resource<GamePlay>? play, String? draft, Resource<void>? action}) {
    return GameState(
      play: play ?? this.play,
      draft: draft ?? this.draft,
      action: action ?? this.action,
    );
  }

  @override
  List<Object?> get props => [play, draft, action];
}
