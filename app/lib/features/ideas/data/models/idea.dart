import 'package:equatable/equatable.dart';

/// A small thing to do together, from the editorial list.
final class const Idea({
  required final String slug,
  required final String title,
  final String? body,
  final List<String> tags = const [],
}) with Equatable {
  /// A skeleton placeholder, never shown as a real idea.
  const new fake() : this(slug: 'fake', title: 'Deixe um bilhete', body: 'Pequeno e específico.');

  @override
  List<Object?> get props => [slug, title, body, tags];
}
