part of 'widgets_gallery_cubit.dart';

final class const WidgetsGalleryState({
  final Resource<WidgetOverview> overview = const Loading(),
  final WidgetGallerySegment segment = WidgetGallerySegment.own,
}) with Equatable {
  WidgetsGalleryState copyWith({
    Resource<WidgetOverview>? overview,
    WidgetGallerySegment? segment,
  }) => WidgetsGalleryState(overview: overview ?? this.overview, segment: segment ?? this.segment);

  @override
  List<Object?> get props => [overview, segment];
}
