import 'package:flutter_bloc_starter/router/observers/analytics_router_observer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('relationship and grief routes report a generic settings screen', () {
    expect(analyticsScreenNameFor('RelationshipChangedRoute'), 'settings');
    expect(analyticsScreenNameFor('GriefSupportRoute'), 'settings');
    expect(analyticsScreenNameFor('RelationshipRoute'), 'settings');
    expect(analyticsScreenNameFor('UnpairRoute'), 'settings');
    expect(analyticsScreenNameFor('UsRoute'), 'settings');
    expect(analyticsScreenNameFor('TouchRoute'), 'settings');
    expect(analyticsScreenNameFor('CapsulesRoute'), 'settings');
    expect(analyticsScreenNameFor('GuidesRoute'), 'settings');
    expect(analyticsScreenNameFor('GuideRoute'), 'settings');
    expect(analyticsScreenNameFor('CheckinRoute'), 'settings');
  });

  test('ordinary routes keep their name and missing names stay empty', () {
    expect(analyticsScreenNameFor('HomeRoute'), 'HomeRoute');
    expect(analyticsScreenNameFor(null), isNull);
  });
}
