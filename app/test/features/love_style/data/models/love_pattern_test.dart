import 'package:flutter_bloc_starter/features/love_style/data/models/love_pattern.dart';
import 'package:flutter_bloc_starter/features/love_style/data/models/love_style_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('rankLovePatterns', () {
    test('orders the patterns by how often they were chosen', () {
      final ranked = rankLovePatterns(['acts', 'acts', 'touch', 'acts', 'words', 'touch']);

      expect(ranked, ['acts', 'touch', 'words', 'time', 'gifts']);
      expect(scoreLovePatterns(['acts', 'acts']).values, contains(2));
    });

    test('a tie keeps the canonical order, so the top is stable', () {
      final ranked = rankLovePatterns(['touch', 'gifts', 'acts', 'words', 'time']);

      expect(ranked, ['time', 'words', 'acts', 'gifts', 'touch']);
      expect(rankLovePatterns(const []).first, 'time');
    });

    test('ignores unknown answers', () {
      final ranked = rankLovePatterns(['other', 'words']);

      expect(ranked.first, 'words');
      expect(scoreLovePatterns(['other']).values.every((score) => score == 0), isTrue);
    });
  });

  group('LoveStyleResult', () {
    test('a stored ranking shows its top pattern', () {
      final stored = LoveStyleResult.fromRecord(['touch', 'time', 'words', 'acts', 'gifts']);

      expect(stored?.topPattern, 'touch');
    });

    test('an empty stored ranking is not a saved result', () {
      expect(LoveStyleResult.fromRecord(null), isNull);
      expect(LoveStyleResult.fromRecord(const []), isNull);
    });

    test('an unknown stored key is not a saved result', () {
      expect(LoveStyleResult.fromRecord(const ['touch', 'praise']), isNull);
    });
  });

  test('the options rotate so no pattern always comes first', () {
    expect(lovePatternOrderFor(0), lovePatternKeys);
    expect(lovePatternOrderFor(1).first, 'words');
    expect(lovePatternOrderFor(4).first, 'touch');
    expect(lovePatternOrderFor(5), lovePatternKeys);
  });

  test('the exercise has six questions', () {
    expect(loveStyleQuestionCount, 6);
  });
}
