import 'dart:typed_data';

import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/compose_page.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockNotesRepository() extends Mock implements NotesRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late NotesRepository repository;
  late PairingRepository pairingRepository;
  final message = SentMessage(
    id: 'm1',
    kind: MessageKind.note,
    createdAt: DateTime(2026, 3, 10, 12),
    forWidget: true,
    body: 'Boa sorte',
  );

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(message);
  });

  setUp(() {
    repository = _MockNotesRepository();
    pairingRepository = _MockPairingRepository();
    when(() => pairingRepository.getPartner())
        .thenAnswer((_) async => const Profile(id: 'p1', avatarKind: AvatarKind.initials));
    when(() => repository.getSent()).thenAnswer((_) async => [message]);
    when(() => repository.delete(any())).thenAnswer((_) async {});
  });

  ComposeCubit build() => ComposeCubit(
    notesRepository: repository,
    pairingRepository: pairingRepository,
    exportDrawing: (_) async => Uint8List(0),
  );

  Future<ComposeCubit> pumpCompose(WidgetTester tester) async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ComposePage()));
    await tester.pump();
    return cubit;
  }

  testWidgets('the widget switch starts on for notes and disappears for drawings', (tester) async {
    await pumpCompose(tester);

    expect(tester.widget<BaseSwitch>(find.byType(BaseSwitch)).value, isTrue);
    expect(find.text('Enviar para o widget'), findsOneWidget);

    await tester.tap(find.text('Desenho'));
    await tester.pump();

    expect(find.byType(BaseSwitch), findsNothing);
    expect(
      find.text(
        'Desenhos ficam na sua lista de enviados. Recados no widget são só texto por enquanto.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('deleting asks for confirmation before calling the RPC', (tester) async {
    await pumpCompose(tester);

    await tester.ensureVisible(find.text('Apagar'));
    await tester.tap(find.text('Apagar'));
    await tester.pumpAndSettle();

    expect(find.text('Apagar este envio?'), findsOneWidget);
    verifyNever(() => repository.delete(any()));

    await tester.tap(find.text('Apagar agora'));
    await tester.pumpAndSettle();

    verify(() => repository.delete(message)).called(1);
  });

  testWidgets('the sent list shows a relative time and no seen state', (tester) async {
    await withClock(Clock.fixed(DateTime(2026, 3, 10, 12)), () async {
      await pumpCompose(tester);

      expect(find.text('Agora'), findsOneWidget);
      expect(find.text('Visto'), findsNothing);
    });
  });

  testWidgets('without a partner the page says so and cannot send', (tester) async {
    when(() => pairingRepository.getPartner()).thenAnswer((_) async => null);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit.onTextChanged('Boa sorte');

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ComposePage()));
    await tester.pump();

    expect(find.text('Conecte-se com seu par'), findsOneWidget);
    expect(tester.widget<BaseButton>(find.byType(BaseButton)).isEnabled, isFalse);
  });
}
