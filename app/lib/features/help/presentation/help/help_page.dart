import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/help/data/models/help_faq.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_bloc_starter/features/help/presentation/help/cubit/help_hub_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The bundled FAQ and the ways to reach support.
@RoutePage()
class const HelpPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HelpHubCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.helpSupport;
    final pending = context.select((HelpHubCubit cubit) => cubit.state.pending);
    final discarded = context.select((HelpHubCubit cubit) => cubit.state.discarded);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseListGroup(
              children: [
                BaseListTile(
                  title: l10n.contactTitle,
                  icon: AppIcons.chat,
                  showsChevron: true,
                  onTap: () => _openSupport(context),
                ),
                BaseListTile(
                  title: l10n.reportBug,
                  icon: AppIcons.warning,
                  showsChevron: true,
                  onTap: () => _openSupport(context, topic: SupportTopic.bug),
                ),
              ],
            ),
            if (pending > 0) ...[
              const SizedBox(height: AppSpace.s12),
              BaseNote(text: l10n.pendingNote, icon: AppIcons.cloud),
            ],
            if (discarded > 0) ...[
              const SizedBox(height: AppSpace.s12),
              BaseNote(text: l10n.discardedNote, icon: AppIcons.warning),
            ],
            const SizedBox(height: AppSpace.s24),
            Text(l10n.faqTitle, style: context.text.titleMd),
            const SizedBox(height: AppSpace.s12),
            for (final key in helpFaqKeys) ...[
              BaseSurfaceCard(
                title: l10n.faqQuestions.selectOrFallback(key),
                supportText: l10n.faqAnswers.selectOrFallback(key),
              ),
              const SizedBox(height: AppSpace.s12),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _openSupport(BuildContext context, {SupportTopic? topic}) async {
    await context.pushRoute(topic == null ? SupportRoute() : SupportRoute(topic: topic));
    if (!context.mounted) return;
    await context.read<HelpHubCubit>().load();
  }
}
