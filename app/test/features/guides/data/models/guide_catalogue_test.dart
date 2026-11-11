import 'package:flutter_bloc_starter/features/guides/data/models/guide_catalogue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the catalogue holds the six guides in the product order', () {
    expect(guideCatalogue.map((guide) => guide.slug), [
      'transition',
      'money',
      'family',
      'chores',
      'plans',
      'intimacy',
    ]);
  });

  test('every guide has four steps in both languages', () {
    for (final guide in guideCatalogue) {
      expect(guide.prompts, hasLength(4));
      expect(guide.title.pt, isNotEmpty);
      expect(guide.title.en, isNotEmpty);
      expect(guide.description.pt, isNotEmpty);
      expect(guide.description.en, isNotEmpty);
      expect(guide.prompts.every((prompt) => prompt.pt.isNotEmpty && prompt.en.isNotEmpty), isTrue);
    }
  });

  test('guides map to the server vocabulary', () {
    expect(
      {for (final guide in guideCatalogue) guide.slug: guide.guideType},
      {
        'transition': 'transition',
        'money': 'money',
        'family': 'difficult',
        'chores': 'difficult',
        'plans': 'difficult',
        'intimacy': 'difficult',
      },
    );
  });

  test('only intimacy is a sensitive topic', () {
    expect(
      {for (final guide in guideCatalogue) guide.slug: guide.isSensitive},
      {
        'transition': false,
        'money': false,
        'family': false,
        'chores': false,
        'plans': false,
        'intimacy': true,
      },
    );
  });
}
