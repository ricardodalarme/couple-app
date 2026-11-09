import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/widgets/notifications_bell_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui/ui.dart';

import '../../../../../test_helpers/pump_app.dart';

class MockNotificationsBadgeCubit()
    extends MockCubit<NotificationsBadgeState>
    implements NotificationsBadgeCubit;

void main() {
  group('NotificationsBellButton', () {
    late NotificationsBadgeCubit notificationsBadgeCubit;

    setUp(() {
      notificationsBadgeCubit = MockNotificationsBadgeCubit();
    });

    tearDown(() => notificationsBadgeCubit.close());

    Future<void> pumpButton(WidgetTester tester, Resource<bool> hasUnread) async {
      when(() => notificationsBadgeCubit.state)
          .thenReturn(NotificationsBadgeState(hasUnread: hasUnread));

      await tester.pumpApp(
        BlocProvider.value(
          value: notificationsBadgeCubit,
          child: const BaseView(body: Center(child: NotificationsBellButton())),
        ),
      );
    }

    testWidgets('shows the dot when there are unread notifications', (tester) async {
      await pumpButton(tester, const Success(true));

      expect(find.byKey(const Key('notification-badge-dot')), findsOneWidget);
    });

    testWidgets('hides the dot when nothing is unread', (tester) async {
      await pumpButton(tester, const Success(false));

      expect(find.byKey(const Key('notification-badge-dot')), findsNothing);
    });
  });
}
