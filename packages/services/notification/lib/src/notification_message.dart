import 'package:equatable/equatable.dart';

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
  /// Value of the `kind` data key, when present.
  String? get kind => data['kind'];

  /// Value of the `target_id` data key, when present.
  String? get targetId => data['target_id'];

  @override
  List<Object?> get props => [id, title, body, data];
}
