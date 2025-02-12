import 'package:flutter/material.dart';
import 'package:storybook/addons.dart';
import 'package:storybook/examples/examples.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder:
          (BuildContext context, Widget child) =>
              MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(body: child)),
      addons: addons,
      directories: examples,
    );
  }
}
