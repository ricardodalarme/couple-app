import 'package:equatable/equatable.dart';

/// A slip saved on the device that has not reached the server yet.
final class const PendingSlip({
  required final String id,
  required final String body,
  required final DateTime createdAt,
  final String? category,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => PendingSlip(
    id: map['id'] as String,
    body: map['body'] as String,
    createdAt: DateTime.parse(map['createdAt'] as String),
    category: map['category'] as String?,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'id': id,
    'body': body,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'category': category,
  };

  @override
  List<Object?> get props => [id, body, createdAt, category];
}
