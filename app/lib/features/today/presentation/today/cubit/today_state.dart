part of 'today_cubit.dart';

final class const TodayState({
  final Resource<TodayHome> home = const Loading(),
  final bool isOffline = false,
  final String? selfName,
  final String? partnerHint,
  final bool isFirstDay = false,
}) with Equatable {
  TodayState copyWith({
    Resource<TodayHome>? home,
    bool? isOffline,
    String? selfName,
    String? partnerHint,
    bool? isFirstDay,
  }) {
    return TodayState(
      home: home ?? this.home,
      isOffline: isOffline ?? this.isOffline,
      selfName: selfName ?? this.selfName,
      partnerHint: partnerHint ?? this.partnerHint,
      isFirstDay: isFirstDay ?? this.isFirstDay,
    );
  }

  @override
  List<Object?> get props => [home, isOffline, selfName, partnerHint, isFirstDay];
}
