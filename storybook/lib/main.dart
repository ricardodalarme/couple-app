import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:storybook/addons.dart';
import 'package:storybook/examples/examples.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      hasSafeArea: false,
      body: Widgetbook(
        appBuilder: (BuildContext context, Widget child) =>
            MaterialApp(debugShowCheckedModeBanner: false, home: child),
        addons: addons,
        directories: examples,
        home: const SizedBox.shrink(),
      ),
    );
  }
}
