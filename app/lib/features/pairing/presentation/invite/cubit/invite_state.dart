part of 'invite_cubit.dart';

final class const InviteState({
  final Resource<ActiveInvite> invite = const Loading(),
  final String? partnerName,
  final bool hasShared = false,
  final Resource<void> revokeAction = const Initial(),
}) with Equatable {
  InviteState copyWith({
    Resource<ActiveInvite>? invite,
    String? partnerName,
    bool? hasShared,
    Resource<void>? revokeAction,
  }) {
    return InviteState(
      invite: invite ?? this.invite,
      partnerName: partnerName ?? this.partnerName,
      hasShared: hasShared ?? this.hasShared,
      revokeAction: revokeAction ?? this.revokeAction,
    );
  }

  @override
  List<Object?> get props => [invite, partnerName, hasShared, revokeAction];
}
