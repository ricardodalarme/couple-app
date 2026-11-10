import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/widgets/checkin_intro.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/widgets/checkin_question_view.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/widgets/checkin_reveal_view.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/widgets/checkin_waiting_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const CheckinPage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CheckinCubit>()..load(),
      child: this,
    );
  }

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState() extends State<CheckinPage> with WidgetsBindingObserver {
  bool _isDiscarding = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final cubit = context.read<CheckinCubit>();
    if (cubit.state.step == CheckinStep.waiting) cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;
    final week = context.select((CheckinCubit cubit) => cubit.state.week);
    final hasUnsavedDraft = context.select((CheckinCubit cubit) {
      final current = cubit.state;
      if (current.step != CheckinStep.questions) return false;
      final text = current.draft.trim();
      if (text.isEmpty) return false;
      final saved = current.current?.answerFor(current.questionNumber)?.body.trim() ?? '';

      return text != saved;
    });
    final cubit = context.read<CheckinCubit>();

    return PopScope(
      canPop: _isDiscarding || !hasUnsavedDraft,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmDiscard();
      },
      child: BaseView(
        body: BlocListener<CheckinCubit, CheckinState>(
          listenWhen: (previous, current) => previous.saveAction != current.saveAction,
          listener: _onSaveChanged,
          child: SkeletonizerResourceWidget<CheckinWeek>(
            week,
            fakeValue: CheckinWeek.fake(),
            successBuilder: (week) => _CheckinBody(week: week),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.loadErrorTitle,
              text: l10n.loadErrorText,
              actionText: context.l10n.common.retry,
              onAction: cubit.load,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDiscard() async {
    if (_isDiscarding) return;
    final l10n = context.l10n.checkin;
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.discardTitle,
      text: l10n.discardText,
      confirmText: l10n.discard,
      cancelText: l10n.keepWriting,
      isDestructive: true,
    );
    if (!confirmed || !mounted) return;

    setState(() => _isDiscarding = true);
    Navigator.of(context).pop();
  }

  void _onSaveChanged(BuildContext context, CheckinState state) {
    final action = state.saveAction;
    if (action is Failure) {
      BaseToast.show(
        context,
        context.l10n.checkin.errors.selectOrFallback(action.exception.l10nKey),
        variant: BaseToastVariant.error,
      );
    }
  }
}

class const _CheckinBody({required final CheckinWeek week}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final step = context.select((CheckinCubit cubit) => cubit.state.step);

    if (!week.canParticipate) return const _SoloState();

    return switch (step) {
      CheckinStep.intro => const CheckinIntro(),
      CheckinStep.questions => const CheckinQuestionView(),
      CheckinStep.waiting => const CheckinWaitingView(),
      CheckinStep.reveal => const CheckinRevealView(),
    };
  }
}

class const _SoloState() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;

    return BaseStackedContent(
      body: Padding(
        padding: const EdgeInsets.only(top: AppSpace.s34),
        child: BaseEmptyState(
          face: FaceKind.thinking,
          title: l10n.soloTitle,
          text: l10n.soloText,
          actionText: l10n.close,
          onAction: () => context.router.maybePop(),
        ),
      ),
    );
  }
}
