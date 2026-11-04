import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// A notification delivered through Firebase Cloud Messaging.
class const NotificationMessage({
  /// Unique message identifier assigned by the sender, when present.
  final String? id,

  /// Notification title, when the message carries a notification payload.
  final String? title,

  /// Notification body, when the message carries a notification payload.
  final String? body,

  /// String-valued data payload; empty when the message has none.
  final Map<String, String> data = const {},
}) with Equatable {
  /// Builds a message from the raw payload delivered to a background handler.
  factory fromRemoteMessage(Object message) {
    final remote = message as RemoteMessage;
    return NotificationMessage(
      id: remote.messageId,
      title: remote.notification?.title,
      body: remote.notification?.body,
      data: _stringifyData(remote.data),
    );
  }

  /// Value of the `kind` data key, when present.
  String? get kind => data['kind'];

  /// Value of the `target_id` data key, when present.
  String? get targetId => data['target_id'];

  @override
  List<Object?> get props => [id, title, body, data];
}

Map<String, String> _stringifyData(Map<String, dynamic> data) {
  final result = <String, String>{};
  for (final entry in data.entries) {
    final value = entry.value;
    if (value != null) result[entry.key] = value.toString();
  }
  return result;
}
