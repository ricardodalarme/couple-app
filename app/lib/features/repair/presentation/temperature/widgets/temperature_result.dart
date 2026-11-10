import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/cubit/temperature_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The calm outcome of the check; the highest temperatures show care first, never a composer.
class const TemperatureResult({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.temperature.result;
    final path = context.select((TemperatureCubit cubit) => cubit.state.path);
    final (title, text) = switch (path) {
      null => (l10n.good.title, l10n.good.text),
      RepairPath.pause => (l10n.pause.title, l10n.pause.text),
      RepairPath.guided => (l10n.guided.title, l10n.guided.text),
      RepairPath.quick => (l10n.quick.title, l10n.quick.text),
    };

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(title, style: context.text.titleXl, textAlign: TextAlign.center),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (path != null) ...[
            BaseButton(
              text: switch (path) {
                RepairPath.pause => context.l10n.repair.next.pause,
                RepairPath.guided => context.l10n.repair.next.guided,
                RepairPath.quick => context.l10n.repair.next.quick,
              },
              onPressed: () => context.router.replace(switch (path) {
                RepairPath.pause => const CalmRoute(),
                RepairPath.guided => const SoftStartRoute(),
                RepairPath.quick => QuickRepairRoute(),
              }),
            ),
            const SizedBox(height: AppSpace.s10),
          ],
          BaseButton(
            text: l10n.done,
            variant: path == null ? .primary : .secondary,
            onPressed: () => context.router.maybePop(),
          ),
        ],
      ),
    );
  }
}
