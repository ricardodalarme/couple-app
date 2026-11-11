import 'package:design_system/src/components/surfaces/base_category_label.dart';
import 'package:design_system/src/components/surfaces/base_face.dart';
import 'package:design_system/src/drawings/app_wash.dart';
import 'package:design_system/src/theme/app_pressable.dart';
import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// A tappable list card with a category label, text and a trailing visual.
///
/// The default [AppCategory.card] shows no label glyph unless [icon] is set.
class const BaseListCard({
  required final String categoryLabel,
  required final String title,
  final AppCategory category = AppCategory.card,
  final IconData? icon,
  final String? supportText,
  final FaceKind? face,
  final Widget? trailing,
  final VoidCallback? onTap,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final trailingChild =
        trailing ?? (face == null ? null : BaseFace(kind: face!, size: FaceSize.small));

    return AppPressable(
      onTap: onTap,
      isSemanticButton: onTap != null,
      borderRadius: BorderRadius.circular(AppRadius.card),
      enforceMinTapTarget: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: CustomPaint(
          painter: WashPainter(
            wash: AppWash.listRight,
            strong: category.washColor(colors),
            light: colors.washLight,
            background: colors.bgSurface,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpace.s20,
              top: AppSpace.s18,
              right: AppSpace.s18,
              bottom: AppSpace.s18,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseCategoryLabel(
                        text: categoryLabel,
                        category: category,
                        icon: icon,
                        showsIcon: icon != null || category != AppCategory.card,
                      ),
                      const SizedBox(height: AppSpace.s8),
                      Text(title, maxLines: 3, overflow: TextOverflow.ellipsis, style: text.body),
                      if (supportText != null) ...[
                        const SizedBox(height: AppSpace.s4),
                        Text(
                          supportText!,
                          style: text.caption.copyWith(color: colors.textSecondary),
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailingChild != null) ...[const SizedBox(width: AppSpace.s14), trailingChild],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
