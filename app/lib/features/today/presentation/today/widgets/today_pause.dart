import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/cubit/today_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The calm Hoje shown while a pause runs, with a way back and a way to still write a slip.
///
/// The partner's pause shows no reason and no time, only that there is space.
class const TodayPause({required final TodayHome home, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.today;
    final isLoading = context.select((TodayCubit cubit) => cubit.state.endPauseAction.isLoading);
    final isMine = home.pauseIsMine;
    final returnAt = home.pauseReturnAt?.toLocal();
    final time = returnAt == null
        ? ''
        : '${returnAt.hour.toString().padLeft(2, '0')}:${returnAt.minute.toString().padLeft(2, '0')}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.bgSurface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            boxShadow: AppShadows.ring,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpace.s20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
                const SizedBox(height: AppSpace.s16),
                Semantics(
                  header: true,
                  child: Text(
                    isMine ? l10n.pauseOwnTitle : l10n.pausePartnerTitle,
                    style: context.text.titleXl,
                  ),
                ),
                const SizedBox(height: AppSpace.s8),
                Text(
                  isMine ? l10n.pauseOwnText(time: time) : l10n.pausePartnerText,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                if (isMine) ...[
                  const SizedBox(height: AppSpace.s20),
                  BaseButton(
                    text: l10n.pauseBack,
                    isLoading: isLoading,
                    onPressed: context.read<TodayCubit>().endPause,
                  ),
                  const SizedBox(height: AppSpace.s10),
                  BaseButton(
                    text: l10n.pauseBackRepair,
                    variant: .secondary,
                    isEnabled: !isLoading,
                    onPressed: () async {
                      final didEnd = await context.read<TodayCubit>().endPause();
                      if (didEnd && context.mounted) {
                        await context.router.root.push(const TemperatureRoute());
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseButton(
          text: l10n.pauseWriteSlip,
          variant: .secondary,
          onPressed: () => context.router.root.push(const QuickSlipRoute()),
        ),
      ],
    );
  }
}
