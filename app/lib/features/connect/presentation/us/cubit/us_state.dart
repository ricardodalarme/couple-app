part of 'us_cubit.dart';

final class const UsState({
  final Resource<void> sendAction = const Initial(),
  final bool wasSent = false,
}) with Equatable {
  UsState copyWith({Resource<void>? sendAction, bool? wasSent}) {
    return UsState(sendAction: sendAction ?? this.sendAction, wasSent: wasSent ?? this.wasSent);
  }

  @override
  List<Object?> get props => [sendAction, wasSent];
}
