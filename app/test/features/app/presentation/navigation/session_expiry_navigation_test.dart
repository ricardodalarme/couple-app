import 'dart:async';

import 'package:connectivity_service/connectivity_service.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/navigation/app_state_navigator.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_detail.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_detail/cubit/slip_detail_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_bloc_starter/router/guards/auth_guard.dart';
import 'package:flutter_bloc_starter/router/pending_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

class _MockSlipRepository() extends Mock implements SlipRepository;

class _MockSupportRepository() extends Mock implements SupportRepository;

class _MockReminderSyncService() extends Mock implements ReminderSyncService;

class _MockConnectivityService() extends Mock implements ConnectivityService;

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

class _MockDevicesRepository() extends Mock implements DevicesRepository;

final _slip = SlipDetail(
  id: 's1',
  body: 'Fez café',
  kind: 'quick',
  createdAt: DateTime(2026),
  forCard: false,
);

void main() {
  late AuthenticationRepository authenticationRepository;
  late ProfileRepository profileRepository;
  late SettingsRepository settingsRepository;
  late SlipRepository slipRepository;
  late SupportRepository supportRepository;
  late ReminderSyncService reminderSyncService;
  late ConnectivityService connectivityService;
  late NotificationsRepository notificationsRepository;
  late DevicesRepository devicesRepository;
  late StreamController<bool> authStates;
  late SlipDetailCubit slipCubit;
  late AppRouter router;
  late PendingRoute pending;

  AppCubit buildAppCubit() => AppCubit(
    authenticationRepository: authenticationRepository,
    profileRepository: profileRepository,
    settingsRepository: settingsRepository,
    slipRepository: slipRepository,
    supportRepository: supportRepository,
    reminderSyncService: reminderSyncService,
    connectivityService: connectivityService,
    notificationsRepository: notificationsRepository,
    devicesRepository: devicesRepository,
  );

  setUpAll(() => registerFallbackValue(const Settings.empty()));

  setUp(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    authenticationRepository = _MockAuthenticationRepository();
    profileRepository = _MockProfileRepository();
    settingsRepository = _MockSettingsRepository();
    slipRepository = _MockSlipRepository();
    supportRepository = _MockSupportRepository();
    reminderSyncService = _MockReminderSyncService();
    connectivityService = _MockConnectivityService();
    notificationsRepository = _MockNotificationsRepository();
    devicesRepository = _MockDevicesRepository();
    authStates = StreamController<bool>();

    when(() => notificationsRepository.unregisterCurrentDevice()).thenAnswer((_) async => true);
    when(() => devicesRepository.revokeCurrentDevice()).thenAnswer((_) async {});
    when(() => reminderSyncService.sync()).thenAnswer((_) async {});
    when(() => slipRepository.flushPending()).thenAnswer((_) async {});
    when(() => slipRepository.getSlip('s1')).thenAnswer((_) async => _slip);
    when(() => supportRepository.flushPending(authorId: any(named: 'authorId')))
        .thenAnswer((_) async => 0);
    when(() => supportRepository.clearPending()).thenAnswer((_) async {});
    when(() => connectivityService.onStatusChange).thenAnswer((_) => const Stream.empty());
    when(() => authenticationRepository.isAuthenticatedStream).thenAnswer((_) => authStates.stream);
    when(() => authenticationRepository.isAuthenticated).thenReturn(true);
    when(() => authenticationRepository.currentUserId).thenReturn('fake');
    when(() => profileRepository.ensureProfile()).thenAnswer((_) async => const Profile.fake());
    when(() => profileRepository.getMySettings()).thenAnswer(
      (_) async => AccountSettings(theme: AppThemeVariant.blue, onboardedAt: DateTime(2026)),
    );
    when(() => settingsRepository.get()).thenReturn(const Settings.empty());
    when(() => settingsRepository.save(any())).thenAnswer((_) async {});

    slipCubit = SlipDetailCubit(slipRepository: slipRepository);
    pending = PendingRoute();
    router = AppRouter(
      guard: AuthGuard(authentication: authenticationRepository, pending: pending),
    );
    AppInjector.instance.registerFactory<SlipDetailCubit>(() => slipCubit);
    AppInjector.instance.registerFactory<SignInCubit>(
      () => SignInCubit(authenticationRepository: authenticationRepository),
    );
  });

  tearDown(() async {
    await authStates.close();
    AppInjector.instance.unregister<SlipDetailCubit>();
    AppInjector.instance.unregister<SignInCubit>();
  });

  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 8; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  testWidgets('expiry keeps the page and draft, then sign-in returns to them', (tester) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: AppThemeHost(
          initialVariant: AppThemeVariant.rose,
          child: Builder(
            builder: (context) => BaseApp.router(
              routerConfig: router.config(),
              theme: AppTheme.light(AppThemeScope.of(context)),
              supportedLocales: AppLocaleUtils.supportedLocales,
            ),
          ),
        ),
      ),
    );
    await settle(tester);

    unawaited(router.push(SlipDetailRoute(id: 's1')));
    await settle(tester);
    await tester.tap(find.text('Editar'));
    await settle(tester);
    await tester.enterText(find.byType(BaseTextArea), 'rascunho');
    await tester.pump();

    final appCubit = buildAppCubit();
    addTearDown(appCubit.close);
    await appCubit.initialize();
    final navigator = AppStateNavigator(router: router, pending: pending);
    var previous = appCubit.state;
    final subscription = appCubit.stream.listen((current) {
      navigator.onStateChanged(previous, current);
      previous = current;
    });
    addTearDown(subscription.cancel);

    authStates.add(false);
    await settle(tester);

    expect(find.textContaining('Sua sessão'), findsOneWidget);
    expect(router.stack.map((route) => route.name), contains(SlipDetailRoute.name));

    unawaited(router.push(const SignInRoute()));
    await settle(tester);
    expect(find.text('Continuar com a Apple'), findsOneWidget);

    authStates.add(true);
    await settle(tester);

    expect(router.stack.map((route) => route.name), isNot(contains(SessionExpiredRoute.name)));
    expect(router.stack.map((route) => route.name), isNot(contains(SignInRoute.name)));
    expect(router.stack.map((route) => route.name), contains(SlipDetailRoute.name));
    final field = tester.widget<EditableText>(
      find.descendant(of: find.byType(BaseTextArea), matching: find.byType(EditableText)),
    );
    expect(field.controller.text, 'rascunho');

    unawaited(router.maybePop());
    await settle(tester);
    expect(find.text('Descartar este slip?'), findsOneWidget);

    await tester.tap(find.text('Continuar escrevendo'));
    await settle(tester);
    expect(find.byType(BaseTextArea), findsOneWidget);
    final kept = tester.widget<EditableText>(
      find.descendant(of: find.byType(BaseTextArea), matching: find.byType(EditableText)),
    );
    expect(kept.controller.text, 'rascunho');
  });
}
