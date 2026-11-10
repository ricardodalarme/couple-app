part of 'mood_cubit.dart';

final class const MoodState({
  final Resource<MoodEntry?> entry = const Loading(),
  final MoodKind? mood,
  final NeedKind? need,
  final MoodShare share = MoodShare.none,
  final String? partnerName,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether a mood is chosen and a need is present when the need is shared.
  bool get canSave =>
      mood != null && !saveAction.isLoading && (share != MoodShare.moodNeed || need != null);

  MoodState copyWith({
    Resource<MoodEntry?>? entry,
    MoodKind? mood,
    NeedKind? need,
    MoodShare? share,
    String? partnerName,
    Resource<void>? saveAction,
    bool clearMood = false,
    bool clearNeed = false,
    bool clearPartnerName = false,
  }) {
    return MoodState(
      entry: entry ?? this.entry,
      mood: clearMood ? null : mood ?? this.mood,
      need: clearNeed ? null : need ?? this.need,
      share: share ?? this.share,
      partnerName: clearPartnerName ? partnerName : partnerName ?? this.partnerName,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [entry, mood, need, share, partnerName, saveAction];
}
