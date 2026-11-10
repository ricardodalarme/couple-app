import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/models/active_invite.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/invite/cubit/invite_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_service/share_service.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockShareService() extends Mock implements ShareService;

void main() {
  late PairingRepository pairing;
  late ProfileRepository profile;
  late ShareService share;
  final invite = ActiveInvite(id: 'i1', code: 'ABCD2345', expiresAt: DateTime(2030));

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    pairing = _MockPairingRepository();
    profile = _MockProfileRepository();
    share = _MockShareService();
    when(() => pairing.getOrCreateInvite(any())).thenAnswer((_) async => invite);
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose, partnerName: 'Marina'));
  });

  InviteCubit build() =>
      InviteCubit(pairingRepository: pairing, profileRepository: profile, shareService: share);

  test('start loads the partner name and the invite', () async {
    final cubit = build();
    await cubit.start();

    expect(cubit.state.invite, Success(invite));
    expect(cubit.state.partnerName, 'Marina');
  });

  test('start keeps working when the partner name cannot be read', () async {
    when(() => profile.getMySettings()).thenAnswer((_) async => throw Exception());
    final cubit = build();
    await cubit.start();

    expect(cubit.state.invite, Success(invite));
    expect(cubit.state.partnerName, isNull);
  });

  test('a failing create shows a failure that can be retried', () async {
    when(() => pairing.getOrCreateInvite(any()))
        .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.start();

    expect(cubit.state.invite, isA<Failure>());
  });

  test('sharing marks the invite as sent', () async {
    when(() => share.shareText(text: any(named: 'text'))).thenAnswer((_) async {});
    final cubit = build();
    await cubit.start();
    await cubit.share('hello');

    expect(cubit.state.hasShared, isTrue);
  });

  test('a share sheet failure does not mark the invite as sent', () async {
    when(() => share.shareText(text: any(named: 'text')))
        .thenAnswer((_) async => throw Exception());
    final cubit = build();
    await cubit.start();
    await cubit.share('hello');

    expect(cubit.state.hasShared, isFalse);
  });

  test('revoke cancels the invite on the server', () async {
    when(() => pairing.cancelInvite('i1')).thenAnswer((_) async {});
    final cubit = build();
    await cubit.start();
    await cubit.revoke();

    verify(() => pairing.cancelInvite('i1')).called(1);
    expect(cubit.state.revokeAction, const Success<void>(null));
  });

  test('renew creates a new invite and goes back to the compose state', () async {
    final fresh = ActiveInvite(id: 'i2', code: 'WXYZ6789', expiresAt: DateTime(2030));
    when(() => pairing.createInvite()).thenAnswer((_) async => fresh);
    final cubit = build();
    await cubit.start();
    await cubit.renew();

    expect(cubit.state.invite, Success(fresh));
    expect(cubit.state.hasShared, isFalse);
  });
}
