import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_category.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_work_area.dart';

/// A slip saved on the device that has not reached the server yet.
final class const PendingSlip({
  required final String id,
  required final String body,
  required final DateTime createdAt,
  final SlipCategory? category,
  final String kind = 'quick',
  final String? feeling,
  final String? planNote,
  final SlipWorkArea? workArea,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => PendingSlip(
    id: map['id'] as String,
    body: map['body'] as String,
    createdAt: DateTime.parse(map['createdAt'] as String),
    category: SlipCategory.values.asNameMap()[map['category'] as String?],
    kind: map['kind'] as String? ?? 'quick',
    feeling: map['feeling'] as String?,
    planNote: map['planNote'] as String?,
    workArea: SlipWorkArea.values.asNameMap()[map['workArea'] as String?],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'id': id,
    'body': body,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'category': category?.name,
    'kind': kind,
    'feeling': feeling,
    'planNote': planNote,
    'workArea': workArea?.name,
  };

  @override
  List<Object?> get props => [id, body, createdAt, category, kind, feeling, planNote, workArea];
}
