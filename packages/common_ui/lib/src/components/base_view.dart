import 'package:common_ui/src/components/base_app_bar.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter/widgets.dart';

class const BaseView({
  required final Widget body,
  final bool hasAppBar = true,
  final bool hasSafeArea = true,
  final String? title,
  final List<Widget>? actions,
  super.key,
}) extends StatelessWidget {
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
