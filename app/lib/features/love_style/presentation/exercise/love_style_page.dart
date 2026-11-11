import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/cubit/love_style_cubit.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/widgets/love_style_question_view.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/widgets/love_style_result_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A private reflection on what makes the person feel loved.
@RoutePage()
class const LoveStylePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<LoveStyleCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.loveStyle;
    final result = context.select((LoveStyleCubit cubit) => cubit.state.result);
    final isAnswering = context.select((LoveStyleCubit cubit) => cubit.state.isAnswering);
    final cubit = context.read<LoveStyleCubit>();
    final saved = switch (result) {
      Success(:final value) => value,
      _ => null,
    };

    return BlocListener<LoveStyleCubit, LoveStyleState>(
      listenWhen: (previous, current) =>
          previous.saveAction != current.saveAction ||
          previous.manualAction != current.manualAction ||
          previous.shareAction != current.shareAction ||
          previous.revokeAction != current.revokeAction,
      listener: (context, state) {
        final save = state.saveAction;
        if (save is Failure) {
          BaseToast.show(context, l10n.errors.selectOrFallback(save.exception.l10nKey));
        }
        switch (state.manualAction) {
          case Failure(:final exception):
            BaseToast.show(context, l10n.manualErrors.selectOrFallback(exception.l10nKey));
          case Success():
            BaseToast.show(context, l10n.manualToast);
          default:
        }
        switch (state.shareAction) {
          case Failure(:final exception):
            BaseToast.show(context, l10n.shareErrors.selectOrFallback(exception.l10nKey));
          case Success():
            BaseToast.show(context, l10n.shareToast);
          default:
        }
        switch (state.revokeAction) {
          case Failure(:final exception):
            BaseToast.show(context, l10n.revokeErrors.selectOrFallback(exception.l10nKey));
          case Success():
            BaseToast.show(context, l10n.revokeToast);
          default:
        }
      },
      child: BaseView(
        appBar: BaseAppBar(
          onClose: () => context.router.maybePop(),
          trailing: saved != null && !isAnswering
              ? BaseTextLink(text: l10n.retake, onPressed: cubit.retake)
              : null,
        ),
        body: switch (result) {
          Loading() => const Center(child: BaseLoadingDots()),
          Failure() => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
          _ =>
            isAnswering || saved == null
                ? const LoveStyleQuestionView()
                : const LoveStyleResultView(),
        },
      ),
    );
  }
}
