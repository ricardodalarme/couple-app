part of 'connectivity_cubit.dart';

final class const ConnectivityState({final bool? isOnline}) with Equatable {
  /// `null` while the first check runs.
  bool get isOffline => isOnline == false;

  @override
  List<Object?> get props => [isOnline];
}
