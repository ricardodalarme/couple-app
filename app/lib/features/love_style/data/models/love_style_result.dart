import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/love_style/data/models/love_pattern.dart';

/// A saved love-style result: the ordered patterns.
final class const LoveStyleResult({required final List<String> ranked}) with Equatable {
  /// The saved result, or `null` when the stored ranking is empty or has unknown keys.
  static LoveStyleResult? fromRecord(List<String>? ranked) {
    if (ranked == null || ranked.isEmpty) return null;
    if (!ranked.every(lovePatternKeys.contains)) return null;

    return LoveStyleResult(ranked: ranked);
  }

  /// The leading pattern; a stored ranking always has a known first key.
  String get topPattern => ranked.first;

  @override
  List<Object?> get props => [ranked];
}
