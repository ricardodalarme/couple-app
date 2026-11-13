import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/navigation/app_state_navigator.dart';
import 'package:flutter_bloc_starter/router/pending_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRouter() extends Mock implements RootStackRouter;

class _FakeRoute() extends Fake implements PageRouteInfo<Object?>;

void main() {
  setUpAll(() {
    registerFallbackValue(<PageRouteInfo>[]);
    registerFallbackValue(_FakeRoute());
  });

  late _MockRouter router;
  late PendingRoute pending;
  late AppStateNavigator navigator;

  setUp(() {
    router = _MockRouter();
    pending = PendingRoute();
    navigator = AppStateNavigator(router: router, pending: pending);

    when(() => router.replaceAll(any())).thenAnswer((_) async {});
    when(() => router.pushPath<Object?>(any())).thenAnswer((_) async => null);
    when(() => router.push<Object?>(any())).thenAnswer((_) async => null);
  });

  test('reopens the page sign-in interrupted', () async {
    pending.stash('slip/s1');

    navigator.onStateChanged(AppState.unauthenticated, AppState.authenticated);
    await pumpEventQueue();

    verify(() => router.pushPath<Object?>('/slip/s1')).called(1);
    expect(pending.take(), isNull);
  });

  test('lands on the home stack when nothing was interrupted', () async {
    navigator.onStateChanged(AppState.unauthenticated, AppState.authenticated);
    await pumpEventQueue();

    verify(() => router.replaceAll(any())).called(1);
    verifyNever(() => router.pushPath<Object?>(any()));
  });

  test('leaves the interrupted page out of reach after onboarding', () async {
    pending.stash('slip/s1');

    navigator.onStateChanged(AppState.unauthenticated, AppState.onboarding);
    await pumpEventQueue();
    verifyNever(() => router.pushPath<Object?>(any()));

    navigator.onStateChanged(AppState.onboarding, AppState.authenticated);
    await pumpEventQueue();

    verify(() => router.pushPath<Object?>('/slip/s1')).called(1);
  });

  test('signing out forgets the interrupted page', () async {
    pending.stash('slip/s1');

    navigator.onStateChanged(AppState.authenticated, AppState.unauthenticated);
    await pumpEventQueue();
    navigator.onStateChanged(AppState.unauthenticated, AppState.authenticated);
    await pumpEventQueue();

    verifyNever(() => router.pushPath<Object?>(any()));
  });

  test('a session that expires is shown, then reopens the interrupted page', () async {
    pending.stash('slip/s1');

    navigator.onStateChanged(AppState.authenticated, AppState.sessionExpired);
    await pumpEventQueue();
    verify(() => router.push<Object?>(any())).called(1);

    navigator.onStateChanged(AppState.sessionExpired, AppState.authenticated);
    await pumpEventQueue();

    verify(() => router.pushPath<Object?>('/slip/s1')).called(1);
  });
}
