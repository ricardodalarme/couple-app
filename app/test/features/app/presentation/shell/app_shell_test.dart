import 'dart:async';

import 'package:app_info_service/app_info_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_service/connectivity_service.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/data/repositories/app_config_repository.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/shell/app_shell.dart';
import 'package:flutter_bloc_starter/features/app/presentation/time_in_app/cubit/time_in_app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppCubit() extends MockCubit<AppState> implements AppCubit;

class _MockTimeInAppCubit() extends MockCubit<TimeInAppState> implements TimeInAppCubit;

class _MockAppConfigRepository() extends Mock implements AppConfigRepository;

class _MockAppInfoService() extends Mock implements AppInfoService;

class _MockConnectivityService() extends Mock implements ConnectivityService;

class _TestRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NotFoundRoute.page, initial: true),
    AutoRoute(page: TimeInAppRoute.page, fullscreenDialog: true),
  ];
}

void main() {
  late AppCubit appCubit;
  late TimeInAppCubit timeInAppCubit;
  late StreamController<TimeInAppState> timeStates;
  late VersionGateCubit versionGateCubit;
  late ConnectivityCubit connectivityCubit;

  setUp(() {
    appCubit = _MockAppCubit();
    timeInAppCubit = _MockTimeInAppCubit();
    timeStates = StreamController<TimeInAppState>.broadcast();
    versionGateCubit = VersionGateCubit(
      repository: _MockAppConfigRepository(),
      appInfoService: _MockAppInfoService(),
    );
    connectivityCubit = ConnectivityCubit(connectivityService: _MockConnectivityService());
    whenListen(timeInAppCubit, timeStates.stream, initialState: const TimeInAppState());
  });

  tearDown(() async {
    await timeStates.close();
    await versionGateCubit.close();
    await connectivityCubit.close();
  });

  Future<void> pumpShell(WidgetTester tester, RootStackRouter router) {
    return tester.pumpWidget(
      TranslationProvider(
        child: AppThemeHost(
          initialVariant: AppThemeVariant.rose,
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: appCubit),
              BlocProvider.value(value: timeInAppCubit),
              BlocProvider.value(value: versionGateCubit),
              BlocProvider.value(value: connectivityCubit),
            ],
            child: Builder(
              builder: (context) => BaseApp.router(
                routerConfig: router.config(),
                theme: AppTheme.light(AppThemeScope.of(context)),
                supportedLocales: AppLocaleUtils.supportedLocales,
                builder: (context, child) =>
                    AppShell(router: router, child: child ?? const SizedBox.shrink()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> settle(WidgetTester tester) async {
    for (var index = 0; index < 6; index++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  testWidgets('no prompt while unauthenticated', (tester) async {
    whenListen(appCubit, const Stream<AppState>.empty(), initialState: AppState.unauthenticated);
    final router = _TestRouter();
    await pumpShell(tester, router);

    timeStates.add(const TimeInAppState(shouldPrompt: true));
    await settle(tester);

    expect(router.stack.map((route) => route.name), isNot(contains(TimeInAppRoute.name)));
  });

  testWidgets('one prompt when authenticated', (tester) async {
    whenListen(appCubit, const Stream<AppState>.empty(), initialState: AppState.authenticated);
    final router = _TestRouter();
    await pumpShell(tester, router);

    timeStates.add(const TimeInAppState(shouldPrompt: true));
    await settle(tester);

    expect(router.stack.where((route) => route.name == TimeInAppRoute.name), hasLength(1));
  });
}
