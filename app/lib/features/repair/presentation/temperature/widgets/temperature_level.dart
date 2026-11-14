import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/cubit/temperature_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const TemperatureLevel({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.temperature;
    final selected = context.select((TemperatureCubit cubit) => cubit.state.level);
    final isLoading = context.select((TemperatureCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<TemperatureCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.levelTitle,
              highlight: l10n.levelHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.levelNote,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final level in Temperature.values)
                BaseChoiceChip(
                  label: l10n.levels.selectOrFallback(level.name),
                  isSelected: selected == level,
                  onTap: () => cubit.onLevelChosen(level),
                ),
            ],
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: l10n.continueAction,
            isEnabled: selected != null,
            isLoading: isLoading,
            onPressed: cubit.continueFromLevel,
          ),
          const SizedBox(height: AppSpace.s10),
          BaseButton(
            text: l10n.skip,
            variant: .secondary,
            onPressed: () => context.router.maybePop(),
          ),
        ],
      ),
    );
  }
}
