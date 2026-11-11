part of 'milestone_cubit.dart';

const int milestoneTitleMaxLength = 120;
const int milestoneBodyMaxLength = 500;

final class const MilestoneState({
  final HistoryMilestone? existing,
  final String title = '',
  final String place = '',
  final String body = '',
  final MilestoneKind kind = MilestoneKind.custom,
  final MilestoneDatePrecision precision = MilestoneDatePrecision.day,
  final DateTime? date,
  final bool isShared = true,
  final String? coupleId,
  final String? selfId,
  final Resource<void> saveAction = const Initial(),
  final Resource<void> deleteAction = const Initial(),
}) with Equatable {
  bool get isEditing => existing != null;

  /// A milestone someone else added is shown read-only.
  bool get canEdit => existing == null || existing!.isMine;

  bool get canDelete => existing != null && existing!.isMine;

  bool get isUnknownDate => precision == MilestoneDatePrecision.unknown;

  bool get canSave =>
      canEdit &&
      title.trim().isNotEmpty &&
      title.trim().length <= milestoneTitleMaxLength &&
      body.length <= milestoneBodyMaxLength;

  MilestoneState copyWith({
    HistoryMilestone? existing,
    String? title,
    String? place,
    String? body,
    MilestoneKind? kind,
    MilestoneDatePrecision? precision,
    DateTime? date,
    bool? isShared,
    String? coupleId,
    String? selfId,
    Resource<void>? saveAction,
    Resource<void>? deleteAction,
  }) {
    return MilestoneState(
      existing: existing ?? this.existing,
      title: title ?? this.title,
      place: place ?? this.place,
      body: body ?? this.body,
      kind: kind ?? this.kind,
      precision: precision ?? this.precision,
      date: date ?? this.date,
      isShared: isShared ?? this.isShared,
      coupleId: coupleId ?? this.coupleId,
      selfId: selfId ?? this.selfId,
      saveAction: saveAction ?? this.saveAction,
      deleteAction: deleteAction ?? this.deleteAction,
    );
  }

  @override
  List<Object?> get props => [
    existing,
    title,
    place,
    body,
    kind,
    precision,
    date,
    isShared,
    coupleId,
    selfId,
    saveAction,
    deleteAction,
  ];
}
