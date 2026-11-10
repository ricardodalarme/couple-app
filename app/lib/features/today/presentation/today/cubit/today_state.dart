part of 'today_cubit.dart';

final class const TodayState({
  final Resource<TodayHome> home = const Loading(),
  final bool isOffline = false,
  final String? selfName,
}) with Equatable {
  TodayState copyWith({Resource<TodayHome>? home, bool? isOffline, String? selfName}) {
    return TodayState(
      home: home ?? this.home,
      isOffline: isOffline ?? this.isOffline,
      selfName: selfName ?? this.selfName,
    );
  }

  @override
  List<Object?> get props => [home, isOffline, selfName];
}
