import 'package:ui/ui.dart';

const double _fieldHeight = 54;
const double _fieldRadius = 18;
const double _fieldPadding = 18;
const double _fieldGap = 10;
const double _labelGap = 6;
const double _messageGap = 6;
const double _messageIconSize = 16;
const double _messageIconGap = 6;
const double _labelInset = 4;
const double _wheelGap = 8;
const double _wheelRowGap = 16;
const double _wheelConfirmGap = 20;
const double _wheelValueGap = 4;
const double _wheelValueMinHeight = 32;
const double _disabledOpacity = .4;

/// A read-only field that displays a date, a time, or both.
///
/// The field carries the same label and message rhythm as [BaseTextField].
/// Tapping opens a [BaseSheet.show] with a token-built stepper unless [onTap]
/// replaces the picker. The picker honours [minimum] and [maximum] and reports
/// the confirmed value through [onChanged]; [formatter] customises the visible
/// value for the caller's region.
class const BaseDateField({
  final DateTime? value,
  final String? label,
  final String? hint,
  final String? helpText,
  final String? errorText,
  final IconData? leadingIcon,
  final BaseDateFieldMode mode = BaseDateFieldMode.date,
  final DateTime? minimum,
  final DateTime? maximum,
  final String Function(DateTime value)? formatter,
  final ValueChanged<DateTime>? onChanged,
  final VoidCallback? onTap,
  final bool isEnabled = true,
  final String? semanticLabel,
  final String confirmLabel = 'Confirm',
  final String dayLabel = 'Day',
  final String monthLabel = 'Month',
  final String yearLabel = 'Year',
  final String hourLabel = 'Hour',
  final String minuteLabel = 'Minute',
  final String increaseLabel = 'Increase',
  final String decreaseLabel = 'Decrease',
  super.key,
}) extends StatelessWidget {
  String _format(DateTime date) {
    final custom = formatter;
    if (custom != null) return custom(date);

    final datePart =
        '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
    final timePart =
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';

    return switch (mode) {
      .date => datePart,
      .time => timePart,
      .dateTime => '$datePart $timePart',
    };
  }

  Future<void> _openPicker(BuildContext context) async {
    final picked = await BaseSheet.show<DateTime>(
      context: context,
      title: label,
      child: _DateStepper(
        initial: value ?? minimum ?? DateTime.now(),
        mode: mode,
        minimum: minimum,
        maximum: maximum,
        confirmLabel: confirmLabel,
        dayLabel: dayLabel,
        monthLabel: monthLabel,
        yearLabel: yearLabel,
        hourLabel: hourLabel,
        minuteLabel: minuteLabel,
        increaseLabel: increaseLabel,
        decreaseLabel: decreaseLabel,
      ),
    );

    if (picked != null) onChanged?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final hasError = errorText != null;
    final icon =
        leadingIcon ?? (mode == BaseDateFieldMode.time ? AppIcons.clock : AppIcons.calendar);
    final displayValue = value == null ? null : _format(value!);
    final message = errorText ?? helpText;
    final messageColor = hasError ? AppPalette.errorInk : colors.textSecondary;

    final field = Container(
      constraints: const BoxConstraints(minHeight: _fieldHeight),
      padding: const EdgeInsets.symmetric(horizontal: _fieldPadding),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(_fieldRadius),
        border: Border.all(
          color: hasError ? AppPalette.errorInk : colors.borderDefault,
          width: hasError ? AppBorder.selected : AppBorder.hair,
        ),
      ),
      child: Row(
        spacing: _fieldGap,
        children: [
          AppIcon(icon: icon, color: colors.textSecondary),
          Expanded(
            child: Text(
              displayValue ?? hint ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.body.copyWith(
                color: displayValue == null ? colors.textPlaceholder : colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );

    final fieldWithTap = !isEnabled
        ? Opacity(opacity: _disabledOpacity, child: field)
        : AppPressable(
            onTap: onTap ?? () => _openPicker(context),
            borderRadius: BorderRadius.circular(_fieldRadius),
            semanticLabel: semanticLabel ?? label,
            child: field,
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label case final label?)
          Padding(
            padding: const EdgeInsets.only(left: _labelInset, bottom: _labelGap),
            child: Text(
              label,
              style: text.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
            ),
          ),
        fieldWithTap,
        if (message != null)
          Padding(
            padding: const EdgeInsets.only(top: _messageGap, left: _labelInset, right: _labelInset),
            child: Semantics(
              liveRegion: hasError,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: _messageIconGap,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: AppIcon(
                      icon: hasError ? AppIcons.warning : AppIcons.info,
                      size: _messageIconSize,
                      color: messageColor,
                    ),
                  ),
                  Expanded(
                    child: Text(message, style: text.caption.copyWith(color: messageColor)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Whether a [BaseDateField] shows a date, a time, or both.
enum BaseDateFieldMode() {
  /// Calendar date only.
  date,

  /// Clock time only.
  time,

  /// Calendar date followed by clock time.
  dateTime,
}

class const _DateStepper({
  required final DateTime initial,
  required final BaseDateFieldMode mode,
  required final DateTime? minimum,
  required final DateTime? maximum,
  required final String confirmLabel,
  required final String dayLabel,
  required final String monthLabel,
  required final String yearLabel,
  required final String hourLabel,
  required final String minuteLabel,
  required final String increaseLabel,
  required final String decreaseLabel,
}) extends StatefulWidget {
  @override
  State<_DateStepper> createState() => _DateStepperState();
}

class _DateStepperState() extends State<_DateStepper> {
  late DateTime _current;

  @override
  void initState() {
    super.initState();
    _current = _clamp(widget.initial);
  }

  DateTime _clamp(DateTime date) {
    final minimum = widget.minimum;
    final maximum = widget.maximum;
    if (minimum != null && date.isBefore(minimum)) return minimum;
    if (maximum != null && date.isAfter(maximum)) return maximum;
    return date;
  }

  bool get _showsDate => widget.mode != BaseDateFieldMode.time;
  bool get _showsTime => widget.mode != BaseDateFieldMode.date;

  void _adjust(_DateUnit unit, int delta) {
    final next = switch (unit) {
      .day => DateTime(_current.year, _current.month, _current.day + delta),
      .month => _shiftMonth(delta),
      .year => _shiftYear(delta),
      .hour => DateTime(_current.year, _current.month, _current.day, _current.hour + delta),
      .minute => DateTime(
        _current.year,
        _current.month,
        _current.day,
        _current.hour,
        _current.minute + delta,
      ),
    };

    setState(() => _current = _clamp(next));
  }

  DateTime _shiftMonth(int delta) {
    final target = DateTime(_current.year, _current.month + delta);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    return DateTime(
      target.year,
      target.month,
      _current.day > lastDay ? lastDay : _current.day,
      _current.hour,
      _current.minute,
    );
  }

  DateTime _shiftYear(int delta) {
    final targetYear = _current.year + delta;
    final lastDay = DateTime(targetYear, _current.month + 1, 0).day;
    return DateTime(
      targetYear,
      _current.month,
      _current.day > lastDay ? lastDay : _current.day,
      _current.hour,
      _current.minute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_showsDate)
          Row(
            spacing: _wheelGap,
            children: [
              Expanded(
                child: _WheelColumn(
                  label: widget.dayLabel,
                  value: _current.day.toString().padLeft(2, '0'),
                  increaseLabel: '${widget.increaseLabel} ${widget.dayLabel}',
                  decreaseLabel: '${widget.decreaseLabel} ${widget.dayLabel}',
                  onIncrease: () => _adjust(_DateUnit.day, 1),
                  onDecrease: () => _adjust(_DateUnit.day, -1),
                ),
              ),
              Expanded(
                child: _WheelColumn(
                  label: widget.monthLabel,
                  value: _current.month.toString().padLeft(2, '0'),
                  increaseLabel: '${widget.increaseLabel} ${widget.monthLabel}',
                  decreaseLabel: '${widget.decreaseLabel} ${widget.monthLabel}',
                  onIncrease: () => _adjust(_DateUnit.month, 1),
                  onDecrease: () => _adjust(_DateUnit.month, -1),
                ),
              ),
              Expanded(
                child: _WheelColumn(
                  label: widget.yearLabel,
                  value: _current.year.toString(),
                  increaseLabel: '${widget.increaseLabel} ${widget.yearLabel}',
                  decreaseLabel: '${widget.decreaseLabel} ${widget.yearLabel}',
                  onIncrease: () => _adjust(_DateUnit.year, 1),
                  onDecrease: () => _adjust(_DateUnit.year, -1),
                ),
              ),
            ],
          ),
        if (_showsDate && _showsTime) const SizedBox(height: _wheelRowGap),
        if (_showsTime)
          Row(
            spacing: _wheelGap,
            children: [
              Expanded(
                child: _WheelColumn(
                  label: widget.hourLabel,
                  value: _current.hour.toString().padLeft(2, '0'),
                  increaseLabel: '${widget.increaseLabel} ${widget.hourLabel}',
                  decreaseLabel: '${widget.decreaseLabel} ${widget.hourLabel}',
                  onIncrease: () => _adjust(_DateUnit.hour, 1),
                  onDecrease: () => _adjust(_DateUnit.hour, -1),
                ),
              ),
              Expanded(
                child: _WheelColumn(
                  label: widget.minuteLabel,
                  value: _current.minute.toString().padLeft(2, '0'),
                  increaseLabel: '${widget.increaseLabel} ${widget.minuteLabel}',
                  decreaseLabel: '${widget.decreaseLabel} ${widget.minuteLabel}',
                  onIncrease: () => _adjust(_DateUnit.minute, 1),
                  onDecrease: () => _adjust(_DateUnit.minute, -1),
                ),
              ),
            ],
          ),
        const SizedBox(height: _wheelConfirmGap),
        BaseButton.primary(
          text: widget.confirmLabel,
          onPressed: () => Navigator.of(context).pop(_current),
        ),
      ],
    );
  }
}

class const _WheelColumn({
  required final String label,
  required final String value,
  required final String increaseLabel,
  required final String decreaseLabel,
  required final VoidCallback onIncrease,
  required final VoidCallback onDecrease,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppPressable(
          onTap: onIncrease,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          semanticLabel: increaseLabel,
          enforceMinTapTarget: true,
          child: Container(
            width: AppIconSize.touch,
            height: AppIconSize.touch,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.bgSurface,
              shape: BoxShape.circle,
              border: Border.all(color: colors.borderDefault),
            ),
            child: AppIcon(icon: AppIcons.chevron_up, color: colors.iconDefault),
          ),
        ),
        const SizedBox(height: _wheelValueGap),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _wheelValueMinHeight),
          child: Center(
            child: Text(
              value,
              maxLines: 1,
              style: context.text.titleSm.copyWith(color: colors.textPrimary),
            ),
          ),
        ),
        const SizedBox(height: _wheelValueGap),
        AppPressable(
          onTap: onDecrease,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          semanticLabel: decreaseLabel,
          enforceMinTapTarget: true,
          child: Container(
            width: AppIconSize.touch,
            height: AppIconSize.touch,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.bgSurface,
              shape: BoxShape.circle,
              border: Border.all(color: colors.borderDefault),
            ),
            child: AppIcon(icon: AppIcons.chevron_down, color: colors.iconDefault),
          ),
        ),
        const SizedBox(height: _wheelValueGap),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.micro.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}

enum _DateUnit() {
  day,
  month,
  year,
  hour,
  minute,
}
