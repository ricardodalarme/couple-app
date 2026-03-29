import 'package:common_ui/src/theme/theme_extensions.dart';
import 'package:flutter/material.dart' show AppBar, Scaffold;
import 'package:flutter/widgets.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.body,
    this.hasAppBar = true,
    this.hasSafeArea = true,
    this.title,
    this.actions,
    super.key,
  });

  final String? title;
  final bool hasAppBar;
  final bool hasSafeArea;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final Widget body = hasSafeArea ? SafeArea(child: this.body) : this.body;

    return Scaffold(
      backgroundColor: context.palette.background,
      appBar: hasAppBar
          ? AppBar(title: title != null ? Text(title!) : null, actions: actions)
          : null,
      body: body,
    );
  }
}
