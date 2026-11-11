import 'dart:ui';

import 'package:equatable/equatable.dart';

/// One continuous line of a drawing; [points] are fractions of the canvas, from 0 to 1.
final class const DrawingStroke({required final List<Offset> points, required final int penIndex})
    with Equatable {
  DrawingStroke withPoint(Offset point) =>
      DrawingStroke(points: [...points, point], penIndex: penIndex);

  /// Whether any point lies within [radius] of [point].
  bool isNear(Offset point, double radius) =>
      points.any((candidate) => (candidate - point).distance <= radius);

  @override
  List<Object?> get props => [points, penIndex];
}
