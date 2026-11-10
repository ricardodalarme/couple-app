import 'package:equatable/equatable.dart';

/// Text typed in the quick capture screen and not saved yet.
final class const SlipDraft({
  required final String text,
  required final DateTime savedAt,
  final String? category,
}) with Equatable {

  factory fromMap(Map<String, dynamic> map) => SlipDraft(
    text: map['text'] as String,
    savedAt: DateTime.parse(map['savedAt'] as String),
    category: map['category'] as String?,
  );
  /// How long a draft stays worth restoring.
  static const Duration lifetime = Duration(hours: 1);

  bool isFresh(DateTime now) => now.difference(savedAt) < lifetime;

  Map<String, dynamic> toMap() => <String, dynamic>{
    'text': text,
    'savedAt': savedAt.toUtc().toIso8601String(),
    'category': category,
  };

  @override
  List<Object?> get props => [text, savedAt, category];
}
