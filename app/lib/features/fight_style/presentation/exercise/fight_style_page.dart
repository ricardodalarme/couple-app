import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/cubit/fight_style_cubit.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/widgets/fight_style_question_view.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/widgets/fight_style_result_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A private reflection on how the person reacts in a fight.
@RoutePage()
class const FightStylePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<FightStyleCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.fightStyle;
    final result = context.select((FightStyleCubit cubit) => cubit.state.result);
    final isAnswering = context.select((FightStyleCubit cubit) => cubit.state.isAnswering);
    final cubit = context.read<FightStyleCubit>();
    final saved = switch (result) {
      Success(:final value) => value,
      _ => null,
    };

    return BlocListener<FightStyleCubit, FightStyleState>(
      listenWhen: (previous, current) =>
          previous.saveAction != current.saveAction || previous.addAction != current.addAction,
      listener: (context, state) {
        final save = state.saveAction;
        if (save is Failure) {
          BaseToast.show(context, l10n.errors.selectOrFallback(save.exception.l10nKey));
        }
        final add = state.addAction;
        if (add is Failure) {
          BaseToast.show(context, l10n.addErrors.selectOrFallback(add.exception.l10nKey));
        } else if (add is Success) {
          BaseToast.show(context, l10n.addedToast);
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
                ? const FightStyleQuestionView()
                : const FightStyleResultView(),
        },
      ),
    );
  }
}
