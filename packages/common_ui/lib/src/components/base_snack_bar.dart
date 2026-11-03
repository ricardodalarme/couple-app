import 'package:common_ui/common_ui.dart';
import 'package:material_ui/material_ui.dart' show ScaffoldMessenger, SnackBar;

enum SnackBarType() {
  info,
  success,
  error,
}

extension ContextSnackBarExtension on BuildContext {
  void showSnackBar(String message, {SnackBarType type = SnackBarType.info}) {
    final backgroudColor = switch (type) {
      SnackBarType.info => palette.container,
      SnackBarType.success => palette.success,
      SnackBarType.error => palette.error,
    };
    final baseSnackBar = SnackBar(content: Text(message), backgroundColor: backgroudColor);
    ScaffoldMessenger.of(this).showSnackBar(baseSnackBar);
  }
}
