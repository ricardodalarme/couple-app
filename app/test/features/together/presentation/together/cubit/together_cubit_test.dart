import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockCheckinRepository() extends Mock implements CheckinRepository;

void main() {
  late PairingRepository pairingRepository;
  late CheckinRepository checkinRepository;

  setUp(() {
    pairingRepository = _MockPairingRepository();
    checkinRepository = _MockCheckinRepository();
    when(pairingRepository.getPartner).thenAnswer((_) async => null);
    when(checkinRepository.isCurrentWeekDismissed).thenAnswer((_) async => false);
  });

  test('a dismissed week hides the check-in entry', () async {
    when(checkinRepository.isCurrentWeekDismissed).thenAnswer((_) async => true);
    final cubit = TogetherCubit(
      pairingRepository: pairingRepository,
      checkinRepository: checkinRepository,
    );
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.showCheckin, isFalse);
  });

  test('an unreadable dismissal keeps the entry visible', () async {
    when(checkinRepository.isCurrentWeekDismissed).thenThrow(Exception());
    final cubit = TogetherCubit(
      pairingRepository: pairingRepository,
      checkinRepository: checkinRepository,
    );
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.showCheckin, isTrue);
  });
}
