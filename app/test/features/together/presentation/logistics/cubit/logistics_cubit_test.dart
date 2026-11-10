import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/logistic_item.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/logistics/cubit/logistics_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockTogetherRepository() extends Mock implements TogetherRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late TogetherRepository together;
  late ProfileRepository profile;
  late PairingRepository pairing;

  const item = LogisticItem(id: 'i1', title: 'Comprar pão');

  setUp(() {
    together = _MockTogetherRepository();
    profile = _MockProfileRepository();
    pairing = _MockPairingRepository();
    when(
      () => profile.getMyProfile(),
    ).thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'));
    when(() => pairing.getPartner()).thenAnswer(
      (_) async => const Profile(id: 'partner', avatarKind: 'initials', displayName: 'Rui'),
    );
    when(() => together.getLogisticItems()).thenAnswer((_) async => [item]);
    when(
      () => together.addLogisticItem(
        id: any(named: 'id'),
        title: any(named: 'title'),
        assigneeId: any(named: 'assigneeId'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => together.setLogisticItemDone(
        id: any(named: 'id'),
        isDone: any(named: 'isDone'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => together.setLogisticItemAssignee(
        id: any(named: 'id'),
        assigneeId: any(named: 'assigneeId'),
      ),
    ).thenAnswer((_) async {});
    when(() => together.deleteLogisticItem(any())).thenAnswer((_) async {});
  });

  LogisticsCubit build() => LogisticsCubit(
    togetherRepository: together,
    profileRepository: profile,
    pairingRepository: pairing,
  );

  test('load reads the list, the person and the partner', () async {
    final cubit = build();

    await cubit.load();

    expect((cubit.state.items as Success<List<LogisticItem>>).value, [item]);
    expect(cubit.state.meId, 'me');
    expect(cubit.state.partnerId, 'partner');
    expect(cubit.state.partnerName, 'Rui');
    expect(cubit.state.hasPartner, isTrue);
  });

  test('an empty title cannot be added', () async {
    final cubit = build()..onTitleChanged('   ');

    await cubit.add();

    verifyNever(
      () => together.addLogisticItem(
        id: any(named: 'id'),
        title: any(named: 'title'),
        assigneeId: any(named: 'assigneeId'),
      ),
    );
  });

  test('adding clears the field and reads the list again', () async {
    final cubit = build();
    await cubit.load();
    cubit.onTitleChanged('Ligar para o encanador');

    await cubit.add();

    verify(
      () => together.addLogisticItem(
        id: any(named: 'id'),
        title: 'Ligar para o encanador',
        assigneeId: null,
      ),
    ).called(1);
    expect(cubit.state.title, '');
    verify(() => together.getLogisticItems()).called(2);
  });

  test('toggling flips the done state', () async {
    final cubit = build();
    await cubit.load();

    await cubit.toggleDone(item);

    verify(() => together.setLogisticItemDone(id: 'i1', isDone: true)).called(1);
  });

  test('assigning to both sends no assignee', () async {
    final cubit = build();
    await cubit.load();

    await cubit.assign(item);

    verify(() => together.setLogisticItemAssignee(id: 'i1', assigneeId: null)).called(1);
  });

  test('a failed change keeps the list and reports it once', () async {
    when(() => together.deleteLogisticItem(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await cubit.delete(item);

    expect((cubit.state.items as Success<List<LogisticItem>>).value, [item]);
    expect(cubit.state.changeAction, isA<Initial>());
  });

  test('without a partner the list is only for the person', () async {
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    final cubit = build();

    await cubit.load();

    expect(cubit.state.hasPartner, isFalse);
  });
}
