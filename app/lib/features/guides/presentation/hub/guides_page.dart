import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/hub/cubit/guides_cubit.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/lock/plus_lock.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The six private conversation guides.
@RoutePage()
class const GuidesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<GuidesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.guides.hub;
    final guides = context.select((GuidesCubit cubit) => cubit.state.guides);
    final hasPlus = context.select((GuidesCubit cubit) => cubit.state.hasPlus);
    final cubit = context.read<GuidesCubit>();

    return BaseView(
      body: switch (guides) {
        Loading() || Initial() => const Center(child: BaseLoadingDots()),
        Failure() => BaseEmptyState(
          title: l10n.loadErrorTitle,
          text: l10n.loadErrorText,
          actionText: context.l10n.common.retry,
          onAction: cubit.load,
        ),
        Success(:final value) => BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                header: true,
                child: AppHighlightedText(
                  text: l10n.title,
                  highlight: l10n.titleHighlight,
                  style: context.text.display,
                ),
              ),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.subtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              for (final guide in value) ...[
                if (guide.isPlusOnly && !hasPlus)
                  PlusLock(title: guide.title, text: guide.description)
                else
                  _GuideCard(guide: guide),
                const SizedBox(height: AppSpace.s12),
              ],
              const SizedBox(height: AppSpace.s4),
              BaseNote(text: l10n.privateNote),
            ],
          ),
        ),
      },
    );
  }
}

class const _GuideCard({required final Guide guide}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.guides.hub;

    return BaseListCard(
      categoryLabel: l10n.stepCount(count: guide.stepCount),
      title: guide.title,
      supportText: guide.description,
      onTap: () => context.pushRoute(GuideRoute(slug: guide.slug)),
    );
  }
}
