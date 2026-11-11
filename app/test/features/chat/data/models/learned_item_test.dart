import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('targets keep the server wire values', () {
    expect(LearnedTarget.partnerFact.wire, 'partner_fact');
    expect(LearnedTarget.date.wire, 'date');
    expect(LearnedTarget.memory.wire, 'memory');
    expect(LearnedTarget.commitment.wire, 'commitment');
  });

  test('statuses keep the server wire values', () {
    expect(LearnedStatus.pending.wire, 'pending');
    expect(LearnedStatus.confirmed.wire, 'confirmed');
    expect(LearnedStatus.rejected.wire, 'rejected');
  });

  test('the fake is only a skeleton placeholder', () {
    final fake = LearnedItem.fake();

    expect(fake.id, 'fake');
    expect(fake.status, LearnedStatus.pending);
  });
}
