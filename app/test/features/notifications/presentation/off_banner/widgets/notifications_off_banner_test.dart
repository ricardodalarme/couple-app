import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/cubit/notifications_off_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/widgets/notifications_off_banner.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_helpers/pump_app.dart';

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('reminders notice opens settings and dismisses through separate actions', (
    tester,
  ) async {
    final repository = _MockNotificationsRepository();
    when(repository.currentAccess).thenAnswer((_) async => NotificationAccess.denied);
    when(() => repository.isOffBannerDismissed).thenReturn(false);
    when(() => repository.setOffBannerDismissed(value: any(named: 'value')))
        .thenAnswer((_) async {});
    when(repository.openSettings).thenAnswer((_) async => true);
    AppInjector.instance.registerFactory<NotificationsOffCubit>(
      () => NotificationsOffCubit(repository: repository),
    );
    addTearDown(() => AppInjector.instance.unregister<NotificationsOffCubit>());

    await tester.pumpApp(const NotificationsOffBanner());
    await tester.pump();
    await tester.pump();

    const text = 'Os lembretes estão desligados. Ligue nas configurações.';
    expect(find.text(text), findsOneWidget);
    expect(find.text('Abrir ajustes'), findsOneWidget);
    expect(tester.widget<BaseBanner>(find.byType(BaseBanner)).isCompact, isTrue);
    expect(
      tester.getTopLeft(find.text('Abrir ajustes')).dy,
      lessThan(tester.getBottomLeft(find.text(text)).dy),
    );
    expect(find.byIcon(AppIcons.close), findsOneWidget);

    await tester.tap(find.text('Abrir ajustes'));
    await tester.pump();
    verify(repository.openSettings).called(1);

    await tester.tap(find.byIcon(AppIcons.close));
    await tester.pump();

    expect(find.byType(BaseBanner), findsNothing);
    verify(() => repository.setOffBannerDismissed(value: true)).called(1);
  });
}
