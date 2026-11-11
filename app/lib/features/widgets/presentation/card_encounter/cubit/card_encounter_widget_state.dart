part of 'card_encounter_widget_cubit.dart';

class const CardEncounterWidgetState({
  final Resource<WidgetOverview> overview = const Loading(),
  final bool isDarkPreview = false,
}) extends Equatable {
  CardEncounterWidgetState copyWith({Resource<WidgetOverview>? overview, bool? isDarkPreview}) {
    return CardEncounterWidgetState(
      overview: overview ?? this.overview,
      isDarkPreview: isDarkPreview ?? this.isDarkPreview,
    );
  }

  @override
  List<Object?> get props => [overview, isDarkPreview];
}
