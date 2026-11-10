part of 'unpair_done_cubit.dart';

enum SharedItemsChoice() {
  keep,
  delete;

  bool get shouldKeep => this == SharedItemsChoice.keep;
}

final class const UnpairDoneState({
  final SharedItemsChoice? choice,
  final Resource<void> resolveAction = const Initial(),
}) with Equatable {
  /// Whether the shared-item choice was applied and the person can continue.
  bool get canContinue => choice != null && resolveAction is Success;

  UnpairDoneState copyWith({SharedItemsChoice? choice, Resource<void>? resolveAction}) {
    return UnpairDoneState(
      choice: choice ?? this.choice,
      resolveAction: resolveAction ?? this.resolveAction,
    );
  }

  @override
  List<Object?> get props => [choice, resolveAction];
}
