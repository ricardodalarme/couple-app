import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact_category.dart';

/// The longest label and value the server accepts.
const int partnerFactLabelMaxLength = 80;
const int partnerFactValueMaxLength = 500;

/// One private note about the partner; only its author ever sees it.
final class const PartnerFact({
  required final String id,
  required final String label,
  required final String value,
  final PartnerFactCategory? category,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const PartnerFact(id: 'fake', label: 'Café', value: 'Sem açúcar');

  @override
  List<Object?> get props => [id, label, value, category];
}
