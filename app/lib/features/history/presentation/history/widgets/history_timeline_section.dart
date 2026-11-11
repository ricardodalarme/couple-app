import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const HistoryTimelineSection({
  required final HistoryOverview overview,
  required final ValueChanged<HistoryMilestone> onMilestoneTap,
  required final VoidCallback onAddMilestoneTap,
  required final VoidCallback onSuggestedFirstTap,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final cubit = context.read<HistoryCubit>();
    final selectedYear = context.select((HistoryCubit c) => c.state.selectedYear);
    final showUnknownOnly = context.select((HistoryCubit c) => c.state.showUnknownOnly);
    final visibleYearCount = context.select((HistoryCubit c) => c.state.visibleYearCount);

    if (overview.milestones.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText),
          const SizedBox(height: AppSpace.s16),
          _TimelineItemRow(
            title: l10n.suggestedFirstTitle,
            subtitle: l10n.suggestedFirstSub,
            icon: AppIcons.heart_filled,
            isFirst: true,
            isLast: false,
            onTap: onSuggestedFirstTap,
          ),
          _AddMilestoneRow(label: l10n.addMilestoneRow, isFirst: false, onTap: onAddMilestoneTap),
        ],
      );
    }

    final availableYears = overview.availableYears;
    final hasUnknown = overview.hasUnknownYearMilestones;
    final showFilterRow = availableYears.length > 1 || (availableYears.isNotEmpty && hasUnknown);

    final List<HistoryMilestone> visibleMilestones;
    int? nextEarlierYear;

    if (showUnknownOnly) {
      visibleMilestones = [
        for (final m in overview.milestones)
          if (m.isUnknownDate) m,
      ];
    } else if (selectedYear != null) {
      visibleMilestones = [
        for (final m in overview.milestones)
          if (m.year == selectedYear) m,
      ];
    } else if (availableYears.length > visibleYearCount) {
      final activeYears = availableYears.take(visibleYearCount).toSet();
      nextEarlierYear = availableYears[visibleYearCount];
      visibleMilestones = [
        for (final m in overview.milestones)
          if (m.year != null && activeYears.contains(m.year)) m,
      ];
    } else {
      visibleMilestones = overview.milestones;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.timelineSection, isLabel: true),
        if (showFilterRow) ...[
          const SizedBox(height: AppSpace.s10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: AppSpace.s8,
              children: [
                BaseChoiceChip(
                  label: l10n.recentChip,
                  isSelected: selectedYear == null && !showUnknownOnly,
                  onTap: () => cubit.selectYear(null),
                ),
                for (final year in availableYears)
                  BaseChoiceChip(
                    label: year.toString(),
                    isSelected: selectedYear == year && !showUnknownOnly,
                    onTap: () => cubit.selectYear(year),
                  ),
                if (hasUnknown)
                  BaseChoiceChip(
                    label: l10n.unknownYearChip,
                    isSelected: showUnknownOnly,
                    onTap: cubit.selectUnknownYear,
                  ),
              ],
            ),
          ),
        ],
        if (overview.hasMoreHistory) ...[
          const SizedBox(height: AppSpace.s8),
          BaseNote(text: l10n.timelineRecentNote),
        ],
        const SizedBox(height: AppSpace.s12),
        for (var i = 0; i < visibleMilestones.length; i++)
          _TimelineItemRow(
            title: visibleMilestones[i].title,
            subtitle: HistoryDateFormatter.formatMilestoneSubtitle(l10n, visibleMilestones[i]),
            icon: _iconForKind(visibleMilestones[i].kind),
            isFirst: i == 0,
            isLast: false,
            onTap: () => onMilestoneTap(visibleMilestones[i]),
          ),
        if (nextEarlierYear != null) ...[
          const SizedBox(height: AppSpace.s4),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: AppSpace.s24, bottom: AppSpace.s10),
              child: BaseTextLink(
                text: l10n.loadEarlierYear(year: nextEarlierYear),
                onPressed: cubit.showMoreYears,
              ),
            ),
          ),
        ],
        _AddMilestoneRow(
          label: l10n.addMilestoneRow,
          isFirst: visibleMilestones.isEmpty,
          onTap: onAddMilestoneTap,
        ),
      ],
    );
  }

  static IconData _iconForKind(MilestoneKind kind) => switch (kind) {
    .trip => AppIcons.map_pin,
    .home => AppIcons.home,
    .met || .dating || .engaged || .married || .first => AppIcons.heart_filled,
    .custom => AppIcons.sparkle,
  };
}

