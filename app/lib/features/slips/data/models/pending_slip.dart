import 'package:equatable/equatable.dart';

/// A slip saved on the device that has not reached the server yet.
final class const PendingSlip({
  required final String id,
  required final String body,
  required final DateTime createdAt,
  final String? category,
  final String kind = 'quick',
  final String? feeling,
  final String? planNote,
  final String? workArea,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => PendingSlip(
    id: map['id'] as String,
    body: map['body'] as String,
    createdAt: DateTime.parse(map['createdAt'] as String),
    category: map['category'] as String?,
    kind: map['kind'] as String? ?? 'quick',
    feeling: map['feeling'] as String?,
    planNote: map['planNote'] as String?,
    workArea: map['workArea'] as String?,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'id': id,
    'body': body,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'category': category,
    'kind': kind,
    'feeling': feeling,
    'planNote': planNote,
    'workArea': workArea,
  };

  @override
  List<Object?> get props => [id, body, createdAt, category, kind, feeling, planNote, workArea];
}
