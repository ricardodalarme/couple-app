import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/models/reaction_pattern.dart';

/// A saved reaction result: the ordered patterns and, when known, the partner's name.
final class const FightStyleResult({required final List<String> ranked, final String? partnerName})
    with Equatable {
  /// The saved result, or `null` when the stored ranking is empty or has unknown keys.
  static FightStyleResult? fromRecord(List<String>? ranked, {String? partnerName}) {
    if (ranked == null || ranked.isEmpty) return null;
    if (!ranked.every(reactionPatternKeys.contains)) return null;

    return FightStyleResult(ranked: ranked, partnerName: partnerName);
  }

  /// The leading pattern; a stored ranking always has a known first key.
  String get topPattern => ranked.first;

  @override
  List<Object?> get props => [ranked, partnerName];
}
