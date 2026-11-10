import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/unpair/cubit/unpair_done_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const UnpairDonePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<UnpairDoneCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.unpair;
    final done = l10n.done;
    final choice = context.select((UnpairDoneCubit cubit) => cubit.state.choice);
    final action = context.select((UnpairDoneCubit cubit) => cubit.state.resolveAction);
    final canContinue = context.select((UnpairDoneCubit cubit) => cubit.state.canContinue);
    final isResolving = action.isLoading;
    final cubit = context.read<UnpairDoneCubit>();

    return BaseView(
      appBar: null,
      body: BlocListener<UnpairDoneCubit, UnpairDoneState>(
        listenWhen: (previous, current) => previous.resolveAction != current.resolveAction,
        listener: (context, state) {
          if (state.resolveAction case Failure(:final exception)) {
            BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
          }
        },
        child: BaseMomentContent(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                header: true,
                liveRegion: true,
                child: AppHighlightedText(
                  text: done.title,
                  highlight: done.highlight,
                  style: context.text.display,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpace.s12),
              Text(
                done.text,
                textAlign: TextAlign.center,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s24),
              BaseOptionTile(
                title: done.keepOption,
                isSelected: choice == SharedItemsChoice.keep,
                isEnabled: !isResolving,
                onTap: () => cubit.chooseSharedItems(SharedItemsChoice.keep),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseOptionTile(
                title: done.deleteOption,
                isSelected: choice == SharedItemsChoice.delete,
                isEnabled: !isResolving,
                onTap: () => cubit.chooseSharedItems(SharedItemsChoice.delete),
              ),
              const SizedBox(height: AppSpace.s16),
              BaseNote(text: done.plusNote, icon: AppIcons.info),
            ],
          ),
          footer: BaseButton(
            text: done.continueLabel,
            isEnabled: canContinue,
            isLoading: isResolving,
            onPressed: canContinue
                ? () => context.router.root.popUntil((route) => route.isFirst)
                : null,
          ),
        ),
      ),
    );
  }
}
