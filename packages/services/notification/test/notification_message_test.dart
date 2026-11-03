import 'package:flutter_test/flutter_test.dart';
import 'package:notification_service/notification_service.dart';

void main() {
  group('NotificationMessage', () {
    test('exposes generic kind and target id from the data payload', () {
      const message = NotificationMessage(
        id: '1',
        title: 'Title',
        body: 'Body',
        data: {'kind': 'post', 'target_id': '12'},
      );

      expect(message.kind, 'post');
      expect(message.targetId, '12');
    });

    test('ignores missing kind and target id', () {
      const message = NotificationMessage(id: '1');

      expect(message.kind, isNull);
      expect(message.targetId, isNull);
    });
  });
}
