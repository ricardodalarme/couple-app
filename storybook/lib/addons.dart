import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show ThemeData;
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookTheme<ThemeData>> themes = [
  WidgetbookTheme(
    name: 'Light',
    data: AppTheme.light,
  ),
  WidgetbookTheme(
    name: 'Dark',
    data: AppTheme.dark,
  ),
];

final List<double> textScales = [
  1.0,
  1.5,
  2.0,
];

final List<WidgetbookAddon<dynamic>> addons = [
  MaterialThemeAddon(themes: themes),
  TextScaleAddon(),
  AlignmentAddon(),
];
