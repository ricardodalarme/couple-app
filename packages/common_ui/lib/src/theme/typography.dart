import 'package:common_ui/src/tokens/font_sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:material_ui/material_ui.dart' show ThemeExtension;

@immutable
class const Typography({
  final TextStyle titleLarge = const TextStyle(
    fontSize: FontSizes.xxxlarge,
    fontWeight: FontWeight.bold,
  ),
  final TextStyle titleMedium = const TextStyle(
    fontSize: FontSizes.xxlarge,
    fontWeight: FontWeight.bold,
  ),
  final TextStyle titleSmall = const TextStyle(
    fontSize: FontSizes.xlarge,
    fontWeight: FontWeight.bold,
  ),
  final TextStyle bodyLarge = const TextStyle(
    fontSize: FontSizes.large,
    fontWeight: FontWeight.normal,
  ),
  final TextStyle bodyMedium = const TextStyle(
    fontSize: FontSizes.medium,
    fontWeight: FontWeight.normal,
  ),
  final TextStyle bodySmall = const TextStyle(
    fontSize: FontSizes.small,
    fontWeight: FontWeight.normal,
  ),
  final TextStyle labelLarge = const TextStyle(
    fontSize: FontSizes.large,
    fontWeight: FontWeight.w500,
  ),
  final TextStyle labelMedium = const TextStyle(
    fontSize: FontSizes.medium,
    fontWeight: FontWeight.w500,
  ),
  final TextStyle labelSmall = const TextStyle(
    fontSize: FontSizes.small,
    fontWeight: FontWeight.w500,
  ),
}) extends ThemeExtension<Typography> {
  @override
  ThemeExtension<Typography> copyWith({
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) {
    return Typography(
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  ThemeExtension<Typography> lerp(covariant ThemeExtension<Typography>? other, double t) {
    if (other is! Typography) {
      return this;
    }

    return Typography(
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Typography) return false;
    final otherTypography = other;
    return otherTypography.titleLarge == titleLarge &&
        otherTypography.titleMedium == titleMedium &&
        otherTypography.titleSmall == titleSmall &&
        otherTypography.bodyLarge == bodyLarge &&
        otherTypography.bodyMedium == bodyMedium &&
        otherTypography.bodySmall == bodySmall &&
        otherTypography.labelLarge == labelLarge &&
        otherTypography.labelMedium == labelMedium &&
        otherTypography.labelSmall == labelSmall;
  }

  @override
  int get hashCode {
    return Object.hash(
      titleLarge,
      titleMedium,
      titleSmall,
      bodyLarge,
      bodyMedium,
      bodySmall,
      labelLarge,
      labelMedium,
      labelSmall,
    );
  }
}
