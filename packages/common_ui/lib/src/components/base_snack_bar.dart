import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show ScaffoldMessenger, SnackBar;

enum SnackBarType { info, success, error }

extension ContextSnackBarExtension on BuildContext {
  void showSnackBar(String message, {SnackBarType type = SnackBarType.info}) {
    final Color backgroudColor = switch (type) {
      SnackBarType.info => colors.inverseSurface,
      SnackBarType.success => Colors.green400,
      SnackBarType.error => Colors.red400,
    };
    final baseSnackBar = SnackBar(content: Text(message), backgroundColor: backgroudColor);
    ScaffoldMessenger.of(this).showSnackBar(baseSnackBar);
  }
}
