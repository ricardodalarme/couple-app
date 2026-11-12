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

  testWidgets('reminders notice is one compact row and can be dismissed', (tester) async {
    final repository = _MockNotificationsRepository();
    when(repository.currentAccess).thenAnswer((_) async => NotificationAccess.denied);
    AppInjector.instance.registerFactory<NotificationsOffCubit>(
      () => NotificationsOffCubit(repository: repository),
    );
    addTearDown(() => AppInjector.instance.unregister<NotificationsOffCubit>());

    await tester.pumpApp(const NotificationsOffBanner());
    await tester.pump();
    await tester.pump();

    const text = 'Os lembretes estão desligados. Ligue nas configurações.';
    expect(find.text(text), findsOneWidget);
    expect(find.text('Fechar'), findsOneWidget);
    expect(tester.widget<BaseBanner>(find.byType(BaseBanner)).isCompact, isTrue);
    expect(
      tester.getTopLeft(find.text('Fechar')).dy,
      lessThan(tester.getBottomLeft(find.text(text)).dy),
    );
    expect(find.byIcon(AppIcons.close), findsNothing);

    await tester.tap(find.text('Fechar'));
    await tester.pump();

    expect(find.byType(BaseBanner), findsNothing);
  });
}
