part of 'plans_cubit.dart';

final class const PlansState({
  final Resource<PlusState> plus = const Loading(),
  final Resource<List<PlanPrice>> prices = const Initial(),
}) with Equatable {
  PlansState copyWith({Resource<PlusState>? plus, Resource<List<PlanPrice>>? prices}) {
    return PlansState(plus: plus ?? this.plus, prices: prices ?? this.prices);
  }

  @override
  List<Object?> get props => [plus, prices];
}
