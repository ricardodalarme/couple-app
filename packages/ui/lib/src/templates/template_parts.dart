import 'package:flutter/widgets.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// Scrollable, width-capped page body shared by the templates.
class const PageContent({
  required final Widget child,
  final EdgeInsetsGeometry? padding,
  final ScrollController? controller,
  final bool centre = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding:
          padding ??
          const EdgeInsets.fromLTRB(
            AppSpace.screenMargin,
            AppSpace.screenTop,
            AppSpace.screenMargin,
            AppSpace.scrollTail,
          ),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpace.maxContentWidth),
          child: centre ? Center(child: child) : child,
        ),
      ),
    );
  }
}

/// Fixed footer that stacks its buttons below [AppSpace.compactWidth].
class const FooterBar({
  required final List<Widget> children,
  final bool hasBackground = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colours = context.colors;

    final buttons = LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < AppSpace.compactWidth;

        if (children.length == 1) return children.single;

        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < children.length; i++) ...[
                if (i > 0) const SizedBox(height: AppSpace.s10),
                children[i],
              ],
            ],
          );
        }

        return Row(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) const SizedBox(width: AppSpace.s10),
              Expanded(child: children[i]),
            ],
          ],
        );
      },
    );

    final footer = SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpace.screenMargin,
          AppSpace.s16,
          AppSpace.screenMargin,
          AppSpace.s34,
        ),
        child: buttons,
      ),
    );

    if (!hasBackground) return footer;

    return ColoredBox(color: colours.bgScreen, child: footer);
  }
}
