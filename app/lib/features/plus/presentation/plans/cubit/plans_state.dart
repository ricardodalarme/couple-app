part of 'plans_cubit.dart';

final class const PlansState({
  final Resource<PlusState> plus = const Loading(),
  final Resource<List<PlanPrice>> prices = const Initial(),
  final String? chosenId,
  final Resource<PurchaseOutcome> purchaseAction = const Initial(),
}) with Equatable {
  PlansState copyWith({
    Resource<PlusState>? plus,
    Resource<List<PlanPrice>>? prices,
    String? chosenId,
    Resource<PurchaseOutcome>? purchaseAction,
  }) {
    return PlansState(
      plus: plus ?? this.plus,
      prices: prices ?? this.prices,
      chosenId: chosenId ?? this.chosenId,
      purchaseAction: purchaseAction ?? this.purchaseAction,
    );
  }

  @override
  List<Object?> get props => [plus, prices, chosenId, purchaseAction];
}
