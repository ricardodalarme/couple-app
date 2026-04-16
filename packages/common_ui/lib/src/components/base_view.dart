import 'package:common_ui/src/components/base_app_bar.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:flutter/material.dart' show Scaffold;
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
    final body = hasSafeArea ? SafeArea(child: this.body) : this.body;

    return Scaffold(
      backgroundColor: context.palette.background,
      appBar: hasAppBar ? BaseAppBar(title: title, actions: actions) : null,
      body: body,
    );
  }
}
