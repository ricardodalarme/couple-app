part of 'couple_counter_widget_cubit.dart';

final class const CoupleCounterWidgetState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
}) with Equatable {
  CoupleCounterWidgetState copyWith({Resource<WidgetOverview>? overview, bool? isDarkPreview}) =>
      CoupleCounterWidgetState(
        overview: overview ?? this.overview,
        isDarkPreview: isDarkPreview ?? this.isDarkPreview,
      );

  @override
  List<Object?> get props => [overview, isDarkPreview];
}
