import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The shared home: what to do together, and a view with only the person's own things.
@RoutePage()
class const TogetherPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<TogetherCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.tabs;
    final view = context.select((TogetherCubit cubit) => cubit.state.view);
    final hasPartner = context.select((TogetherCubit cubit) => cubit.state.hasPartner);
    final cubit = context.read<TogetherCubit>();

    return BaseView(
      appBar: null,
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(header: true, child: Text(l10n.together, style: context.text.titleXl)),
            const SizedBox(height: AppSpace.s16),
            BaseSegmented(
              segments: [l10n.segmentTogether, l10n.segmentForMe],
              selectedIndex: view.index,
              onSelectionChanged: (index) => cubit.onViewChanged(TogetherView.values[index]),
            ),
            const SizedBox(height: AppSpace.s16),
            if (view == TogetherView.together) ...[
              if (!hasPartner) ...[
                BaseNote(text: l10n.soloNote),
                const SizedBox(height: AppSpace.s12),
              ],
              BaseListCard(
                categoryLabel: l10n.logisticsLabel,
                title: l10n.logisticsTitle,
                supportText: l10n.logisticsText,
                onTap: () => context.pushRoute(const LogisticsRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.ritualsLabel,
                title: l10n.ritualsTitle,
                supportText: l10n.ritualsText,
                onTap: () => context.pushRoute(const RitualsRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.datesLabel,
                title: l10n.datesTitle,
                supportText: l10n.datesText,
                onTap: () => context.pushRoute(const DatesRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.dateNightLabel,
                title: l10n.dateNightTitle,
                supportText: l10n.dateNightText,
                onTap: () => context.pushRoute(const DateNightRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.badDayLabel,
                title: l10n.badDayTitle,
                supportText: l10n.badDayText,
                onTap: () => context.pushRoute(const BadDayRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.starterLabel,
                title: l10n.starterTitle,
                supportText: l10n.starterText,
                onTap: () => context.pushRoute(const StarterRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.dayLabel,
                title: l10n.dayTitle,
                supportText: l10n.dayText,
                onTap: () => context.pushRoute(const DayRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.temperatureLabel,
                title: l10n.temperatureTitle,
                supportText: l10n.temperatureText,
                onTap: () => context.pushRoute(const TemperatureRoute()),
              ),
            ] else ...[
              BaseListCard(
                categoryLabel: l10n.partnerLabel,
                title: l10n.partnerTitle,
                supportText: l10n.partnerText,
                onTap: () => context.pushRoute(const PartnerProfileRoute()),
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListCard(
                categoryLabel: l10n.learningLabel,
                title: l10n.learningTitle,
                supportText: l10n.learningText,
                onTap: () => context.pushRoute(LearningRoute()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
