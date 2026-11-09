import 'package:flutter/widgets.dart';
import 'package:ui/src/templates/template_parts.dart';

/// Tab screen template: header, body and a tab bar whose content scrolls
/// underneath it. Render it inside `BaseView`.
class const BaseTabContent({
  required final Widget body,
  required final Widget tabBar,
  final ScrollController? controller,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageContent(
            controller: controller,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [body]),
          ),
        ),
        Positioned(left: 0, right: 0, bottom: 0, child: tabBar),
      ],
    );
  }
}
