import 'package:flutter_bloc_starter/features/account/presentation/sign_out/cubit/sign_out_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences_service/preferences_service.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockSlipRepository() extends Mock implements SlipRepository;

class _MockRemindersRepository() extends Mock implements RemindersRepository;

class _MockPreferencesService() extends Mock implements PreferencesService;

class _MockSecureStorageService() extends Mock implements SecureStorageService;

class _MockTodayRepository() extends Mock implements TodayRepository;

void main() {
  late AuthenticationRepository auth;
  late SlipRepository slips;
  late RemindersRepository reminders;
  late PreferencesService preferences;
  late SecureStorageService secureStorage;
  late TodayRepository today;

  setUp(() {
    auth = _MockAuthenticationRepository();
    slips = _MockSlipRepository();
    reminders = _MockRemindersRepository();
    preferences = _MockPreferencesService();
    secureStorage = _MockSecureStorageService();
    today = _MockTodayRepository();
    when(() => slips.pendingCount).thenReturn(0);
    when(() => today.clearCache()).thenAnswer((_) async {});
    when(() => auth.logOut()).thenAnswer((_) async {});
    when(() => reminders.cancelAll()).thenAnswer((_) async {});
    when(() => preferences.clear()).thenAnswer((_) async {});
    when(() => secureStorage.clear()).thenAnswer((_) async {});
  });

  SignOutCubit build() => SignOutCubit(
    authenticationRepository: auth,
    slipRepository: slips,
    remindersRepository: reminders,
    preferencesService: preferences,
    secureStorageService: secureStorage,
    todayRepository: today,
  );

  test('signing out keeps the local data when the person chose so', () async {
    final cubit = build();

    await cubit.signOut(removeLocalData: false);

    verify(() => auth.logOut()).called(1);
    verify(() => today.clearCache()).called(1);
    verifyNever(() => preferences.clear());
    verifyNever(() => secureStorage.clear());
  });

  test('signing out and removing data erases preferences, keys and reminders', () async {
    final cubit = build();

    await cubit.signOut(removeLocalData: true);

    verify(() => auth.logOut()).called(1);
    verify(() => reminders.cancelAll()).called(1);
    verify(() => today.clearCache()).called(1);
    verify(() => preferences.clear()).called(1);
    verify(() => secureStorage.clear()).called(1);
  });

  test('pending slips are counted for the warning', () {
    when(() => slips.pendingCount).thenReturn(3);
    final cubit = build()..load();

    expect(cubit.state.pendingSlips, 3);
  });
}
