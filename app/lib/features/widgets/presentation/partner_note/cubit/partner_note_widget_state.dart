part of 'partner_note_widget_cubit.dart';

class const PartnerNoteWidgetState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
  final Resource<void> toggleAction = const Initial(),
}) extends Equatable {
  PartnerNoteWidgetState copyWith({
    Resource<WidgetOverview>? overview,
    bool? isDarkPreview,
    Resource<void>? toggleAction,
  }) {
    return PartnerNoteWidgetState(
      overview: overview ?? this.overview,
      isDarkPreview: isDarkPreview ?? this.isDarkPreview,
      toggleAction: toggleAction ?? this.toggleAction,
    );
  }

  @override
  List<Object?> get props => [overview, isDarkPreview, toggleAction];
}
