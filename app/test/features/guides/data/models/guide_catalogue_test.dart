import 'package:flutter_bloc_starter/features/guides/data/models/guide_catalogue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the catalogue holds the twelve guides in the product order', () {
    expect(guideCatalogue.map((guide) => guide.slug), [
      'transition',
      'money',
      'family',
      'chores',
      'plans',
      'intimacy',
      'year',
      'cycle',
      'apology',
      'dreams',
      'values',
      'distance',
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
        'year': 'transition',
        'cycle': 'difficult',
        'apology': 'apology',
        'dreams': 'transition',
        'values': 'transition',
        'distance': 'difficult',
      },
    );
  });

  test('only intimacy and cycles are sensitive topics', () {
    expect(
      {for (final guide in guideCatalogue) guide.slug: guide.isSensitive},
      {
        'transition': false,
        'money': false,
        'family': false,
        'chores': false,
        'plans': false,
        'intimacy': true,
        'year': false,
        'cycle': true,
        'apology': false,
        'dreams': false,
        'values': false,
        'distance': false,
      },
    );
  });
}
