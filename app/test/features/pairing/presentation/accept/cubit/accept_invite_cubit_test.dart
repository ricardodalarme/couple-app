import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/accept/cubit/accept_invite_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late PairingRepository pairing;
  late ProfileRepository profile;

  setUp(() {
    pairing = _MockPairingRepository();
    profile = _MockProfileRepository();
    when(
      () => profile.getMyProfile(),
    ).thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'));
    when(
      () => pairing.getPartner(),
    ).thenAnswer((_) async => const Profile(id: 'p', avatarKind: 'initials', displayName: 'Rui'));
  });

  AcceptInviteCubit build() =>
      AcceptInviteCubit(pairingRepository: pairing, profileRepository: profile);

  test('the code is cleaned up, upper-cased and capped at the issued length', () {
    final cubit = build()..onCodeChanged(' abcd 2345 extra ');

    expect(cubit.state.code.value, 'ABCD2345');
    expect(cubit.state.code.isValid, isTrue);
  });

  test('a short code cannot be sent', () async {
    final cubit = build()..onCodeChanged('abc');
    await cubit.accept();

    expect(cubit.state.code.error, MinLengthValidationError.tooShort);
    verifyNever(() => pairing.acceptInvite(any()));
  });

  test('a valid code connects and loads both names', () async {
    when(() => pairing.acceptInvite('ABCD2345')).thenAnswer((_) async => true);
    final cubit = build()..onCodeChanged('abcd2345');
    await cubit.accept();

    expect(cubit.state.acceptAction, const Success<AcceptOutcome>(AcceptOutcome.connected));
    expect(cubit.state.partnerName, 'Rui');
    expect(cubit.state.selfName, 'Ana');
  });

  test('an unusable code shows the old-invite state and can be retried', () async {
    when(() => pairing.acceptInvite(any())).thenAnswer((_) async => false);
    final cubit = build()..onCodeChanged('abcd2345');
    await cubit.accept();

    expect(cubit.state.acceptAction, const Success<AcceptOutcome>(AcceptOutcome.unusable));

    cubit.tryAgain();
    expect(cubit.state.acceptAction, const Initial());
    expect(cubit.state.code.value, 'ABCD2345');
  });

  test('a server error is reported and reset', () async {
    when(() => pairing.acceptInvite(any()))
        .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'ALREADY_PAIRED'));
    final cubit = build()..onCodeChanged('abcd2345');
    await cubit.accept();

    expect(cubit.state.acceptAction, const Initial());
  });
}
