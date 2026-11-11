import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          BaseListGroup(
                            children: [
                              for (final program in list)
                                _ProgramTile(
                                  program: program,
                                  isLocked: program.plusOnly && !hasPlus,
                                ),
                            ],
                          ),
                          const SizedBox(height: AppSpace.s12),
                          BaseNote(text: l10n.freeNote, icon: AppIcons.info),
                        ],
                      ),
                failureBuilder: (_) => BaseEmptyState(
                  title: l10n.errorTitle,
                  text: l10n.errorText,
                  actionText: context.l10n.common.retry,
                  onAction: cubit.load,
                ),
              ),
              const SizedBox(height: AppSpace.s16),
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: l10n.diaryTitle,
                    icon: AppIcons.note,
                    showsChevron: true,
                    onTap: () => context.pushRoute(const DiaryRoute()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _ProgramTile({required final Program program, required final bool isLocked})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final lessonMeta = program.lessonCount == 0
        ? l10n.noLessons
        : l10n.lessonCount(count: program.lessonCount);
    final onTap = isLocked
        ? () => context.pushRoute(const PlansRoute())
        : () => context.pushRoute(ProgramDetailRoute(slug: program.slug));
    final trailing = program.sensitive || isLocked
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (program.sensitive)
                Text(
                  l10n.sensitive,
                  style: context.text.caption.copyWith(color: context.colors.textSecondary),
                ),
              if (program.sensitive && isLocked) const SizedBox(width: AppSpace.s8),
              if (isLocked) BaseTag(text: l10n.plus),
            ],
          )
        : null;

    return BaseListTile(
      title: program.title,
      subtitle: lessonMeta,
      icon: program.sensitive
          ? AppIcons.shield
          : isLocked
          ? AppIcons.lock
          : AppIcons.plant,
      showsChevron: !isLocked,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
