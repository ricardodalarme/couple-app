part of 'lock_screen_widget_cubit.dart';

final class const LockScreenWidgetState({
  final Resource<WidgetOverview> overview = const Loading(),
  final Resource<void> endPauseAction = const Initial(),
}) with Equatable {
  LockScreenWidgetState copyWith({
    Resource<WidgetOverview>? overview,
    Resource<void>? endPauseAction,
  }) => LockScreenWidgetState(
    overview: overview ?? this.overview,
    endPauseAction: endPauseAction ?? this.endPauseAction,
  );

  @override
  List<Object?> get props => [overview, endPauseAction];
}
