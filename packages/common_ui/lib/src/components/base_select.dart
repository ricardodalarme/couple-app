import 'dart:async';

import 'package:common_ui/src/components/base_list_tile.dart';
import 'package:common_ui/src/components/base_tapper.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/tokens/borders.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:material_ui/material_ui.dart' show Icons, showModalBottomSheet;

/// A single option in a [BaseSelect].
class const BaseSelectOption<T>({
  required final T value,
  required final String label,
  final String? subtitle,
});

/// A labelled field that opens a sheet to pick a single option.
class const BaseSelect<T>({
  required final String label,
  required final List<BaseSelectOption<T>> options,
  required final T? value,
  required final ValueChanged<T> onChanged,
  final String? placeholder,
  final String? hintText,
  final String? errorText,
  final String? sheetTitle,
  super.key,
}) extends StatelessWidget {
  static const double _chevronSize = 20;

  BaseSelectOption<T>? get _selected {
    for (final option in options) {
      if (option.value == value) return option;
    }
    return null;
  }

  Future<void> _handleTap(BuildContext context) async {
    final picked = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (sheetTitle != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacings.large,
                    vertical: Spacings.small,
                  ),
                  child: Text(
                    sheetTitle!,
                    style: sheetContext.typography.titleMedium.copyWith(
                      color: sheetContext.palette.onBackground,
                    ),
                  ),
                ),
              for (final option in options)
                BaseListTile(
                  title: option.label,
                  subtitle: option.subtitle,
                  trailing: option.value == value ? const Icon(Icons.check) : null,
                  onTap: () => Navigator.of(sheetContext).pop(option.value),
                ),
            ],
          ),
        ),
      ),
    );

    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final typography = context.typography;
    final selected = _selected;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: typography.labelMedium.copyWith(color: palette.onBackground)),
        const Gap(Spacings.xsmall),
        Semantics(
          label: label,
          value: selected?.label,
          button: true,
          onTap: () => unawaited(_handleTap(context)),
          excludeSemantics: true,
          child: _FieldTrigger(
            selected: selected,
            placeholder: placeholder,
            onTap: () => unawaited(_handleTap(context)),
          ),
        ),
        if (errorText != null) ...[
          const Gap(Spacings.xsmall),
          Text(errorText!, style: typography.bodySmall.copyWith(color: palette.error)),
        ] else if (hintText != null) ...[
          const Gap(Spacings.xsmall),
          Text(
            hintText!,
            style: typography.bodySmall.copyWith(
              color: palette.onBackground.withValues(alpha: 0.7),
            ),
          ),
        ],
      ],
    );
  }
}

class const _FieldTrigger<T>({
  required final BaseSelectOption<T>? selected,
  required final VoidCallback onTap,
  final String? placeholder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final radius = BorderRadius.circular(Borders.small);

    return BaseTapper(
      onTap: onTap,
      borderRadius: radius,
      backgroundColor: palette.container,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(color: palette.onBackground.withValues(alpha: 0.25)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: Spacings.medium, vertical: Spacings.medium),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selected?.label ?? placeholder ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.typography.bodyMedium.copyWith(
                  color: selected == null
                      ? palette.onBackground.withValues(alpha: 0.6)
                      : palette.onBackground,
                ),
              ),
            ),
            const Gap(Spacings.small),
            IconTheme(
              data: IconThemeData(
                color: palette.onBackground.withValues(alpha: 0.6),
                size: BaseSelect._chevronSize,
              ),
              child: const Icon(Icons.expand_more),
            ),
          ],
        ),
      ),
    );
  }
}
