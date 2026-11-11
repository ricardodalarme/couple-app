import 'package:equatable/equatable.dart';

/// One question, phrase or mission of a game.
final class const GameItem({
  required final String slug,
  required final String title,
  final String? body,
}) with Equatable {
  factory fake() => const GameItem(slug: 'fake', title: 'Uma pergunta leve para vocês dois?');

  /// The ready-made answers written in the content body, or empty for an open answer.
  List<String> get options {
    final text = body;
    if (text == null || !text.contains('|')) return const [];

    return [
      for (final option in text.split('|'))
        if (option.trim().isNotEmpty) option.trim(),
    ];
  }

  @override
  List<Object?> get props => [slug, title, body];
}
