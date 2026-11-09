import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/widgets/notification_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui/ui.dart';

import '../../../../../test_helpers/pump_app.dart';

class MockNotificationsCubit() extends MockCubit<NotificationsState> implements NotificationsCubit;

void main() {
  group('NotificationTile', () {
    late NotificationsCubit notificationsCubit;

    final unread = AppNotification(
      id: 'n1',
      kind: 'post',
      title: 'New post',
      body: 'A new post is available',
      data: const {},
      createdAt: DateTime.utc(2024),
      readAt: null,
    );

    final read = AppNotification(
      id: 'n2',
      kind: 'system',
      title: 'Welcome',
      body: null,
      data: const {},
      createdAt: DateTime.utc(2024),
      readAt: DateTime.utc(2024, 1, 2),
    );

    setUp(() {
      notificationsCubit = MockNotificationsCubit();
      when(() => notificationsCubit.markRead(any())).thenAnswer((_) async {});
    });

    tearDown(() => notificationsCubit.close());

    Future<void> pumpTile(WidgetTester tester, AppNotification notification) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: notificationsCubit,
          child: NotificationTile(notification: notification),
        ),
      );
    }

    testWidgets('shows the unread dot for an unread notification', (tester) async {
      await pumpTile(tester, unread);

      expect(find.byKey(const Key('notification-unread-dot')), findsOneWidget);
      expect(find.text(unread.title), findsOneWidget);
      expect(find.text(unread.body!), findsOneWidget);
    });

    testWidgets('hides the unread dot for a read notification', (tester) async {
      await pumpTile(tester, read);

      expect(find.byKey(const Key('notification-unread-dot')), findsNothing);
    });

    testWidgets('marks the notification as read when tapped', (tester) async {
      await pumpTile(tester, unread);

      await tester.tap(find.byType(NotificationTile));
      await tester.pump();

      verify(() => notificationsCubit.markRead(unread.id)).called(1);
    });
  });
}
