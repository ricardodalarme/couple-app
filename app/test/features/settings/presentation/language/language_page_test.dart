import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/language/cubit/language_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/language/language_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('Portuguese is selected and English is shown as coming soon', (tester) async {
    final repository = _MockSettingsRepository();
    when(repository.get).thenReturn(const Settings.empty());
    final cubit = LanguageCubit(repository: repository);
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LanguagePage()));
    await tester.pumpAndSettle();

    final portuguese = tester.widget<BaseOptionTile>(
      find.widgetWithText(BaseOptionTile, 'Português (Brasil)'),
    );
    final english = tester.widget<BaseListTile>(find.widgetWithText(BaseListTile, 'Inglês'));

    expect(portuguese.isSelected, isTrue);
    expect(find.byType(BaseOptionTile), findsOneWidget);
    expect(english.onTap, isNull);
    expect(find.text('EM BREVE'), findsOneWidget);
    expect(find.text('O inglês fica completo depois.'), findsOneWidget);
  });
}
