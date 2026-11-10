import 'package:equatable/equatable.dart';

/// An invite the person created and can still share.
///
/// The server only returns the code once, at creation, so it is kept on the device.
final class const ActiveInvite({
  required final String id,
  required final String code,
  required final DateTime expiresAt,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => ActiveInvite(
    id: map['id'] as String,
    code: map['code'] as String,
    expiresAt: DateTime.parse(map['expiresAt'] as String),
  );

  bool isExpired(DateTime now) => !expiresAt.isAfter(now);

  Map<String, dynamic> toMap() => <String, dynamic>{
    'id': id,
    'code': code,
    'expiresAt': expiresAt.toUtc().toIso8601String(),
  };

  @override
  List<Object?> get props => [id, code, expiresAt];
}
