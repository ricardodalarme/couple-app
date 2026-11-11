part of 'couple_photos_widget_cubit.dart';

final class const CouplePhotosWidgetState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
  final Resource<void> chooseAction = const Initial(),
  final Resource<void> removeAction = const Initial(),
  final Uint8List? localPreview,
}) with Equatable {
  CouplePhotosWidgetState copyWith({
    Resource<WidgetOverview>? overview,
    bool? isDarkPreview,
    Resource<void>? chooseAction,
    Resource<void>? removeAction,
    Uint8List? localPreview,
    bool clearLocalPreview = false,
  }) => CouplePhotosWidgetState(
    overview: overview ?? this.overview,
    isDarkPreview: isDarkPreview ?? this.isDarkPreview,
    chooseAction: chooseAction ?? this.chooseAction,
    removeAction: removeAction ?? this.removeAction,
    localPreview: clearLocalPreview ? null : localPreview ?? this.localPreview,
  );

  @override
  List<Object?> get props => [overview, isDarkPreview, chooseAction, removeAction, localPreview];
}
