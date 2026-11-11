part of 'history_avatar_cubit.dart';

final class const HistoryAvatarState({
  final Resource<HistoryOverview> overview = const Loading(),
  final AvatarKind selectedKind = AvatarKind.initials,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  HistoryAvatarState copyWith({
    Resource<HistoryOverview>? overview,
    AvatarKind? selectedKind,
    Resource<void>? saveAction,
  }) {
    return HistoryAvatarState(
      overview: overview ?? this.overview,
      selectedKind: selectedKind ?? this.selectedKind,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [overview, selectedKind, saveAction];
}
