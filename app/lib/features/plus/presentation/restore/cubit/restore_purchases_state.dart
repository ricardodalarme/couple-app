part of 'restore_purchases_cubit.dart';

final class const RestorePurchasesState({
  final Resource<RestoreOutcome> restoreAction = const Initial(),
}) with Equatable {
  RestorePurchasesState copyWith({Resource<RestoreOutcome>? restoreAction}) {
    return RestorePurchasesState(restoreAction: restoreAction ?? this.restoreAction);
  }

  @override
  List<Object?> get props => [restoreAction];
}
