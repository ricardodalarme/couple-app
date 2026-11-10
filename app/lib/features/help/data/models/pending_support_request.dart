import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';

/// A support request kept on the device until it reaches the server.
final class const PendingSupportRequest({
  required final String id,
  required final String authorId,
  required final SupportTopic topic,
  required final String message,
  required final DateTime createdAt,
  final String? replyEmail,
  final String? appVersion,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => PendingSupportRequest(
    id: map['id'] as String,
    authorId: map['authorId'] as String,
    topic: SupportTopic.fromValue(map['topic'] as String),
    message: map['message'] as String,
    createdAt: DateTime.parse(map['createdAt'] as String),
    replyEmail: map['replyEmail'] as String?,
    appVersion: map['appVersion'] as String?,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'id': id,
    'authorId': authorId,
    'topic': topic.value,
    'message': message,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'replyEmail': replyEmail,
    'appVersion': appVersion,
  };

  @override
  List<Object?> get props => [id, authorId, topic, message, createdAt, replyEmail, appVersion];
}
