part of 'sign_out_cubit.dart';

final class const SignOutState({
  final int pendingSlips = 0,
  final Resource<void> action = const Initial(),
}) with Equatable {
  SignOutState copyWith({int? pendingSlips, Resource<void>? action}) =>
      SignOutState(pendingSlips: pendingSlips ?? this.pendingSlips, action: action ?? this.action);

  @override
  List<Object?> get props => [pendingSlips, action];
}
