import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/gallery/widgets/gallery_preview_cards.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/lock_screen/widgets/lock_screen_preview_section.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() {
    LocaleSettings.setLocaleRawSync('pt');
  });

  final pausePayload = WidgetPayload.fake().copyWith(
    pauseReturnAt: DateTime.utc(2026, 3, 10, 13).toIso8601String(),
    cardState: 'pause',
  );

  testWidgets('lock screen never shows pause status or time', (tester) async {
    await tester.pumpApp(
      BaseView(
        body: SingleChildScrollView(
          child: LockScreenPreviewSection(payload: pausePayload.copyWith(onLockScreen: true)),
        ),
      ),
    );

    expect(find.textContaining('Pausa em andamento'), findsNothing);
    expect(find.textContaining('até '), findsNothing);
    expect(find.text('Momento calmo'), findsWidgets);
  });

  testWidgets('lock screen shows a neutral card when the setting is off', (tester) async {
    await tester.pumpApp(
      BaseView(
        body: SingleChildScrollView(
          child: LockScreenPreviewSection(payload: pausePayload.copyWith(onLockScreen: false)),
        ),
      ),
    );

    expect(find.textContaining('Pausa em andamento'), findsNothing);
    expect(
      find.text('O widget da tela de bloqueio está desativado nas configurações.'),
      findsOneWidget,
    );
  });

  testWidgets('gallery lock-screen card never shows pause in discreet mode', (tester) async {
    final discreet = pausePayload.copyWith(discreet: true).sanitized();

    await tester.pumpApp(
      BaseView(
        body: SingleChildScrollView(
          child: GalleryPreviewSection(
            segment: WidgetGallerySegment.own,
            payload: discreet,
            onSelectFamily: (_) {},
          ),
        ),
      ),
    );

    expect(find.textContaining('Pausa em andamento'), findsNothing);
    expect(find.text('Lembrete calmo · Sem nomes'), findsWidgets);
  });
}
