import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/cubit/questions_cubit.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/widgets/questions_answer_view.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/widgets/questions_reveal_view.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/widgets/questions_waiting_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const QuestionsPage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<QuestionsCubit>()..load(),
      child: this,
    );
  }

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState() extends State<QuestionsPage> with WidgetsBindingObserver {
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
    final cubit = context.read<QuestionsCubit>();
    final current = cubit.state;
    if (current.view != QuestionsView.waiting || current.isEditing) return;
    final text = current.draft.value.trim();
    if (text.isNotEmpty && text != (current.current?.ownAnswer?.body.trim() ?? '')) return;
    cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.questions;
    final thread = context.select((QuestionsCubit cubit) => cubit.state.thread);
    final hasUnsavedDraft = context.select((QuestionsCubit cubit) {
      final current = cubit.state;
      if (!current.showsAnswerForm) return false;
      final text = current.draft.value.trim();
      if (text.isEmpty) return false;
      final saved = current.current?.ownAnswer?.body.trim() ?? '';

      return text != saved;
    });
    final cubit = context.read<QuestionsCubit>();

    return PopScope(
      canPop: _isDiscarding || !hasUnsavedDraft,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmDiscard();
      },
      child: BaseView(
        body: BlocListener<QuestionsCubit, QuestionsState>(
          listenWhen: (previous, current) => previous.saveAction != current.saveAction,
          listener: _onSaveChanged,
          child: SkeletonizerResourceWidget<QuestionThread>(
            thread,
            fakeValue: QuestionThread.fake(),
            successBuilder: (thread) => _QuestionsBody(thread: thread),
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
    final l10n = context.l10n.questions;
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

  void _onSaveChanged(BuildContext context, QuestionsState state) {
    final action = state.saveAction;
    if (action is Failure) {
      BaseToast.show(
        context,
        context.l10n.questions.errors.selectOrFallback(action.exception.l10nKey),
        variant: BaseToastVariant.error,
      );
    }
  }
}

class const _QuestionsBody({required final QuestionThread thread}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isEditing = context.select((QuestionsCubit cubit) => cubit.state.isEditing);

    if (isEditing || !thread.isAnswered) return QuestionsAnswerView(thread: thread);
    if (thread.isRevealed) return QuestionsRevealView(thread: thread);

    return QuestionsWaitingView(thread: thread);
  }
}
