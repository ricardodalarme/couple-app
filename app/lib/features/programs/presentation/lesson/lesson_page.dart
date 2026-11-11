import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/cubit/lesson_cubit.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/sensitive_tracks/widgets/sensitive_tracks_gate.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// One lesson: a short read, a way to keep it for later, and a warm completion.
@RoutePage()
class const LessonPage({
  @PathParam('slug') required final String slug,
  @PathParam('day') required final int day,
  super.key,
}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<LessonCubit>()..load(slug: slug, day: day),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final programResource = context.select((LessonCubit cubit) => cubit.state.program);
    final program = context.select((LessonCubit cubit) => cubit.state.currentProgram);
    final lesson = context.select((LessonCubit cubit) => cubit.state.lesson);
    final status = context.select((LessonCubit cubit) => cubit.state.status);
    final isOpen = context.select((LessonCubit cubit) => cubit.state.isOpen);
    final hasSensitiveConsent = context.select(
      (LessonCubit cubit) => cubit.state.hasSensitiveConsent,
    );
    final action = context.select((LessonCubit cubit) => cubit.state.action);
    final cubit = context.read<LessonCubit>();

    return BaseView(
      appBar: BaseAppBar(title: program?.title ?? l10n.title),
      body: BlocListener<LessonCubit, LessonState>(
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
        child: SkeletonizerResourceWidget<Program>(
          programResource,
          fakeValue: Program.fake(),
          successBuilder: (program) => program.sensitive && !hasSensitiveConsent
              ? SensitiveTracksGate(
                  title: l10n.sensitiveLessonLockedTitle,
                  text: l10n.sensitiveLessonLockedText,
                  actionText: l10n.sensitiveGateAction,
                  onAction: () => _acceptSensitive(context, cubit),
                )
              : lesson == null
              ? program.lessons.isEmpty
                    ? BaseEmptyState(title: l10n.lessonsComingTitle, text: l10n.lessonsComingText)
                    : BaseEmptyState(title: l10n.lessonGoneTitle, text: l10n.lessonGoneText)
              : !isOpen
              ? BaseEmptyState(
                  title: l10n.lockedTitle,
                  text: l10n.lockedLessonText,
                  actionText: context.l10n.plus.seePlus,
                  onAction: () => context.pushRoute(const PlansRoute()),
                )
              : BaseStackedContent(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.dayLabel(day: lesson.day),
                        style: context.text.label.copyWith(color: context.colors.textSecondary),
                      ),
                      if (status == LessonStatus.saved) ...[
                        const SizedBox(height: AppSpace.s8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: BaseTag(text: l10n.savedTag),
                        ),
                      ],
                      const SizedBox(height: AppSpace.s8),
                      Text(lesson.title, style: context.text.titleXl),
                      const SizedBox(height: AppSpace.s8),
                      Text(
                        l10n.shortRead,
                        style: context.text.caption.copyWith(color: context.colors.textSecondary),
                      ),
                      if (lesson.body != null) ...[
                        const SizedBox(height: AppSpace.s20),
                        Text(lesson.body!, style: context.text.body),
                      ],
                    ],
                  ),
                  footer: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseButton(
                        text: l10n.ready,
                        isLoading: action.isLoading,
                        onPressed: () => _complete(context, cubit),
                      ),
                      if (status != LessonStatus.done) ...[
                        const SizedBox(height: AppSpace.s8),
                        BaseTextLink(
                          text: l10n.saveForLater,
                          onPressed: () => _saveForLater(context, cubit),
                        ),
                      ],
                    ],
                  ),
                ),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: () => cubit.load(slug: slug, day: day),
          ),
        ),
      ),
    );
  }

  Future<void> _acceptSensitive(BuildContext context, LessonCubit cubit) async {
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

  Future<void> _complete(BuildContext context, LessonCubit cubit) async {
    final outcome = await cubit.complete();
    if (!context.mounted) return;

    switch (outcome) {
      case LessonOutcome.completed:
        await context.pushRoute(
          ProgramCompleteRoute(title: cubit.state.currentProgram?.title ?? ''),
        );
      case LessonOutcome.advanced:
        await context.router.maybePop();
      case LessonOutcome.failed:
        return;
    }
  }

  Future<void> _saveForLater(BuildContext context, LessonCubit cubit) async {
    final saved = await cubit.saveForLater();
    if (!context.mounted || !saved) return;

    BaseToast.show(context, context.l10n.programs.saved);
    await context.router.maybePop();
  }
}
