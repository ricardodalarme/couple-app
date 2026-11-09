import 'dart:math' as math;

import 'package:ui/ui.dart';

const double _itemHeight = 46;
const double _primaryActionSide = 46;
const double _labelGap = 3;
const double _sidePadding = 8;

/// One position in a [BaseTabBar].
///
/// The item marked [isPrimaryAction] renders the dark plus circle instead of an
/// icon and label; it is the slot that starts a new slip.
class const BaseTabBarItem({
  required final String label,
  required final IconData icon,
  final IconData? selectedIcon,
  final bool isPrimaryAction = false,
  final String? semanticLabel,
});

/// The five-column bar fixed to the bottom of every tab screen.
///
/// The bar is [AppSpace.tabBarHeight] tall including the safe area, and uses a
/// translucent tab bar surface over a hairline top border. The active item
/// shows its filled icon and label in the accent colour; the centre item
/// carries the 46pt plus circle. Above 200% text scale the labels drop and the
/// icons carry the meaning. Screens hide the bar inside flows.
class const BaseTabBar({
  required final List<BaseTabBarItem> items,
  required final int currentIndex,
  required final ValueChanged<int> onSelected,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final barHeight = math.max(AppSpace.tabBarHeight, _itemHeight + _sidePadding + bottomInset);

    return SizedBox(
      height: barHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.bgTabBar,
          border: Border(top: BorderSide(color: colors.borderDefault)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(_sidePadding, _sidePadding, _sidePadding, bottomInset),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < items.length; index++)
                Expanded(
                  child: _TabBarSlot(
                    item: items[index],
                    isSelected: index == currentIndex,
                    onTap: () => onSelected(index),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _TabBarSlot({
  required final BaseTabBarItem item,
  required final bool isSelected,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPressable(
      onTap: onTap,
      isSelected: isSelected,
      semanticLabel: item.semanticLabel ?? item.label,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: _itemHeight),
        child: Center(
          child: item.isPrimaryAction
              ? const _PrimaryAction()
              : _TabLabel(
                  item: item,
                  isSelected: isSelected,
                  tabFontSize: context.text.tab.fontSize,
                ),
        ),
      ),
    );
  }
}

class const _PrimaryAction() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: _primaryActionSide,
      height: _primaryActionSide,
      child: DecoratedBox(
        decoration: BoxDecoration(color: colors.actionPrimary, shape: BoxShape.circle),
        child: Center(
          child: AppIcon(icon: AppIcons.plus, size: AppIconSize.lg, color: colors.textOnAction),
        ),
      ),
    );
  }
}

class const _TabLabel({
  required final BaseTabBarItem item,
  required final bool isSelected,
  required final double? tabFontSize,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // At large text sizes the label would wrap and clip; the icon plus its
    // screen-reader label carries the meaning instead.
    final showsLabel = MediaQuery.textScalerOf(context).scale(tabFontSize ?? 10.5) <= 16;
    final ink = isSelected ? colors.accentLabel : colors.textSecondary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(
          icon: isSelected ? (item.selectedIcon ?? item.icon) : item.icon,
          size: AppIconSize.lg,
          color: isSelected ? colors.accentLabel : colors.iconMuted,
        ),
        if (showsLabel) ...[
          const SizedBox(height: _labelGap),
          Text(
            item.label,
            style: context.text.tab.copyWith(color: ink),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
