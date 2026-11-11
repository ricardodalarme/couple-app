part of 'couple_photos_widget_cubit.dart';

final class const CouplePhotosWidgetState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
}) with Equatable {
  CouplePhotosWidgetState copyWith({Resource<WidgetOverview>? overview, bool? isDarkPreview}) =>
      CouplePhotosWidgetState(
        overview: overview ?? this.overview,
        isDarkPreview: isDarkPreview ?? this.isDarkPreview,
      );

  @override
  List<Object?> get props => [overview, isDarkPreview];
}
