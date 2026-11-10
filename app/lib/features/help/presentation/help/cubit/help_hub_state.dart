part of 'help_hub_cubit.dart';

final class const HelpHubState({
  final Resource<void> flushAction = const Initial(),
  final int pending = 0,
  final int discarded = 0,
}) with Equatable {
  HelpHubState copyWith({Resource<void>? flushAction, int? pending, int? discarded}) =>
      HelpHubState(
        flushAction: flushAction ?? this.flushAction,
        pending: pending ?? this.pending,
        discarded: discarded ?? this.discarded,
      );

  @override
  List<Object?> get props => [flushAction, pending, discarded];
}
