part of 'touch_cubit.dart';

final class const TouchState({
  final Resource<bool> isEnabled = const Loading(),
  final List<HelpItem> cards = const [],
  final int index = 0,
  final Resource<void> toggleAction = const Initial(),
}) with Equatable {
  TouchState copyWith({
    Resource<bool>? isEnabled,
    List<HelpItem>? cards,
    int? index,
    Resource<void>? toggleAction,
  }) {
    return TouchState(
      isEnabled: isEnabled ?? this.isEnabled,
      cards: cards ?? this.cards,
      index: index ?? this.index,
      toggleAction: toggleAction ?? this.toggleAction,
    );
  }

  @override
  List<Object?> get props => [isEnabled, cards, index, toggleAction];
}
