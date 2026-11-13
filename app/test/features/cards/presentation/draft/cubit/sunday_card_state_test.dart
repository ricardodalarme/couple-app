import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final draft = SundayCard(id: 'card', status: 'draft', weekStart: DateTime(2026), items: const []);

  test('clearDraft drops the draft and leaves editing', () {
    final state = SundayCardState(draft: draft);

    final cleared = state.copyWith(clearDraft: true);

    expect(cleared.draft, isNull);
    expect(cleared.isEditing, isFalse);
  });

  test('changing the names keeps the draft', () {
    final state = SundayCardState(draft: draft);

    final updated = state.copyWith(selfName: 'Ana', partnerName: 'Bia');

    expect(updated.draft, draft);
    expect(updated.isEditing, isTrue);
  });
}
