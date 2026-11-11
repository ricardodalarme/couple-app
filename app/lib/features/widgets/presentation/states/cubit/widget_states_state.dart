part of 'widget_states_cubit.dart';

class const WidgetStatesState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
  final Resource<void> discreetToggleAction = const Initial(),
}) extends Equatable {
  WidgetStatesState copyWith({
    Resource<WidgetOverview>? overview,
    bool? isDarkPreview,
    Resource<void>? discreetToggleAction,
  }) {
    return WidgetStatesState(
      overview: overview ?? this.overview,
      isDarkPreview: isDarkPreview ?? this.isDarkPreview,
      discreetToggleAction: discreetToggleAction ?? this.discreetToggleAction,
    );
  }

  @override
  List<Object?> get props => [overview, isDarkPreview, discreetToggleAction];
}
