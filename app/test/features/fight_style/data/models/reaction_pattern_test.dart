import 'package:flutter_bloc_starter/features/fight_style/data/models/fight_style_result.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/models/reaction_pattern.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('rankReactions', () {
    test('orders the patterns by how often they were chosen', () {
      final ranked = rankReactions([
        'withdraw',
        'withdraw',
        'avoid',
        'withdraw',
        'repair',
        'avoid',
      ]);

      expect(ranked, ['withdraw', 'avoid', 'repair', 'pursue']);
      expect(scoreReactions(['withdraw', 'withdraw']).values, contains(2));
    });

    test('a tie keeps the canonical order, so the top is stable', () {
      final ranked = rankReactions(['avoid', 'repair', 'pursue', 'withdraw']);

      expect(ranked, ['pursue', 'withdraw', 'repair', 'avoid']);
      expect(rankReactions(const []).first, 'pursue');
    });

    test('ignores unknown answers', () {
      final ranked = rankReactions(['other', 'repair']);

      expect(ranked.first, 'repair');
      expect(scoreReactions(['other']).values.every((score) => score == 0), isTrue);
    });
  });

  group('FightStyleResult', () {
    test('a stored ranking shows its top pattern', () {
      final stored = FightStyleResult.fromRecord(['repair', 'pursue', 'withdraw', 'avoid']);

      expect(stored?.topPattern, 'repair');
    });

    test('an empty stored ranking is not a saved result', () {
      expect(FightStyleResult.fromRecord(null), isNull);
      expect(FightStyleResult.fromRecord(const []), isNull);
    });

    test('an unknown stored key is not a saved result', () {
      expect(FightStyleResult.fromRecord(const ['pursue', 'dismiss']), isNull);
    });

    test('keeps the partner name from the record', () {
      final stored = FightStyleResult.fromRecord(const ['avoid'], partnerName: 'Marina');

      expect(stored?.partnerName, 'Marina');
    });
  });

  test('the options rotate so no pattern always comes first', () {
    expect(reactionOrderFor(0), reactionPatternKeys);
    expect(reactionOrderFor(1).first, 'withdraw');
    expect(reactionOrderFor(3).first, 'avoid');
    expect(reactionOrderFor(4), reactionPatternKeys);
  });
}
