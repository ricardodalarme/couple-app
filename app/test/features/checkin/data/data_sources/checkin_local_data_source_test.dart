import 'package:flutter_bloc_starter/features/checkin/data/data_sources/checkin_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences_service/preferences_service.dart';

class _MockPreferencesService() extends Mock implements PreferencesService;

void main() {
  late PreferencesService preferences;
  late CheckinLocalDataSource dataSource;

  final monday = DateTime(2026, 11, 2);

  setUp(() {
    preferences = _MockPreferencesService();
    dataSource = CheckinLocalDataSource(preferencesService: preferences);
  });

  test('a dismissal is stored under the check-in week key', () async {
    when(
      () => preferences.writeString(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});

    await dataSource.writeDismissedWeek(monday);

    verify(
      () => preferences.writeString(
        key: CheckinLocalDataSource.dismissedWeekKey,
        value: '2026-11-02',
      ),
    ).called(1);
  });

  test('only the same week stays dismissed', () {
    when(() => preferences.readString(key: CheckinLocalDataSource.dismissedWeekKey))
        .thenReturn('2026-11-02');

    expect(dataSource.isDismissedFor(monday), isTrue);
    expect(dataSource.isDismissedFor(DateTime(2026, 11, 9)), isFalse);
  });

  test('a malformed stored week is treated as not dismissed', () {
    when(() => preferences.readString(key: CheckinLocalDataSource.dismissedWeekKey))
        .thenReturn('not-a-date');

    expect(dataSource.isDismissedFor(monday), isFalse);
  });
}
