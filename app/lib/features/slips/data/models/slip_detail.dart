import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_category.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_work_area.dart';

/// One slip with everything needed to read, edit and decide on it.
final class const SlipDetail({
  required final String id,
  required final String body,
  required final String kind,
  required final DateTime createdAt,
  required final bool forCard,
  final String? feeling,
  final String? planNote,
  final SlipCategory? category,
  final SlipWorkArea? workArea,
  final bool isArchived = false,
  final bool wasInCard = false,
  final bool isInJar = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => SlipDetail(
    id: 'fake',
    body: 'Fez café sem eu pedir',
    kind: 'quick',
    createdAt: DateTime(2026),
    forCard: true,
  );

  /// Whether the slip may appear in a card.
  bool get canGoInCard => kind != 'invisible';

  SlipDetail copyWith({
    String? body,
    String? feeling,
    String? planNote,
    bool? forCard,
    bool? isArchived,
    bool? isInJar,
  }) => SlipDetail(
    id: id,
    body: body ?? this.body,
    kind: kind,
    createdAt: createdAt,
    forCard: forCard ?? this.forCard,
    feeling: feeling ?? this.feeling,
    planNote: planNote ?? this.planNote,
    category: category,
    workArea: workArea,
    isArchived: isArchived ?? this.isArchived,
    wasInCard: wasInCard,
    isInJar: isInJar ?? this.isInJar,
  );

  @override
  List<Object?> get props => [
    id,
    body,
    kind,
    createdAt,
    forCard,
    feeling,
    planNote,
    category,
    workArea,
    isArchived,
    wasInCard,
    isInJar,
  ];
}
