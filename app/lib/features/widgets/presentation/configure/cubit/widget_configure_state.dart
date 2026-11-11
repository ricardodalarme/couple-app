part of 'widget_configure_cubit.dart';

final class const WidgetConfigureState({
  final Resource<WidgetOverview> overview = const Loading(),
  final WidgetPreferences draft = const WidgetPreferences(
    profileId: '',
    showNames: false,
    hideInDiscreet: true,
    allowPartnerNotes: false,
    onLockScreen: false,
    contentSource: WidgetContentSource.favorites,
    rotationCadence: WidgetRotationCadence.daily,
  ),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  WidgetConfigureState copyWith({
    Resource<WidgetOverview>? overview,
    WidgetPreferences? draft,
    Resource<void>? saveAction,
  }) => WidgetConfigureState(
    overview: overview ?? this.overview,
    draft: draft ?? this.draft,
    saveAction: saveAction ?? this.saveAction,
  );

  @override
  List<Object?> get props => [overview, draft, saveAction];
}
