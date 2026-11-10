import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/need/cubit/need_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

void main() {
  late SlipRepository repository;

  setUp(() => repository = _MockSlipRepository());

  NeedCubit build() => NeedCubit(slipRepository: repository);

  blocTest<NeedCubit, NeedState>(
    'send without a choice does nothing',
    build: build,
    act: (cubit) => cubit.send(),
    expect: () => <NeedState>[],
    verify: (_) => verifyNever(() => repository.sendNeed(any())),
  );

  blocTest<NeedCubit, NeedState>(
    'sends the chosen need',
    build: () {
      when(() => repository.sendNeed(any())).thenAnswer((_) async {});
      return build();
    },
    act: (cubit) async {
      cubit.onNeedToggled('hug');
      await cubit.send();
    },
    expect: () => [
      const NeedState(need: 'hug'),
      const NeedState(need: 'hug', sendAction: Loading()),
      const NeedState(need: 'hug', sendAction: Success(null)),
    ],
    verify: (_) => verify(() => repository.sendNeed('hug')).called(1),
  );

  blocTest<NeedCubit, NeedState>(
    'a failure keeps the choice and re-enables sending',
    build: () {
      when(() => repository.sendNeed(any()))
          .thenThrow(const LocalizedException(l10nKey: 'NOT_PAIRED'));
      return build();
    },
    act: (cubit) async {
      cubit.onNeedToggled('talk');
      await cubit.send();
    },
    expect: () => [
      const NeedState(need: 'talk'),
      const NeedState(need: 'talk', sendAction: Loading()),
      isA<NeedState>().having((s) => s.sendAction, 'sendAction', isA<Failure>()),
      const NeedState(need: 'talk'),
    ],
  );
}
