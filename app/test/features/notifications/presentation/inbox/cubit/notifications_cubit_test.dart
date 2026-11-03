import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_inbox.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationsRepository() extends Mock implements NotificationsRepository;

void main() {
  group('NotificationsCubit', () {
    late NotificationsRepository notificationsRepository;
    late NotificationsCubit notificationsCubit;

    final unread = AppNotification(
      id: 'n1',
      kind: 'system',
      title: 'title',
      body: 'body',
      data: const {},
      createdAt: DateTime.utc(2024),
      readAt: null,
    );

    final read = AppNotification(
      id: 'n2',
      kind: 'system',
      title: 'title',
      body: null,
      data: const {},
      createdAt: DateTime.utc(2024),
      readAt: DateTime.utc(2024, 1, 2),
    );

    final inbox = NotificationInbox(items: [unread, read], hasMore: true);

    setUp(() {
      notificationsRepository = MockNotificationsRepository();
      notificationsCubit = NotificationsCubit(notificationsRepository: notificationsRepository);
    });

    tearDown(() {
      notificationsCubit.close();
    });

    test('initial state is correct', () {
      expect(notificationsCubit.state, const NotificationsState());
    });

    blocTest<NotificationsCubit, NotificationsState>(
      'getNotifications emits loading then success',
      setUp: () {
        when(() => notificationsRepository.getNotifications()).thenAnswer((_) async => inbox);
      },
      build: () => notificationsCubit,
      act: (cubit) => cubit.getNotifications(),
      expect: () => [
        const NotificationsState(notifications: Loading()),
        NotificationsState(notifications: Success(inbox)),
      ],
    );

    blocTest<NotificationsCubit, NotificationsState>(
      'getNotifications emits loading then failure',
      setUp: () {
        when(() => notificationsRepository.getNotifications()).thenThrow(Exception('boom'));
      },
      build: () => notificationsCubit,
      act: (cubit) => cubit.getNotifications(),
      expect: () => [
        const NotificationsState(notifications: Loading()),
        isA<NotificationsState>().having(
          (state) => state.notifications,
          'notifications',
          isA<Failure>(),
        ),
      ],
    );

    blocTest<NotificationsCubit, NotificationsState>(
      'markRead updates the item readAt and emits success action',
      setUp: () {
        when(() => notificationsRepository.getNotifications()).thenAnswer((_) async => inbox);
        when(() => notificationsRepository.markRead(['n1'])).thenAnswer((_) async {});
      },
      build: () => notificationsCubit,
      act: (cubit) async {
        await cubit.getNotifications();
        await cubit.markRead('n1');
      },
      skip: 3,
      expect: () => [
        isA<NotificationsState>()
            .having((state) => state.markReadAction, 'markReadAction', const Success<void>(null))
            .having(
              (state) =>
                  (state.notifications as Success<NotificationInbox>).value.items.first.readAt,
              'readAt',
              isNotNull,
            )
            .having(
              (state) => (state.notifications as Success<NotificationInbox>).value.unreadCount,
              'unreadCount',
              0,
            ),
      ],
    );

    blocTest<NotificationsCubit, NotificationsState>(
      'markAllRead marks every item as read',
      setUp: () {
        when(() => notificationsRepository.getNotifications()).thenAnswer((_) async => inbox);
        when(() => notificationsRepository.markAllRead()).thenAnswer((_) async {});
      },
      build: () => notificationsCubit,
      act: (cubit) async {
        await cubit.getNotifications();
        await cubit.markAllRead();
      },
      skip: 2,
      verify: (cubit) {
        expect(cubit.state.notifications, isA<Success<NotificationInbox>>());
        expect(cubit.state.hasUnread, isFalse);
        expect(cubit.state.unreadCount, 0);
        expect(cubit.state.markAllReadAction, const Success<void>(null));
      },
    );

    blocTest<NotificationsCubit, NotificationsState>(
      'markRead keeps the inbox when the repository fails',
      setUp: () {
        when(() => notificationsRepository.getNotifications()).thenAnswer((_) async => inbox);
        when(() => notificationsRepository.markRead(['n1'])).thenThrow(Exception('boom'));
      },
      build: () => notificationsCubit,
      act: (cubit) async {
        await cubit.getNotifications();
        await cubit.markRead('n1');
      },
      skip: 2,
      verify: (cubit) {
        expect(cubit.state.markReadAction, isA<Failure>());
        expect(cubit.state.notifications, Success(inbox));
      },
    );
  });
}