class const _TimelineItemRow({
  required final String title,
  required final String subtitle,
  required final IconData icon,
  required final bool isFirst,
  required final bool isLast,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: AppSpace.s24,
            child: CustomPaint(
              painter: _TimelineRailPainter(
                lineColor: colors.borderDefault,
                dotColor: colors.accentHighlight,
                ringColor: colors.bgSurface,
                isFirst: isFirst,
                isLast: isLast,
                isHollow: false,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.s10),
              child: AppPressable(
                onTap: onTap,
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.s16,
                    vertical: AppSpace.s14,
                  ),
                  decoration: BoxDecoration(
                    color: colors.bgSurface,
                    borderRadius: BorderRadius.circular(AppRadius.xxl),
                    border: AppBorders.hair(colors.borderDefault),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(title, style: text.titleXs.copyWith(color: colors.textPrimary)),
                            const SizedBox(height: AppSpace.s2),
                            Text(
                              subtitle,
                              style: text.caption.copyWith(color: colors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpace.s12),
                      Container(
                        width: AppSpace.s44,
                        height: AppSpace.s44,
                        decoration: BoxDecoration(
                          color: colors.accentSoft,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        alignment: Alignment.center,
                        child: AppIcon(icon: icon, size: AppIconSize.sm, color: colors.accentLabel),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class const _AddMilestoneRow({
  required final String label,
  required final bool isFirst,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: AppSpace.s24,
            child: CustomPaint(
              painter: _TimelineRailPainter(
                lineColor: colors.borderDefault,
                dotColor: colors.borderDefault,
                ringColor: colors.bgScreen,
                isFirst: isFirst,
                isLast: true,
                isHollow: true,
              ),
            ),
          ),
          Expanded(
            child: AppPressable(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              child: CustomPaint(
                foregroundPainter: _DashedMilestonePainter(
                  color: colors.borderDefault,
                  radius: AppRadius.xxl,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.s16,
                    vertical: AppSpace.s14,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: text.bodySm.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                      AppIcon(icon: AppIcons.plus, size: AppIconSize.sm, color: colors.iconMuted),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class const _TimelineRailPainter({
  required final Color lineColor,
  required final Color dotColor,
  required final Color ringColor,
  required final bool isFirst,
  required final bool isLast,
  required final bool isHollow,
}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dotY = 26.0;
    const centerX = 7.0;

    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final startY = isFirst ? dotY : 0.0;
    final endY = isLast ? dotY : size.height;

    var y = startY;
    while (y < endY) {
      final nextY = math.min(y + 3.0, endY);
      canvas.drawLine(Offset(centerX, y), Offset(centerX, nextY), linePaint);
      y += 6.0;
    }

    const center = Offset(centerX, dotY);
    if (isHollow) {
      canvas
        ..drawCircle(center, 5, Paint()..color = ringColor)
        ..drawCircle(
          center,
          5,
          Paint()
            ..color = dotColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5,
        );
    } else {
      canvas
        ..drawCircle(center, 7, Paint()..color = ringColor)
        ..drawCircle(center, 5, Paint()..color = dotColor);
    }
  }

  @override
  bool shouldRepaint(_TimelineRailPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor ||
      oldDelegate.dotColor != dotColor ||
      oldDelegate.isFirst != isFirst ||
      oldDelegate.isLast != isLast ||
      oldDelegate.isHollow != isHollow;
}

class const _DashedMilestonePainter({required final Color color, required final double radius})
    extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppBorder.dashed;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          (Offset.zero & size).deflate(AppBorder.dashed / 2),
          Radius.circular(radius),
        ),
      );
    final dash = AppBorder.dashPattern[0];
    final gap = AppBorder.dashPattern[1];

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = math.min(distance + dash, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedMilestonePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}
