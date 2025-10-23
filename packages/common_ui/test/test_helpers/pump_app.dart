import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Material, MaterialApp;
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: Material(child: widget),
      ),
    );
  }
}
