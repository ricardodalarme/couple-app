import 'package:flutter_bloc_starter/features/notifications/data/data_sources/fragments/generated/NotificationFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/mappers/notification_mapper.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationMapper', () {
    test('maps every fragment field to the model', () {
      final fragment = FragmentNotificationFragment(
        id: '1',
        kind: 'comment',
        title: 'title',
        body: 'body',
        data: const {'postId': '2'},
        read_at: DateTime.utc(2024, 1, 2),
        created_at: DateTime.utc(2024),
      );

      final model = fragment.toModel();

      expect(model.id, '1');
      expect(model.kind, 'comment');
      expect(model.title, 'title');
      expect(model.body, 'body');
      expect(model.data, const {'postId': '2'});
      expect(model.createdAt, DateTime.utc(2024));
      expect(model.readAt, DateTime.utc(2024, 1, 2));
      expect(model.isUnread, isFalse);
    });

    test('maps an unread notification without body', () {
      final fragment = FragmentNotificationFragment(
        id: '1',
        kind: 'system',
        title: 'title',
        data: const <String, dynamic>{},
        created_at: DateTime.utc(2024),
      );

      final model = fragment.toModel();

      expect(model.body, isNull);
      expect(model.readAt, isNull);
      expect(model.isUnread, isTrue);
    });

    test('falls back to an empty map when data is not a map', () {
      final fragment = FragmentNotificationFragment(
        id: '1',
        kind: 'system',
        title: 'title',
        data: <String, dynamic>{'unsupported': true},
        created_at: DateTime.utc(2024),
      );

      expect(fragment.toModel().data, isA<Map<String, dynamic>>());

      final listFragment = FragmentNotificationFragment(
        id: '1',
        kind: 'system',
        title: 'title',
        data: const ['unsupported'],
        created_at: DateTime.utc(2024),
      );

      expect(listFragment.toModel().data, isEmpty);
      expect(listFragment.toModel(), isA<AppNotification>());
    });
  });
}
