import 'package:flutter/material.dart' show AppBar, Scaffold;
import 'package:flutter/widgets.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.body,
    this.hasAppBar = true,
    this.hasSafeArea = true,
    this.title,
    super.key,
  });

  final String? title;
  final bool hasAppBar;
  final bool hasSafeArea;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final Widget body = hasSafeArea ? SafeArea(child: this.body) : this.body;

    return Scaffold(
      appBar: hasAppBar ? AppBar(title: title != null ? Text(title!) : null) : null,
      body: body,
    );
  }
}
