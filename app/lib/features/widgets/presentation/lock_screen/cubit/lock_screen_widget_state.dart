part of 'lock_screen_widget_cubit.dart';

final class const LockScreenWidgetState({final Resource<WidgetOverview> overview = const Loading()})
    with Equatable {
  LockScreenWidgetState copyWith({Resource<WidgetOverview>? overview}) =>
      LockScreenWidgetState(overview: overview ?? this.overview);

  @override
  List<Object?> get props => [overview];
}
