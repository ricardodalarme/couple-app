import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/cubit/temperature_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const TemperatureIntensity({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.temperature;
    final intensity = context.select((TemperatureCubit cubit) => cubit.state.intensity);
    final isLoading = context.select((TemperatureCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<TemperatureCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.intensityTitle,
              highlight: l10n.intensityHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.intensityHint,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s24),
          BaseSlider(
            value: intensity.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            startLabel: l10n.intensityLow,
            endLabel: l10n.intensityTop,
            semanticLabel: l10n.intensityLabel,
            valueFormatter: (value) => value.round().toString(),
            onChanged: (value) => cubit.onIntensityChanged(value.round()),
          ),
          if (intensity >= highIntensity) ...[
            const SizedBox(height: AppSpace.s16),
            BaseNote(text: l10n.intensityHigh),
          ],
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(text: l10n.continueAction, isLoading: isLoading, onPressed: cubit.finish),
          const SizedBox(height: AppSpace.s10),
          BaseButton(text: l10n.back, variant: .secondary, onPressed: cubit.back),
        ],
      ),
    );
  }
}
