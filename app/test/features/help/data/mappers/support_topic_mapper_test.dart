import 'package:flutter_bloc_starter/features/help/data/mappers/support_topic_mapper.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every topic reads back from the label it sends', () {
    for (final topic in SupportTopic.values) {
      expect(topic.toRemote().toSupportTopic(), topic);
    }
  });

  test('an unknown stored label reads as other', () {
    expect('not-a-topic'.toSupportTopic(), SupportTopic.other);
  });
}
