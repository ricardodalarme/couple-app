import 'package:common_ui/src/tokens/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:material_ui/material_ui.dart' show ThemeExtension;

@immutable
class Palette extends ThemeExtension<Palette> {
  const new light({
    this.primary = Colors.blue400,
    this.onPrimary = Colors.white,
    this.secondary = Colors.green400,
    this.onSecondary = Colors.white,
    this.background = Colors.white,
    this.onBackground = Colors.black,
    this.container = Colors.gray100,
    this.onContainer = Colors.black,
    this.success = Colors.green400,
    this.onSuccess = Colors.white,
    this.error = Colors.red400,
    this.onError = Colors.white,
  });

  const new dark({
    this.primary = Colors.blue400,
    this.onPrimary = Colors.white,
    this.secondary = Colors.green400,
    this.onSecondary = Colors.white,
    this.background = Colors.black,
    this.onBackground = Colors.white,
    this.container = Colors.gray800,
    this.onContainer = Colors.white,
    this.success = Colors.green400,
    this.onSuccess = Colors.white,
    this.error = Colors.red400,
    this.onError = Colors.white,
  });

  const new _({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.container,
    required this.onContainer,
    required this.success,
    required this.onSuccess,
    required this.error,
    required this.onError,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color container;
  final Color onContainer;
  final Color success;
  final Color onSuccess;
  final Color error;
  final Color onError;

  @override
  ThemeExtension<Palette> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? background,
    Color? onBackground,
    Color? container,
    Color? onContainer,
    Color? success,
    Color? onSuccess,
    Color? error,
    Color? onError,
  }) {
    return Palette._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      container: container ?? this.container,
      onContainer: onContainer ?? this.onContainer,
      success: success ?? this.success,
      onSuccess: success ?? this.onSuccess,
      error: error ?? this.error,
      onError: error ?? this.onError,
    );
  }

  @override
  ThemeExtension<Palette> lerp(covariant ThemeExtension<Palette>? other, double t) {
    if (other is! Palette) {
      return this;
    }

    return Palette._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      container: Color.lerp(container, other.container, t)!,
      onContainer: Color.lerp(onContainer, other.onContainer, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Palette &&
        other.primary == primary &&
        other.onPrimary == onPrimary &&
        other.secondary == secondary &&
        other.onSecondary == onSecondary &&
        other.background == background &&
        other.onBackground == onBackground &&
        other.container == container &&
        other.onContainer == onContainer &&
        other.success == success &&
        other.onSuccess == onSuccess &&
        other.error == error &&
        other.onError == onError;
  }

  @override
  int get hashCode => Object.hash(
    primary,
    onPrimary,
    secondary,
    onSecondary,
    background,
    onBackground,
    container,
    onContainer,
    success,
    onSuccess,
    error,
    onError,
  );
}
