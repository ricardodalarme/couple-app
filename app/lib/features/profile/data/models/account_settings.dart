import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

final class const AccountSettings({
  required final AppThemeVariant theme,
  final String? partnerName,
  final DateTime? togetherSince,
  final DateTime? onboardedAt,
  final bool shareReadReceipts = false,
  final String? phase,
  final List<String> goals = const [],
  final String locale = 'pt-BR',
}) with Equatable {
  /// Whether the person finished the first profile step.
  bool get isOnboarded => onboardedAt != null;

  @override
  List<Object?> get props => [
    theme,
    partnerName,
    togetherSince,
    onboardedAt,
    shareReadReceipts,
    phase,
    goals,
    locale,
  ];
}
