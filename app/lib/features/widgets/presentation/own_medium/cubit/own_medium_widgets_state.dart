part of 'own_medium_widgets_cubit.dart';

final class const OwnMediumWidgetsState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
}) with Equatable {
  OwnMediumWidgetsState copyWith({Resource<WidgetOverview>? overview, bool? isDarkPreview}) =>
      OwnMediumWidgetsState(
        overview: overview ?? this.overview,
        isDarkPreview: isDarkPreview ?? this.isDarkPreview,
      );

  @override
  List<Object?> get props => [overview, isDarkPreview];
}
