import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea_status.dart';

/// One date idea the couple saved, planned or did.
final class const DateIdea({
  required final String id,
  required final String title,
  required final DateIdeaStatus status,
  final DateTime? plannedFor,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const DateIdea(id: 'fake', title: 'Piquenique no parque', status: DateIdeaStatus.saved);

  bool get isPlanned => status == DateIdeaStatus.planned;

  bool get isDone => status == DateIdeaStatus.done;

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
