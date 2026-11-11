import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/lock/plus_lock.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/program_detail/cubit/program_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/sensitive_tracks/widgets/sensitive_tracks_gate.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// One program: what it is, every lesson that exists, and where the person left off.
@RoutePage()
class const ProgramDetailPage({@PathParam('slug') required final String slug, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ProgramDetailCubit>()..load(slug),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final programResource = context.select((ProgramDetailCubit cubit) => cubit.state.program);
    final enrollment = context.select((ProgramDetailCubit cubit) => cubit.state.enrollment);
    final doneDays = context.select((ProgramDetailCubit cubit) => cubit.state.doneDays);
    final savedDays = context.select((ProgramDetailCubit cubit) => cubit.state.savedDays);
    final hasPlus = context.select((ProgramDetailCubit cubit) => cubit.state.hasPlus);
    final hasSensitiveConsent = context.select(
      (ProgramDetailCubit cubit) => cubit.state.hasSensitiveConsent,
    );
    final action = context.select((ProgramDetailCubit cubit) => cubit.state.action);
    final cubit = context.read<ProgramDetailCubit>();
    final program = switch (programResource) {
      Success(:final value) => value,
      _ => null,
    };
    final needsSensitiveConsent = program?.sensitive == true && !hasSensitiveConsent;

    return BaseView(
      appBar: BaseAppBar(title: program?.title ?? l10n.title),
      body: BlocListener<ProgramDetailCubit, ProgramDetailState>(
        listenWhen: (previous, current) =>
            previous.action != current.action && current.action is Failure,
        listener: (context, state) {
          final failure = state.action as Failure;

          BaseToast.show(
            context,
            l10n.lessonErrors.selectOrFallback(failure.exception.l10nKey),
            variant: BaseToastVariant.error,
          );
        },
        child: BaseStackedContent(
          body: SkeletonizerResourceWidget<Program>(
            programResource,
            fakeValue: Program.fake(),
            successBuilder: (program) => program.sensitive && !hasSensitiveConsent
                ? SensitiveTracksGate(
                    title: l10n.sensitiveGateTitle,
                    text: l10n.sensitiveGateText,
                    actionText: l10n.sensitiveGateAction,
                    onAction: () => _acceptSensitive(context, cubit),
                  )
                : _ProgramBody(
                    program: program,
                    doneDays: doneDays,
                    savedDays: savedDays,
                    hasPlus: hasPlus,
                    isCompleted: enrollment?.isCompleted ?? false,
                    onOpen: (lesson) => _openLesson(context, cubit, program, lesson),
                  ),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.errorTitle,
              text: l10n.errorText,
              actionText: context.l10n.common.retry,
              onAction: () => cubit.load(slug),
            ),
          ),
          footer:
              program == null ||
                  needsSensitiveConsent ||
                  program.lessons.isEmpty ||
                  (program.plusOnly && !hasPlus)
              ? null
              : _StartAction(
                  enrollment: enrollment,
                  isLoading: action.isLoading,
                  onStart: (restart) => _open(context, cubit, restart: restart),
                ),
        ),
      ),
    );
  }

  Future<void> _open(
    BuildContext context,
    ProgramDetailCubit cubit, {
    required bool restart,
  }) async {
    if (restart) {
      final l10n = context.l10n.programs;
      final confirmed = await BaseConfirmSheet.show(
        context: context,
        title: l10n.restartConfirmTitle,
        text: l10n.restartConfirmText,
        confirmText: l10n.restartConfirm,
      );
      if (!context.mounted || !confirmed) return;
    }
    final day = await cubit.start(restart: restart);
    if (!context.mounted || day == null) return;

    await context.pushRoute(LessonRoute(slug: slug, day: day));
    if (context.mounted) await cubit.load(slug);
  }

  Future<void> _acceptSensitive(BuildContext context, ProgramDetailCubit cubit) async {
    final l10n = context.l10n.programs;
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.sensitiveConsentTitle,
      text: l10n.sensitiveConsentText,
      confirmText: l10n.sensitiveConsentConfirm,
      cancelText: l10n.sensitiveConsentCancel,
    );
    if (!context.mounted || !confirmed) return;

    await cubit.acceptSensitiveTracksConsent();
  }

  Future<void> _openLesson(
    BuildContext context,
    ProgramDetailCubit cubit,
    Program program,
    Lesson lesson,
  ) async {
    if (!program.isLessonOpen(hasPlus: cubit.state.hasPlus, lesson: lesson)) {
      await context.pushRoute(const PlansRoute());

      return;
    }

    await context.pushRoute(LessonRoute(slug: program.slug, day: lesson.day));
    if (context.mounted) await cubit.load(slug);
  }
}

class const _ProgramBody({
  required final Program program,
  required final Set<int> doneDays,
  required final Set<int> savedDays,
  required final bool hasPlus,
  required final bool isCompleted,
  required final ValueChanged<Lesson> onOpen,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;

    if (program.lessons.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (program.body != null) ...[
            Text(program.body!, style: context.text.body),
            const SizedBox(height: AppSpace.s16),
          ],
          BaseEmptyState(title: l10n.lessonsComingTitle, text: l10n.lessonsComingText),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (program.body != null) ...[
          Text(program.body!, style: context.text.body),
          const SizedBox(height: AppSpace.s8),
        ],
        Text(
          l10n.lessonCount(count: program.lessonCount),
          style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
        ),
        if (isCompleted) ...[
          const SizedBox(height: AppSpace.s8),
          Align(
            alignment: Alignment.centerLeft,
            child: BaseTag(text: l10n.completed),
          ),
        ],
        const SizedBox(height: AppSpace.s20),
        if (program.plusOnly && !hasPlus) ...[
          PlusLock(title: program.title, text: l10n.lockedProgramText),
          const SizedBox(height: AppSpace.s16),
        ],
        Semantics(header: true, child: Text(l10n.lessonsTitle, style: context.text.titleSm)),
        const SizedBox(height: AppSpace.s12),
        if (!hasPlus && !program.plusOnly && program.lessonCount > 1) ...[
          BaseNote(text: l10n.dayOneHint, icon: AppIcons.info),
          const SizedBox(height: AppSpace.s12),
        ],
        BaseListGroup(
          children: [
            for (final lesson in program.lessons)
              BaseListTile(
                title: lesson.title,
                subtitle: l10n.dayLabel(day: lesson.day),
                icon: doneDays.contains(lesson.day)
                    ? AppIcons.check
                    : savedDays.contains(lesson.day)
                    ? AppIcons.bookmark
                    : AppIcons.book,
                showsChevron: program.isLessonOpen(hasPlus: hasPlus, lesson: lesson),
                trailing: program.isLessonOpen(hasPlus: hasPlus, lesson: lesson)
                    ? null
                    : BasePlusBadge(text: l10n.plus),
                onTap: () => onOpen(lesson),
              ),
          ],
        ),
      ],
    );
  }
}

class const _StartAction({
  required final ProgramEnrollment? enrollment,
  required final bool isLoading,
  required final ValueChanged<bool> onStart,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final isCompleted = enrollment?.isCompleted ?? false;
    final text = isCompleted
        ? l10n.restart
        : enrollment == null
        ? l10n.start
        : l10n.kContinue;

    if (isCompleted) {
      return BaseButton.secondary(
        text: text,
        isFullWidth: true,
        isLoading: isLoading,
        onPressed: () => onStart(true),
      );
    }

    return BaseButton(text: text, isLoading: isLoading, onPressed: () => onStart(false));
  }
}
