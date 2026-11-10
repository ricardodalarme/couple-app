import 'package:biometric_service/biometric_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/models/deletion_request.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete/cubit/delete_account_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAccountRepository() extends Mock implements AccountRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockBiometricService() extends Mock implements BiometricService;

void main() {
  late AccountRepository account;
  late PairingRepository pairing;
  late BiometricService biometrics;

  final deletion = DeletionRequest(
    requestedAt: DateTime(2026, 11, 10),
    purgeAfter: DateTime(2026, 11, 24),
  );

  setUp(() {
    account = _MockAccountRepository();
    pairing = _MockPairingRepository();
    biometrics = _MockBiometricService();
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    when(() => account.getDeletion()).thenAnswer((_) async => null);
    when(() => biometrics.isDeviceSupported()).thenAnswer((_) async => false);
    when(() => account.requestDeletion()).thenAnswer((_) async => deletion);
    when(() => account.cancelDeletion()).thenAnswer((_) async {});
  });

  DeleteAccountCubit build() => DeleteAccountCubit(
    repository: account,
    pairingRepository: pairing,
    biometricService: biometrics,
  );

  test('load shows the partner name and no pending request', () async {
    when(
      () => pairing.getPartner(),
    ).thenAnswer((_) async => const Profile(id: 'p', avatarKind: 'initials', displayName: 'Dani'));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.partnerName, 'Dani');
    expect(cubit.state.pending, isNull);
  });

  test('a device without a check requests deletion after the confirmation', () async {
    final cubit = build();
    await cubit.load();

    await cubit.request(reason: 'Confirm');

    verify(() => account.requestDeletion()).called(1);
    expect(cubit.state.pending?.purgeAfter, deletion.purgeAfter);
  });

  test('a refused owner check requests nothing', () async {
    when(() => biometrics.isDeviceSupported()).thenAnswer((_) async => true);
    when(() => biometrics.authenticate(any())).thenAnswer((_) async => false);
    final cubit = build();
    await cubit.load();

    await cubit.request(reason: 'Confirm');

    verifyNever(() => account.requestDeletion());
    expect(cubit.state.action, isA<Initial>());
  });

  test('cancelling clears the pending request', () async {
    when(() => account.getDeletion()).thenAnswer((_) async => deletion);
    final cubit = build();
    await cubit.load();
    expect(cubit.state.pending, isNotNull);

    await cubit.cancel();

    verify(() => account.cancelDeletion()).called(1);
    expect(cubit.state.pending, isNull);
  });
}
