import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/cubit/notifications_off_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/permission/cubit/notification_permission_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NotificationsRepository repository;

  setUp(() {
    repository = _MockNotificationsRepository();
    when(() => repository.isOffBannerDismissed).thenReturn(false);
    when(() => repository.setOffBannerDismissed(value: any(named: 'value')))
        .thenAnswer((_) async {});
  });

  group('NotificationPermissionCubit', () {
    test('reports the access the person gave', () async {
      when(() => repository.requestAccess()).thenAnswer((_) async => NotificationAccess.granted);
      final cubit = NotificationPermissionCubit(repository: repository);

      await cubit.allow();

      expect(
        cubit.state.requestAction,
        const Success<NotificationAccess>(NotificationAccess.granted),
      );
    });

    test('a denial is a normal answer, not a failure', () async {
      when(() => repository.requestAccess()).thenAnswer((_) async => NotificationAccess.denied);
      final cubit = NotificationPermissionCubit(repository: repository);

      await cubit.allow();

      expect(cubit.state.requestAction, isA<Success<NotificationAccess>>());
    });

    test('a failure is reported', () async {
      when(() => repository.requestAccess()).thenAnswer((_) async => throw Exception());
      final cubit = NotificationPermissionCubit(repository: repository);

      await cubit.allow();

      expect(cubit.state.requestAction, isA<Failure>());
    });
  });

  group('NotificationsOffCubit', () {
    test('shows the notice when access is denied', () async {
      when(() => repository.currentAccess()).thenAnswer((_) async => NotificationAccess.denied);
      final cubit = NotificationsOffCubit(repository: repository);

      await cubit.refresh();

      expect(cubit.state.isVisible, isTrue);
    });

    test('hides the notice once access is granted again', () async {
      when(() => repository.currentAccess()).thenAnswer((_) async => NotificationAccess.denied);
      final cubit = NotificationsOffCubit(repository: repository);
      await cubit.refresh();

      when(() => repository.currentAccess()).thenAnswer((_) async => NotificationAccess.granted);
      await cubit.refresh();

      expect(cubit.state.isVisible, isFalse);
    });

    test('a dismissed notice stays hidden after a refresh', () async {
      var dismissed = false;
      when(() => repository.currentAccess()).thenAnswer((_) async => NotificationAccess.denied);
      when(() => repository.isOffBannerDismissed).thenAnswer((_) => dismissed);
      when(() => repository.setOffBannerDismissed(value: any(named: 'value')))
          .thenAnswer((invocation) async {
            dismissed = invocation.namedArguments[#value] as bool;
          });
      final cubit = NotificationsOffCubit(repository: repository);
      await cubit.refresh();
      await cubit.dismiss();
      await cubit.refresh();

      expect(cubit.state.isVisible, isFalse);
    });

    test('a dismissal survives a new cubit once it is stored', () async {
      when(() => repository.currentAccess()).thenAnswer((_) async => NotificationAccess.denied);
      when(() => repository.isOffBannerDismissed).thenReturn(true);
      final cubit = NotificationsOffCubit(repository: repository);

      await cubit.refresh();

      expect(cubit.state.isVisible, isFalse);
    });

    test('granting access clears a stored dismissal so a later denial shows again', () async {
      when(() => repository.currentAccess()).thenAnswer((_) async => NotificationAccess.granted);
      final cubit = NotificationsOffCubit(repository: repository);

      await cubit.refresh();

      verify(() => repository.setOffBannerDismissed(value: false)).called(1);
    });
  });
}
