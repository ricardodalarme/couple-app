part of 'accept_invite_cubit.dart';

/// What happened to a typed invite code.
enum AcceptOutcome() {
  /// The two people are connected.
  connected,

  /// The code is unknown, expired, used or the person's own.
  unusable,
}

final class const AcceptInviteState({
  final String code = '',
  final Resource<AcceptOutcome> acceptAction = const Initial(),
  final String? partnerName,
  final String? selfName,
}) with Equatable {
  /// Whether the code has the length the server issues.
  bool get canAccept => code.length == inviteCodeLength;

  AcceptInviteState copyWith({
    String? code,
    Resource<AcceptOutcome>? acceptAction,
    String? partnerName,
    String? selfName,
  }) {
    return AcceptInviteState(
      code: code ?? this.code,
      acceptAction: acceptAction ?? this.acceptAction,
      partnerName: partnerName ?? this.partnerName,
      selfName: selfName ?? this.selfName,
    );
  }

  @override
  List<Object?> get props => [code, acceptAction, partnerName, selfName];
}
