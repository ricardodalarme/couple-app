part of 'rituals_cubit.dart';

final class const RitualsState({
  final Resource<List<Ritual>> rituals = const Loading(),
  final Resource<void> completeAction = const Initial(),
}) with Equatable {
  RitualsState copyWith({Resource<List<Ritual>>? rituals, Resource<void>? completeAction}) {
    return RitualsState(
      rituals: rituals ?? this.rituals,
      completeAction: completeAction ?? this.completeAction,
    );
  }

  @override
  List<Object?> get props => [rituals, completeAction];
}
