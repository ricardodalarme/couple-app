import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/cubit/sign_in_cubit.dart';
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

class _MockSlipRepository() extends Mock implements SlipRepository;

final _slip = SlipDetail(
  id: 's1',
  body: 'Fez café',
  kind: 'quick',
  createdAt: DateTime(2026),
  forCard: false,
);

void main() {
  late AuthenticationRepository authentication;
  late PendingRoute pending;
  late AppRouter router;

  setUp(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    authentication = _MockAuthenticationRepository();
    pending = PendingRoute();
    router = AppRouter(
      guard: AuthGuard(authentication: authentication, pending: pending),
    );

    final slips = _MockSlipRepository();
    when(() => slips.getSlip('s1')).thenAnswer((_) async => _slip);
    AppInjector.instance.registerFactory<SlipDetailCubit>(
      () => SlipDetailCubit(slipRepository: slips),
    );
    AppInjector.instance.registerFactory<SignInCubit>(
      () => SignInCubit(authenticationRepository: authentication),
    );
  });

  tearDown(() {
    AppInjector.instance.unregister<SlipDetailCubit>();
    AppInjector.instance.unregister<SignInCubit>();
  });

  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 8; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> pumpRouter(WidgetTester tester) async {
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
  }

  List<String?> stack() => router.stack.map((route) => route.name).toList();

  testWidgets('a signed-out link to a guarded page asks for sign-in', (tester) async {
    when(() => authentication.isAuthenticated).thenReturn(false);
    await pumpRouter(tester);

    unawaited(router.pushPath('/slip/s1'));
    await settle(tester);

    expect(stack(), contains(SignInRoute.name));
    expect(stack(), isNot(contains(SlipDetailRoute.name)));
    expect(pending.take(), '/slip/s1');
  });

  testWidgets('a signed-out link to a public page is left alone', (tester) async {
    when(() => authentication.isAuthenticated).thenReturn(false);
    await pumpRouter(tester);

    unawaited(router.push(const SignInRoute()));
    await settle(tester);

    expect(stack(), [WelcomeRoute.name, SignInRoute.name]);
    expect(pending.take(), isNull);
  });

  testWidgets('a signed-in person opens the guarded page directly', (tester) async {
    when(() => authentication.isAuthenticated).thenReturn(true);
    await pumpRouter(tester);

    unawaited(router.pushPath('/slip/s1'));
    await settle(tester);

    expect(stack(), contains(SlipDetailRoute.name));
    expect(stack(), isNot(contains(SignInRoute.name)));
    expect(pending.take(), isNull);
  });
}
