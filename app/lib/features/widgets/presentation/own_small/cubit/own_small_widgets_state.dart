part of 'own_small_widgets_cubit.dart';

final class const OwnSmallWidgetsState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
}) with Equatable {
  OwnSmallWidgetsState copyWith({Resource<WidgetOverview>? overview, bool? isDarkPreview}) =>
      OwnSmallWidgetsState(
        overview: overview ?? this.overview,
        isDarkPreview: isDarkPreview ?? this.isDarkPreview,
      );

  @override
  List<Object?> get props => [overview, isDarkPreview];
}
