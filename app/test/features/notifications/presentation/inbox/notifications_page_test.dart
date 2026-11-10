import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_inbox.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/notifications_page.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/widgets/notification_tile.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class MockNotificationsCubit() extends MockCubit<NotificationsState> implements NotificationsCubit;

void main() {
  group('NotificationsPage', () {
    late NotificationsCubit notificationsCubit;

    final notification = AppNotification(
      id: 'n1',
      kind: 'post',
      title: 'New post',
      body: 'A new post is available',
      data: const {},
      createdAt: DateTime.utc(2024),
      readAt: null,
    );

    setUp(() {
      notificationsCubit = MockNotificationsCubit();
    });

    tearDown(() => notificationsCubit.close());

    Future<void> pumpPage(WidgetTester tester, NotificationsState state) async {
      when(() => notificationsCubit.state).thenReturn(state);

      await tester.pumpApp(
        BlocProvider.value(value: notificationsCubit, child: const NotificationsPage()),
      );
      await tester.pump();
    }

    testWidgets('renders the title and the notification tile on success', (tester) async {
      await pumpPage(
        tester,
        NotificationsState(
          notifications: Success(NotificationInbox(items: [notification], hasMore: false)),
        ),
      );

      expect(find.text(l10n.notifications.title), findsOneWidget);
      expect(find.byType(NotificationTile), findsOneWidget);
      expect(find.text(notification.title), findsOneWidget);
    });

    testWidgets('renders the empty state when the inbox is empty', (tester) async {
      await pumpPage(
        tester,
        const NotificationsState(
          notifications: Success(NotificationInbox(items: [], hasMore: false)),
        ),
      );

      expect(find.byType(BaseEmptyState), findsOneWidget);
      expect(find.text(l10n.notifications.emptyTitle), findsOneWidget);
      expect(find.byType(NotificationTile), findsNothing);
    });

    testWidgets('renders the error state on failure', (tester) async {
      await pumpPage(
        tester,
        const NotificationsState(
          notifications: Failure(LocalizedException(l10nKey: 'serverError')),
        ),
      );

      expect(find.byType(BaseEmptyState), findsOneWidget);
      expect(find.text(l10n.notifications.textFailure), findsOneWidget);
      expect(find.text(l10n.common.retry), findsOneWidget);
    });
  });
}
