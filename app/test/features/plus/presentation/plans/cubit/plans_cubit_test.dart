import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/plans/cubit/plans_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late PlusRepository repository;

  const prices = [
    PlanPrice(id: 'monthly', price: r'R$ 19,90', isYearly: false),
    PlanPrice(id: 'annual', price: r'R$ 149,90', isYearly: true),
  ];

  setUp(() => repository = _MockPlusRepository());

  PlansCubit build() => PlansCubit(plusRepository: repository);

  test('without Plus the store prices are read too', () async {
    when(() => repository.getPlus())
        .thenAnswer((_) async => const PlusState(hasPlus: false, slipsLeft: 4, cardsLeft: 1));
    when(() => repository.getPrices()).thenAnswer((_) async => prices);
    final cubit = build();

    await cubit.load();

    expect((cubit.state.prices as Success<List<PlanPrice>>).value, prices);
  });

  test('with Plus no prices are asked for', () async {
    when(() => repository.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: true));
    final cubit = build();

    await cubit.load();

    verifyNever(() => repository.getPrices());
    expect(cubit.state.prices, isA<Initial>());
  });

  test('a partner Plus counts for the couple', () async {
    when(() => repository.getPlus())
        .thenAnswer((_) async => const PlusState(hasPlus: true, isPaidByPartner: true));
    final cubit = build();

    await cubit.load();

    expect((cubit.state.plus as Success<PlusState>).value.isPaidByPartner, isTrue);
  });

  test('an unreachable store shows a retry state, never a price', () async {
    when(() => repository.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => repository.getPrices()).thenThrow(StateError('store'));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.prices, isA<Failure>());

    when(() => repository.getPrices()).thenAnswer((_) async => prices);
    await cubit.loadPrices();
    expect(cubit.state.prices, isA<Success<List<PlanPrice>>>());
  });

  test('a cancelled purchase returns silently', () async {
    when(() => repository.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => repository.getPrices()).thenAnswer((_) async => prices);
    when(() => repository.purchase('monthly')).thenAnswer((_) async => PurchaseOutcome.cancelled);
    final cubit = build();
    await cubit.load();

    cubit.onPlanChosen('monthly');
    await cubit.purchase();

    expect(cubit.state.purchaseAction, isA<Initial>());
  });

  test('a confirmed purchase unlocks Plus', () async {
    var reads = 0;
    when(() => repository.getPlus()).thenAnswer((_) async => PlusState(hasPlus: reads++ > 0));
    when(() => repository.getPrices()).thenAnswer((_) async => prices);
    when(() => repository.purchase('annual')).thenAnswer((_) async => PurchaseOutcome.unlocked);
    final cubit = build();
    await cubit.load();

    cubit.onPlanChosen('annual');
    await cubit.purchase();

    expect((cubit.state.plus as Success<PlusState>).value.hasPlus, isTrue);
    expect(
      (cubit.state.purchaseAction as Success<PurchaseOutcome>).value,
      PurchaseOutcome.unlocked,
    );
  });

  test('a purchase the server has not confirmed stays pending', () async {
    when(() => repository.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => repository.getPrices()).thenAnswer((_) async => prices);
    when(() => repository.purchase('monthly')).thenAnswer((_) async => PurchaseOutcome.pending);
    final cubit = build();
    await cubit.load();

    cubit.onPlanChosen('monthly');
    await cubit.purchase();

    expect((cubit.state.purchaseAction as Success<PurchaseOutcome>).value, PurchaseOutcome.pending);
  });

  test('a billing problem keeps Plus on and says so', () {
    const state = PlusState(hasPlus: true, status: 'billing_issue');

    expect(state.hasBillingProblem, isTrue);
    expect(state.hasPlus, isTrue);
  });

  test('a failed plan read is a failure the page can retry', () async {
    when(() => repository.getPlus()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.plus, isA<Failure>());
  });
}
