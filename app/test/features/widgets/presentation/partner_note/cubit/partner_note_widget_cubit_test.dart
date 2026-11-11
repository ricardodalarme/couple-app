import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/partner_note/cubit/partner_note_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
    registerFallbackValue(WidgetPreferences.fake());
  });

  group('PartnerNoteWidgetCubit', () {
    final overview = WidgetOverview.fake();
    final disabledOverview = WidgetOverview(
      payload: overview.payload.copyWith(allowPartnerNotes: false).sanitized(),
      preferences: overview.preferences.copyWith(allowPartnerNotes: false),
    );

    blocTest<PartnerNoteWidgetCubit, PartnerNoteWidgetState>(
      'emits Loading then Success on load and saves allowPartnerNotes toggle',
      build: () {
        when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
        when(() => repository.savePreferences(any())).thenAnswer((_) async => disabledOverview);
        return PartnerNoteWidgetCubit(repository: repository);
      },
      act: (cubit) async {
        await cubit.load();
        await cubit.setAllowPartnerNotes(allow: false);
      },
      expect: () => [
        const PartnerNoteWidgetState(overview: Loading()),
        PartnerNoteWidgetState(overview: Success(overview)),
        PartnerNoteWidgetState(overview: Success(overview), toggleAction: const Loading()),
        PartnerNoteWidgetState(
          overview: Success(disabledOverview),
          toggleAction: const Success(null),
        ),
      ],
    );

    test('sanitized strips partnerNote when allowPartnerNotes is false or unpaired', () {
      final base = WidgetPayload.fake().copyWith(
        partnerNote: 'Boa sorte na reunião!',
        allowPartnerNotes: true,
        isPaired: true,
      );
      expect(base.sanitized().partnerNote, 'Boa sorte na reunião!');
      expect(base.copyWith(allowPartnerNotes: false).sanitized().partnerNote, isNull);
      expect(base.copyWith(isPaired: false).sanitized().partnerNote, isNull);
    });
  });
}
