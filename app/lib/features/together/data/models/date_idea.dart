import 'package:equatable/equatable.dart';

/// One date idea the couple saved, planned or did.
final class const DateIdea({
  required final String id,
  required final String title,
  required final String status,
  final DateTime? plannedFor,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const DateIdea(id: 'fake', title: 'Piquenique no parque', status: 'saved');

  bool get isPlanned => status == 'planned';

  bool get isDone => status == 'done';

  @override
  List<Object?> get props => [id, title, status, plannedFor];
}

/// An editorial date idea offered when the couple has none yet.
final class const DateIdeaSuggestion({required final String slug, required final String title})
    with Equatable {
  @override
  List<Object?> get props => [slug, title];
}

/// One piece of bundled help content, such as a bad-day tip or a conversation opener.
final class const HelpItem({
  required final String slug,
  required final String title,
  final String? body,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const HelpItem(slug: 'fake', title: 'Pergunte como foi o dia', body: 'E escute.');

  @override
  List<Object?> get props => [slug, title, body];
}

/// The longest idea title the server accepts.
const int dateIdeaTitleMaxLength = 120;
