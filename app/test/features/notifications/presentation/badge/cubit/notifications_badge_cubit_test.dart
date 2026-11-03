import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationsRepository() extends Mock implements NotificationsRepository;

void main() {
  group('NotificationsBadgeCubit', () {
    late NotificationsRepository notificationsRepository;
    late NotificationsBadgeCubit notificationsBadgeCubit;

    setUp(() {
      notificationsRepository = MockNotificationsRepository();
      notificationsBadgeCubit = NotificationsBadgeCubit(
        notificationsRepository: notificationsRepository,
      );
    });

    tearDown(() {
      notificationsBadgeCubit.close();
    });

    test('initial state is correct', () {
      expect(notificationsBadgeCubit.state, const NotificationsBadgeState());
      expect(notificationsBadgeCubit.state.unread, isFalse);
    });

    blocTest<NotificationsBadgeCubit, NotificationsBadgeState>(
      'getHasUnread emits loading then success when unread notifications exist',
      setUp: () {
        when(() => notificationsRepository.hasUnreadNotifications()).thenAnswer((_) async => true);
      },
      build: () => notificationsBadgeCubit,
      act: (cubit) => cubit.getHasUnread(),
      expect: () => [
        const NotificationsBadgeState(hasUnread: Loading()),
        const NotificationsBadgeState(hasUnread: Success(true)),
      ],
    );

    blocTest<NotificationsBadgeCubit, NotificationsBadgeState>(
      'getHasUnread emits loading then success when nothing is unread',
      setUp: () {
        when(() => notificationsRepository.hasUnreadNotifications()).thenAnswer((_) async => false);
      },
      build: () => notificationsBadgeCubit,
      act: (cubit) => cubit.getHasUnread(),
      verify: (cubit) => expect(cubit.state.unread, isFalse),
    );

    blocTest<NotificationsBadgeCubit, NotificationsBadgeState>(
      'getHasUnread emits loading then failure',
      setUp: () {
        when(() => notificationsRepository.hasUnreadNotifications()).thenThrow(Exception('boom'));
      },
      build: () => notificationsBadgeCubit,
      act: (cubit) => cubit.getHasUnread(),
      expect: () => [
        const NotificationsBadgeState(hasUnread: Loading()),
        isA<NotificationsBadgeState>().having(
          (state) => state.hasUnread,
          'hasUnread',
          isA<Failure>(),
        ),
      ],
    );
  });
}
