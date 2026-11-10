import 'package:design_system/design_system.dart';
import 'package:design_system/design_system_l10n.dart';

const int _searchThreshold = 8;

/// A single option in a [BaseSelect].
class const BaseSelectOption<T>({
  required final T value,
  required final String label,
  final String? subtitle,
});

/// A labelled field that opens a sheet to pick one option.
class const BaseSelect<T>({
  required final String label,
  required final List<BaseSelectOption<T>> options,
  required final T? value,
  required final ValueChanged<T> onChanged,
  final String? placeholder,
  final String? hintText,
  final String? errorText,
  final String? sheetTitle,
  final String? searchHint,
  final String? emptyLabel,
  final bool isEnabled = true,
  final bool isCompact = false,
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseSelect<T>> createState() => _BaseSelectState<T>();
}

class _BaseSelectState<T>() extends State<BaseSelect<T>> {
  bool _isOpen = false;

  BaseSelectOption<T>? get _selected {
    for (final option in widget.options) {
      if (option.value == widget.value) return option;
    }
    return null;
  }

  Future<void> _open() async {
    setState(() => _isOpen = true);

    final l10n = context.designSystemL10nOrBase.input;
    final picked = await BaseSheet.show<T>(
      context: context,
      title: widget.sheetTitle ?? widget.label,
      child: _SelectSheet<T>(
        options: widget.options,
        selected: widget.value,
        searchHint: widget.searchHint ?? l10n.search,
        emptyLabel: widget.emptyLabel ?? l10n.noOptions,
      ),
    );

    if (!mounted) return;
    setState(() => _isOpen = false);
    if (picked != null) widget.onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final selected = _selected;
    final hasError = widget.errorText != null;
    final isCompact = widget.isCompact;
    final valueStyle = isCompact
        ? context.text.bodySm.copyWith(
            fontWeight: FontWeight.w500,
            color: selected == null ? colors.textPlaceholder : colors.textPrimary,
          )
        : context.text.titleSm.copyWith(
            color: selected == null ? colors.textPlaceholder : colors.textPrimary,
          );

    final field = AnimatedContainer(
      duration: context.motionDuration(AppMotion.fast),
      curve: AppMotion.fastCurve,
      height: isCompact ? 40 : 54,
      padding: EdgeInsets.fromLTRB(
        isCompact ? AppSpace.s16 : AppSpace.s18,
        0,
        isCompact ? AppSpace.s12 : AppSpace.s16,
        0,
      ),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(isCompact ? AppRadius.pill : AppRadius.xl),
        border: Border.all(
          color: hasError
              ? AppPalette.errorInk
              : _isOpen
              ? colors.borderSelected
              : colors.borderDefault,
          width: hasError || _isOpen ? AppBorder.selected : AppBorder.hair,
        ),
      ),
      child: Row(
        spacing: AppSpace.s10,
        children: [
          Expanded(
            child: Text(
              selected?.label ?? widget.placeholder ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: valueStyle,
            ),
          ),
          AnimatedRotation(
            turns: _isOpen ? .5 : 0,
            duration: context.motionDuration(AppMotion.fast),
            curve: AppMotion.fastCurve,
            child: AppIcon(
              icon: AppIcons.chevron_down,
              size: isCompact ? AppIconSize.sm : AppIconSize.md,
              color: colors.iconMuted,
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpace.s4, bottom: AppSpace.s6),
          child: Text(
            widget.label,
            style: context.text.label.copyWith(color: colors.textSecondary),
          ),
        ),
        Semantics(
          label: widget.label,
          value: selected?.label,
          button: true,
          enabled: widget.isEnabled,
          child: ExcludeSemantics(
            child: AppPressable(
              onTap: widget.isEnabled ? _open : null,
              isEnabled: widget.isEnabled,
              borderRadius: BorderRadius.circular(isCompact ? AppRadius.pill : AppRadius.xl),
              child: field,
            ),
          ),
        ),
        if (widget.errorText case final error?)
          Padding(
            padding: const EdgeInsets.only(top: AppSpace.s6, left: AppSpace.s4),
            child: Text(error, style: context.text.caption.copyWith(color: AppPalette.errorInk)),
          )
        else if (widget.hintText case final hint?)
          Padding(
            padding: const EdgeInsets.only(top: AppSpace.s6, left: AppSpace.s4),
            child: Text(hint, style: context.text.caption.copyWith(color: colors.textSecondary)),
          ),
      ],
    );
  }
}

class const _SelectSheet<T>({
  required final List<BaseSelectOption<T>> options,
  required final T? selected,
  required final String searchHint,
  required final String emptyLabel,
}) extends StatefulWidget {
  @override
  State<_SelectSheet<T>> createState() => _SelectSheetState<T>();
}

class _SelectSheetState<T>() extends State<_SelectSheet<T>> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final normalized = _query.trim().toLowerCase();
    final options = normalized.isEmpty
        ? widget.options
        : widget.options.where((option) {
            final label = option.label.toLowerCase();
            final subtitle = option.subtitle?.toLowerCase() ?? '';
            return label.contains(normalized) || subtitle.contains(normalized);
          }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.options.length > _searchThreshold) ...[
          BaseTextField(
            text: _query,
            hint: widget.searchHint,
            leadingIcon: AppIcons.search,
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: AppSpace.s12),
        ],
        if (options.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpace.s20),
            child: Text(
              widget.emptyLabel,
              textAlign: TextAlign.center,
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
          )
        else
          for (var index = 0; index < options.length; index++)
            _SelectRow<T>(
              option: options[index],
              isSelected: options[index].value == widget.selected,
              showsDivider: index > 0,
              onTap: () => Navigator.of(context).pop(options[index].value),
            ),
      ],
    );
  }
}

class const _SelectRow<T>({
  required final BaseSelectOption<T> option,
  required final bool isSelected,
  required final bool showsDivider,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        constraints: const BoxConstraints(minHeight: 52),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.s6),
        decoration: BoxDecoration(
          border: showsDivider ? Border(top: BorderSide(color: colors.borderDefault)) : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.label,
                    style: context.text.body.copyWith(
                      color: isSelected ? colors.accentLabel : colors.textPrimary,
                    ),
                  ),
                  if (option.subtitle case final subtitle?)
                    Text(
                      subtitle,
                      style: context.text.caption.copyWith(color: colors.textSecondary),
                    ),
                ],
              ),
            ),
            if (isSelected) AppIcon(icon: AppIcons.check, color: colors.accentLabel),
          ],
        ),
      ),
    );
  }
}
