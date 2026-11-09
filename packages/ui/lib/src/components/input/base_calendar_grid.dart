import 'dart:math' as math;

import 'package:ui/ui.dart';

const double _cellSize = 44;
const double _headerButtonSize = 40;
const double _weekdayMinHeight = 24;
const double _navGap = 8;
const double _titleGap = 8;
const double _milestoneSize = 5;
const double _milestoneInset = 4;
const double _blockedOpacity = .4;

const List<String> _monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const List<String> _sundayWeekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
const List<String> _mondayWeekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

/// A month grid with a header, weekday labels and 44pt day cells.
///
/// Renders one month at a time. The visible month starts at [month] and later
/// follows the header arrows, reporting each change through [onMonthChanged].
/// Single and range selection are controlled by [selectedDate] or by
/// [rangeStart] and [rangeEnd]; [blockedDays] are dimmed and not selectable.
class const BaseCalendarGrid({
  required final DateTime month,
  final DateTime? selectedDate,
  final DateTime? rangeStart,
  final DateTime? rangeEnd,
  final DateTime? today,
  final Set<DateTime> milestones = const {},
  final Set<DateTime> blockedDays = const {},
  final BaseCalendarWeekStart weekStart = BaseCalendarWeekStart.sunday,
  final BaseCalendarSelectionMode selectionMode = BaseCalendarSelectionMode.single,
  final ValueChanged<DateTime>? onDaySelected,
  final void Function(DateTime start, DateTime? end)? onRangeChanged,
  final ValueChanged<DateTime>? onMonthChanged,
  final String Function(DateTime month)? monthLabelBuilder,
  final List<String>? weekdayLabels,
  final String Function(DateTime day)? daySemanticLabel,
  final String previousMonthLabel = 'Previous month',
  final String nextMonthLabel = 'Next month',
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseCalendarGrid> createState() => _BaseCalendarGridState();
}

class _BaseCalendarGridState() extends State<BaseCalendarGrid> {
  late DateTime _visibleMonth;

  @override
  void initState() {
    super.initState();
    _visibleMonth = DateTime(widget.month.year, widget.month.month);
  }

  @override
  void didUpdateWidget(BaseCalendarGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.month.year != widget.month.year || oldWidget.month.month != widget.month.month) {
      _visibleMonth = DateTime(widget.month.year, widget.month.month);
    }
  }

  int get _firstWeekdayOffset {
    final first = DateTime(_visibleMonth.year, _visibleMonth.month);
    return widget.weekStart == BaseCalendarWeekStart.sunday
        ? first.weekday % 7
        : (first.weekday - 1) % 7;
  }

  String get _monthLabel =>
      widget.monthLabelBuilder?.call(_visibleMonth) ??
      '${_monthNames[_visibleMonth.month - 1]} ${_visibleMonth.year}';

  List<String> get _weekdays {
    final labels = widget.weekdayLabels;
    final fallback = widget.weekStart == BaseCalendarWeekStart.sunday
        ? _sundayWeekdays
        : _mondayWeekdays;
    return labels != null && labels.length == 7 ? labels : fallback;
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _containsDay(Set<DateTime> days, DateTime date) => days.any((day) => _isSameDay(day, date));

  void _changeMonth(int delta) {
    final next = DateTime(_visibleMonth.year, _visibleMonth.month + delta);
    setState(() => _visibleMonth = DateTime(next.year, next.month));
    widget.onMonthChanged?.call(_visibleMonth);
  }

  void _handleDayTap(DateTime date) {
    switch (widget.selectionMode) {
      case .single:
        widget.onDaySelected?.call(date);
      case .range:
        final start = widget.rangeStart;
        final end = widget.rangeEnd;
        if (start == null || end != null) {
          widget.onRangeChanged?.call(date, null);
        } else if (date.isBefore(start)) {
          widget.onRangeChanged?.call(date, start);
        } else {
          widget.onRangeChanged?.call(start, date);
        }
    }
  }

  DateTime _cellDate(DateTime gridStart, int offset) =>
      DateTime(gridStart.year, gridStart.month, gridStart.day + offset);

  String _semanticLabel(DateTime date, {required bool isToday, required bool isBlocked}) {
    final custom = widget.daySemanticLabel;
    if (custom != null) return custom(date);

    final parts = [
      '${date.day} ${_monthNames[date.month - 1]} ${date.year}',
      if (isToday) 'today',
      if (isBlocked) 'unavailable',
    ];
    return parts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final today = widget.today ?? DateTime.now();
    final first = DateTime(_visibleMonth.year, _visibleMonth.month);
    final daysInMonth = DateTime(first.year, first.month + 1, 0).day;
    final offset = _firstWeekdayOffset;
    final totalCells = ((offset + daysInMonth + 6) ~/ 7) * 7;
    final gridStart = DateTime(first.year, first.month, 1 - offset);
    final rows = totalCells ~/ 7;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          spacing: _navGap,
          children: [
            _MonthButton(
              icon: AppIcons.chevron_left,
              semanticLabel: widget.previousMonthLabel,
              onTap: () => _changeMonth(-1),
            ),
            Expanded(
              child: Text(
                _monthLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: text.titleXs,
              ),
            ),
            _MonthButton(
              icon: AppIcons.chevron_right,
              semanticLabel: widget.nextMonthLabel,
              onTap: () => _changeMonth(1),
            ),
          ],
        ),
        const SizedBox(height: _titleGap),
        Row(
          children: [
            for (final weekday in _weekdays)
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: _weekdayMinHeight),
                  child: Center(
                    child: Text(weekday, style: text.micro.copyWith(color: colors.textSecondary)),
                  ),
                ),
              ),
          ],
        ),
        for (var row = 0; row < rows; row++)
          Row(
            children: [
              for (var column = 0; column < 7; column++)
                Expanded(
                  child: SizedBox(
                    height: _cellSize,
                    child: Center(
                      child: _buildCell(
                        context,
                        _cellDate(gridStart, row * 7 + column),
                        today: today,
                        isCurrentMonth:
                            _cellDate(gridStart, row * 7 + column).month == first.month &&
                            _cellDate(gridStart, row * 7 + column).year == first.year,
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildCell(
    BuildContext context,
    DateTime date, {
    required DateTime today,
    required bool isCurrentMonth,
  }) {
    final colors = context.colors;
    final text = context.text;

    if (!isCurrentMonth) {
      return ExcludeSemantics(
        child: Text(
          '${date.day}',
          style: text.bodySm.copyWith(fontWeight: FontWeight.w500, color: AppPalette.neutral300),
        ),
      );
    }

    final isToday = _isSameDay(date, today);
    final isBlocked = _containsDay(widget.blockedDays, date);
    final isSelected = switch (widget.selectionMode) {
      .single => widget.selectedDate != null && _isSameDay(date, widget.selectedDate!),
      .range =>
        (widget.rangeStart != null && _isSameDay(date, widget.rangeStart!)) ||
            (widget.rangeEnd != null && _isSameDay(date, widget.rangeEnd!)),
    };
    final inRange = switch (widget.selectionMode) {
      .single => false,
      .range =>
        widget.rangeStart != null &&
            widget.rangeEnd != null &&
            date.isAfter(widget.rangeStart!) &&
            date.isBefore(widget.rangeEnd!),
    };
    final hasMilestone = _containsDay(widget.milestones, date);

    final decoration = isSelected
        ? BoxDecoration(color: colors.actionPrimary, shape: BoxShape.circle)
        : inRange
        ? BoxDecoration(color: colors.accentSoft, shape: BoxShape.circle)
        : null;
    final dayColor = isSelected
        ? colors.textOnAction
        : inRange
        ? colors.accentOnSoft
        : colors.textPrimary;

    final cell = SizedBox(
      width: _cellSize,
      height: _cellSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isToday && !isSelected)
            Positioned.fill(
              child: CustomPaint(painter: _DashedCirclePainter(color: colors.accentHighlight)),
            ),
          Center(
            child: Container(
              width: _cellSize,
              height: _cellSize,
              alignment: Alignment.center,
              decoration: decoration,
              child: Text(
                '${date.day}',
                maxLines: 1,
                style: text.bodySm.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isBlocked ? colors.textSecondary : dayColor,
                ),
              ),
            ),
          ),
          if (hasMilestone)
            Positioned(
              left: 0,
              right: 0,
              bottom: _milestoneInset,
              child: Center(
                child: Container(
                  width: _milestoneSize,
                  height: _milestoneSize,
                  decoration: BoxDecoration(color: colors.accentHighlight, shape: BoxShape.circle),
                ),
              ),
            ),
        ],
      ),
    );

    final label = _semanticLabel(date, isToday: isToday, isBlocked: isBlocked);

    if (isBlocked) {
      return Semantics(
        label: label,
        button: true,
        enabled: false,
        child: ExcludeSemantics(
          child: Opacity(opacity: _blockedOpacity, child: cell),
        ),
      );
    }

    return AppPressable(
      onTap: () => _handleDayTap(date),
      borderRadius: BorderRadius.circular(_cellSize / 2),
      semanticLabel: label,
      isSelected: isSelected,
      child: ExcludeSemantics(child: cell),
    );
  }
}

class const _MonthButton({
  required final IconData icon,
  required final String semanticLabel,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      semanticLabel: semanticLabel,
      enforceMinTapTarget: true,
      child: Container(
        width: _headerButtonSize,
        height: _headerButtonSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.bgSurface,
          shape: BoxShape.circle,
          border: Border.all(color: colors.borderDefault),
        ),
        child: AppIcon(icon: icon, color: colors.iconDefault),
      ),
    );
  }
}

class _DashedCirclePainter({required final Color color}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(1, 1, size.width - 2, size.height - 2);
    final path = Path()..addOval(rect);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppBorder.dashed;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      const pattern = AppBorder.dashPattern;
      while (distance < metric.length) {
        final dash = math.min(pattern.first, metric.length - distance);
        canvas.drawPath(metric.extractPath(distance, distance + dash), paint);
        distance += pattern.first + pattern.last;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedCirclePainter oldDelegate) => oldDelegate.color != color;
}

/// The day a calendar week starts on.
enum BaseCalendarWeekStart() {
  /// Sunday first.
  sunday,

  /// Monday first.
  monday,
}

/// Whether [BaseCalendarGrid] selects one day or a range.
enum BaseCalendarSelectionMode() {
  /// One day at a time.
  single,

  /// Two taps define the start and the end.
  range,
}
