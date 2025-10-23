import 'package:flutter/material.dart' show AppBar, Scaffold;
import 'package:flutter/widgets.dart';

class BaseView extends StatelessWidget {
  const BaseView({required this.body, this.hasAppBar = true, this.title, super.key});

  final String? title;
  final bool hasAppBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar ? AppBar(title: title != null ? Text(title!) : null) : null,
      body: SafeArea(child: body),
    );
  }
}
