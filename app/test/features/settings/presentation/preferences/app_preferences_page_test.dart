import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/app_preferences_page.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/cubit/app_preferences_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  late SettingsRepository repository;
  late Settings stored;

  setUpAll(() => registerFallbackValue(const Settings.empty()));

  setUp(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    repository = _MockSettingsRepository();
    stored = const Settings.empty();
    when(repository.get).thenAnswer((_) => stored);
    when(() => repository.save(any())).thenAnswer((invocation) async {
      stored = invocation.positionalArguments.first as Settings;
    });
  });

  Future<AppPreferencesCubit> pumpPage(WidgetTester tester) async {
    final cubit = AppPreferencesCubit(repository: repository);
    addTearDown(cubit.close);
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const AppPreferencesPage()));
    await tester.pumpAndSettle();
    return cubit;
  }

  testWidgets('switches save the preferences', (tester) async {
    final cubit = await pumpPage(tester);

    await tester.tap(
      find.descendant(
        of: find.widgetWithText(BaseListTile, 'Reduzir movimento'),
        matching: find.byType(BaseSwitch),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.widgetWithText(BaseListTile, 'Alto contraste'),
        matching: find.byType(BaseSwitch),
      ),
    );
    await tester.pumpAndSettle();

    expect(cubit.state.settings.reduceMotion, isTrue);
    expect(cubit.state.settings.highContrast, isTrue);
  });

  testWidgets('the text size sheet saves the chosen size', (tester) async {
    final cubit = await pumpPage(tester);

    await tester.tap(find.widgetWithText(BaseListTile, 'Tamanho do texto'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(BaseOptionTile, 'Grande'));
    await tester.pumpAndSettle();

    expect(cubit.state.settings.textScale, 1.15);
  });

  testWidgets('shows the stored language and keeps app colour in Profile', (tester) async {
    stored = const Settings.empty().copyWith(locale: 'en');
    await pumpPage(tester);

    final language = tester.widget<BaseListTile>(find.widgetWithText(BaseListTile, 'Idioma'));

    expect(language.value, 'Inglês');
    expect(language.onTap, isNotNull);
    expect(find.text('A cor do app fica no Perfil.'), findsOneWidget);
    expect(find.widgetWithText(BaseListTile, 'Cor do app'), findsNothing);
  });
}
