import 'package:equatable/equatable.dart';

final class const AppNotification({
  required final String id,
  required final String kind,
  required final String title,
  required final String? body,
  required final Map<String, dynamic> data,
  required final DateTime createdAt,
  required final DateTime? readAt,
}) with Equatable {
  static final AppNotification fake = AppNotification(
    id: '00000000-0000-0000-0000-000000000000',
    kind: 'system',
    title: 'Lorem ipsum dolor sit amet',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    data: const {},
    createdAt: DateTime.utc(2024),
    readAt: null,
  );

  bool get isUnread => readAt == null;

  AppNotification markedRead(DateTime readAt) => AppNotification(
    id: id,
    kind: kind,
    title: title,
    body: body,
    data: data,
    createdAt: createdAt,
    readAt: readAt,
  );

  @override
  List<Object?> get props => [id, kind, title, body, data, createdAt, readAt];
}
