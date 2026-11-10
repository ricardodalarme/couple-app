import 'package:equatable/equatable.dart';

/// What the person has: Plus (their own or their partner's) or the free plan with its monthly room.
final class const PlusState({
  required final bool hasPlus,
  final bool isPaidByPartner = false,
  final int slipsLeft = 0,
  final int cardsLeft = 0,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const PlusState(hasPlus: false, slipsLeft: 10, cardsLeft: 1);

  @override
  List<Object?> get props => [hasPlus, isPaidByPartner, slipsLeft, cardsLeft];
}

/// A plan price as the store reports it; the text, currency and taxes are the store's own.
final class const PlanPrice({
  required final String id,
  required final String price,
  required final bool isYearly,
}) with Equatable {
  @override
  List<Object?> get props => [id, price, isYearly];
}
