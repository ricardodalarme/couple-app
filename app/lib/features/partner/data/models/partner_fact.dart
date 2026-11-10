import 'package:equatable/equatable.dart';

/// The categories of a note, matching the server values.
const List<String> partnerFactCategories = [
  'likes',
  'dislikes',
  'sizes',
  'health',
  'comfort',
  'people',
  'other',
];

/// The longest label and value the server accepts.
const int partnerFactLabelMaxLength = 80;
const int partnerFactValueMaxLength = 500;

/// One private note about the partner; only its author ever sees it.
final class const PartnerFact({
  required final String id,
  required final String label,
  required final String value,
  final String? category,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const PartnerFact(id: 'fake', label: 'Café', value: 'Sem açúcar');

  @override
  List<Object?> get props => [id, label, value, category];
}
