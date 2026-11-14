import 'package:flutter_bloc_starter/features/_shared/data/mappers/content_kind_mapper.dart';
import 'package:flutter_bloc_starter/features/_shared/data/models/content_kind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every content kind maps to the stored value of the same name', () {
    final stored = {for (final kind in ContentKind.values) kind: kind.toRemote().toJson()};

    expect(stored, {
      ContentKind.question: 'question',
      ContentKind.touchCard: 'touch_card',
      ContentKind.moodTip: 'mood_tip',
      ContentKind.meOrYou: 'me_or_you',
      ContentKind.howWell: 'how_well',
      ContentKind.neverHaveWe: 'never_have_we',
      ContentKind.mission: 'mission',
    });
  });
}
