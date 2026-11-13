import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A read-only memory: its date, place and the story kept with it.
class const MemoryDetailSheet({required final Memory memory, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final place = memory.place?.trim();
    final body = memory.body?.trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.dateLine(
            day: memory.happenedOn.day,
            month: l10n.monthsShort[memory.happenedOn.month - 1],
            year: memory.happenedOn.year,
          ),
          style: context.text.label.copyWith(color: context.colors.textSecondary),
        ),
        if (place != null && place.isNotEmpty) ...[
          const SizedBox(height: AppSpace.s16),
          Text(l10n.detailPlace, style: context.text.label),
          const SizedBox(height: AppSpace.s4),
          Text(place, style: context.text.body),
        ],
        if (body != null && body.isNotEmpty) ...[
          const SizedBox(height: AppSpace.s16),
          Text(l10n.detailBody, style: context.text.label),
          const SizedBox(height: AppSpace.s4),
          Text(body, style: context.text.body),
        ],
      ],
    );
  }
}
