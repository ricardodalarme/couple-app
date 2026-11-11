import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/distance/data/models/distance_info.dart';
import 'package:flutter_bloc_starter/features/distance/presentation/distance/cubit/distance_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Both clocks of a long-distance couple and the days until they see each other.
@RoutePage()
class const DistancePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<DistanceCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.distance;
    final distance = context.select((DistanceCubit cubit) => cubit.state.distance);
    final cubit = context.read<DistanceCubit>();

    return BaseView(
      body: SkeletonizerResourceWidget<DistanceInfo>(
        distance,
        fakeValue: DistanceInfo.fake(),
        successBuilder: (info) => BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.text,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: l10n.you,
                    subtitle: info.own.city,
                    value: _time(info.own.time),
                  ),
                  if (info.partner case final partner?)
                    BaseListTile(
                      title: l10n.partner,
                      subtitle: partner.city,
                      value: _time(partner.time),
                    ),
                ],
              ),
              if (info.partner == null) ...[
                const SizedBox(height: AppSpace.s12),
                BaseNote(text: l10n.noPartner),
              ] else if (!info.hasDifferentZones) ...[
                const SizedBox(height: AppSpace.s12),
                BaseNote(text: l10n.sameZone),
              ],
              const SizedBox(height: AppSpace.s24),
              if (info.daysToReunion case final days?)
                BaseSurfaceCard(
                  title: switch (days) {
                    0 => l10n.reunionToday,
                    1 => l10n.reunionTomorrow,
                    _ => l10n.reunionDays(n: days),
                  },
                  supportText: info.reunionTitle,
                )
              else
                BaseEmptyState(
                  title: l10n.noReunionTitle,
                  text: l10n.noReunionText,
                  actionText: l10n.addReunion,
                  onAction: () => context.pushRoute(const DatesRoute()),
                ),
            ],
          ),
        ),
        failureBuilder: (_) => BaseEmptyState(
          title: l10n.errorTitle,
          text: l10n.errorText,
          actionText: context.l10n.common.retry,
          onAction: cubit.load,
        ),
      ),
    );
  }

  String _time(DateTime time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
