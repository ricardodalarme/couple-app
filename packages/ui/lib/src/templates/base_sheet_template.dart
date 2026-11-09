import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Material;
import 'package:ui/src/components/actions/base_round_button.dart';
import 'package:ui/src/icons/app_icon.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// Sheet template: handle, optional header, scrollable choices and an optional
/// fixed primary action. It is the surface only; the modal route lives in
/// `BaseSheet`.
class const BaseSheetTemplate({
  required final Widget child,
  final String? title,
  final String? subtitle,
  final Widget? primaryAction,
  final VoidCallback? onClose,
  final String? closeSemanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colours = context.colors;
    final hasHeader = title != null || subtitle != null || onClose != null;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final maxHeight = MediaQuery.sizeOf(context).height * .9;

    return Material(
      color: colours.bgSurface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.sheet)),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: AppSpace.s20),
              child: Center(
                child: SizedBox(
                  key: ValueKey('baseSheetHandle'),
                  width: 36,
                  height: 5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppPalette.neutral150,
                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.xs)),
                    ),
                  ),
                ),
              ),
            ),
            if (hasHeader)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.s20,
                  AppSpace.s16,
                  onClose == null ? AppSpace.s20 : AppSpace.s8,
                  0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: context.text.titleSm.copyWith(
                                color: colours.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (subtitle != null)
                            Padding(
                              padding: EdgeInsets.only(top: title == null ? 0 : AppSpace.s4),
                              child: Text(
                                subtitle!,
                                style: context.text.caption.copyWith(color: colours.textSecondary),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (onClose != null)
                      BaseRoundButton(
                        icon: AppIcons.close,
                        onPressed: onClose,
                        semanticLabel: closeSemanticLabel,
                      ),
                  ],
                ),
              ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.s20,
                  hasHeader ? AppSpace.s12 : AppSpace.s16,
                  AppSpace.s20,
                  primaryAction == null ? AppSpace.s20 + bottomInset : 0,
                ),
                child: child,
              ),
            ),
            if (primaryAction != null)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.s20,
                  AppSpace.s16,
                  AppSpace.s20,
                  AppSpace.s20 + bottomInset,
                ),
                child: primaryAction,
              ),
          ],
        ),
      ),
    );
  }
}
