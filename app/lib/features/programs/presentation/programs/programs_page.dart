import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/lock/plus_lock.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/programs/cubit/programs_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The guided programs that exist for the account language, plus the private diary.
@RoutePage()
class const ProgramsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ProgramsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final programs = context.select((ProgramsCubit cubit) => cubit.state.programs);
    final hasPlus = context.select((ProgramsCubit cubit) => cubit.state.hasPlus);
    final cubit = context.read<ProgramsCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseRefreshable(
        onRefresh: cubit.load,
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.hubSubtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              SkeletonizerResourceWidget<List<Program>>(
                programs,
                fakeValue: [Program.fake()],
                successBuilder: (list) => list.isEmpty
                    ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final program in list) ...[
                            _ProgramCard(program: program, isLocked: program.plusOnly && !hasPlus),
                            const SizedBox(height: AppSpace.s12),
                          ],
                        ],
                      ),
                failureBuilder: (_) => BaseEmptyState(
                  title: l10n.errorTitle,
                  text: l10n.errorText,
                  actionText: context.l10n.common.retry,
                  onAction: cubit.load,
                ),
              ),
              const SizedBox(height: AppSpace.s8),
              BaseListCard(
                categoryLabel: l10n.diaryLabel,
                title: l10n.diaryTitle,
                supportText: l10n.diaryText,
                onTap: () => context.pushRoute(const DiaryRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _ProgramCard({required final Program program, required final bool isLocked})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final body = program.body?.trim();
    final support = [
      if (body != null && body.isNotEmpty) body,
      if (program.lessonCount == 0)
        l10n.noLessons
      else
        l10n.lessonCount(count: program.lessonCount),
    ].join(' · ');

    if (isLocked) return PlusLock(title: program.title, text: support);

    return BaseListCard(
      categoryLabel: program.plusOnly ? l10n.plus : l10n.free,
      title: program.title,
      supportText: support,
      trailing: program.sensitive ? BaseTag(text: l10n.sensitive) : null,
      onTap: () => context.pushRoute(ProgramDetailRoute(slug: program.slug)),
    );
  }
}
