part of 'today_cubit.dart';

final class const TodayState({
  final Resource<TodayHome> home = const Loading(),
  final bool isOffline = false,
  final String? selfName,
  final String? partnerHint,
  final bool isFirstDay = false,
  final bool showUnpairNotice = false,
  final String? unpairedPartnerName,
  final Resource<void> endPauseAction = const Initial(),
}) with Equatable {
  TodayState copyWith({
    Resource<void>? endPauseAction,
    Resource<TodayHome>? home,
    bool? isOffline,
    String? selfName,
    String? partnerHint,
    bool? isFirstDay,
    bool? showUnpairNotice,
    String? unpairedPartnerName,
  }) {
    return TodayState(
      home: home ?? this.home,
      isOffline: isOffline ?? this.isOffline,
      selfName: selfName ?? this.selfName,
      partnerHint: partnerHint ?? this.partnerHint,
      isFirstDay: isFirstDay ?? this.isFirstDay,
      showUnpairNotice: showUnpairNotice ?? this.showUnpairNotice,
      unpairedPartnerName: unpairedPartnerName ?? this.unpairedPartnerName,
      endPauseAction: endPauseAction ?? this.endPauseAction,
    );
  }

  @override
  List<Object?> get props => [
    home,
    isOffline,
    selfName,
    partnerHint,
    isFirstDay,
    showUnpairNotice,
    unpairedPartnerName,
    endPauseAction,
  ];
}
