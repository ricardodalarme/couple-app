import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('checkinWeekStart', () {
    test('a Sunday belongs to the Monday six days before', () {
      expect(checkinWeekStart(DateTime(2026, 11, 8)), DateTime(2026, 11, 2));
    });

    test('a Monday is its own week start', () {
      expect(checkinWeekStart(DateTime(2026, 11, 9)), DateTime(2026, 11, 9));
    });

    test('the time of the server local day does not move the week', () {
      expect(checkinWeekStart(DateTime(2026, 11, 8, 23, 59)), DateTime(2026, 11, 2));
      expect(checkinWeekStart(DateTime(2026, 11, 9, 0, 1)), DateTime(2026, 11, 9));
    });

    test('a server local day far from the device day still drives the week', () {
      expect(checkinWeekStart(DateTime(2020, 2, 5)), DateTime(2020, 2, 3));
    });
  });
}
