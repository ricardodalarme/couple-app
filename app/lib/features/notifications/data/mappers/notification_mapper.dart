import 'package:flutter_bloc_starter/features/notifications/data/data_sources/fragments/generated/NotificationFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';

extension NotificationMapper on FragmentNotificationFragment {
  AppNotification toModel() {
    final rawData = data;

    return AppNotification(
      id: id,
      kind: kind,
      title: title,
      body: body,
      data: rawData is Map<String, dynamic> ? rawData : const {},
      createdAt: created_at,
      readAt: read_at,
    );
  }
}
