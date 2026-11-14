part of 'guided_repair_cubit.dart';

final class const GuidedRepairState({
  final Resource<GuidedSession> session = const Loading(),
  final RepairFeeling? feeling,
  final FollowUp followUp = FollowUp.none,
  final Resource<void> saveAction = const Initial(),
  final Resource<void> completeAction = const Initial(),
}) with Equatable {
  /// The loaded session, or null while loading or failed.
  GuidedSession? get current => switch (session) {
    Success(:final value) => value,
    _ => null,
  };

  GuidedRepairState copyWith({
    Resource<GuidedSession>? session,
    RepairFeeling? feeling,
    FollowUp? followUp,
    Resource<void>? saveAction,
    Resource<void>? completeAction,
  }) {
    return GuidedRepairState(
      session: session ?? this.session,
      feeling: feeling ?? this.feeling,
      followUp: followUp ?? this.followUp,
      saveAction: saveAction ?? this.saveAction,
      completeAction: completeAction ?? this.completeAction,
    );
  }

  @override
  List<Object?> get props => [session, feeling, followUp, saveAction, completeAction];
}
