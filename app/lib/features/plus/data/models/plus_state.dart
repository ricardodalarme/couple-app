import 'package:equatable/equatable.dart';

/// What the person has: Plus (their own or their partner's) or the free plan with its monthly room.
final class const PlusState({
  required final bool hasPlus,
  final bool isPaidByPartner = false,
  final int slipsLeft = 0,
  final int cardsLeft = 0,
  final String? status,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const PlusState(hasPlus: false, slipsLeft: 10, cardsLeft: 1);

  /// Whether a payment failed; Plus stays on during the grace period.
  bool get hasBillingProblem => status == 'billing_issue' || status == 'grace';

  @override
  List<Object?> get props => [hasPlus, isPaidByPartner, slipsLeft, cardsLeft, status];
}

/// How a purchase attempt ended.
enum PurchaseOutcome() {
  /// Plus is active.
  unlocked,

  /// The store accepted it but the server has not confirmed yet.
  pending,

  /// The person backed out; nothing is shown.
  cancelled,
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
