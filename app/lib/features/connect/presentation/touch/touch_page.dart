import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/cubit/touch_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Neutral touch cards to do or skip, which either person can switch off for both.
@RoutePage()
class const TouchPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<TouchCubit>()..load(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.connectTouch;
    final isEnabled = context.select((TouchCubit cubit) => cubit.state.isEnabled);
    final cards = context.select((TouchCubit cubit) => cubit.state.cards);
    final index = context.select((TouchCubit cubit) => cubit.state.index);
    final isToggling = context.select((TouchCubit cubit) => cubit.state.toggleAction.isLoading);
    final cubit = context.read<TouchCubit>();

    return BaseView(
      body: BlocListener<TouchCubit, TouchState>(
        listenWhen: (previous, current) => previous.toggleAction != current.toggleAction,
        listener: (context, state) {
          final action = state.toggleAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: SkeletonizerResourceWidget<bool>(
          isEnabled,
          fakeValue: true,
          successBuilder: (enabled) => BaseStackedContent(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
                const SizedBox(height: AppSpace.s8),
                Text(
                  l10n.text,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s20),
                BaseListTile(
                  title: l10n.switchTitle,
                  subtitle: l10n.switchText,
                  control: BaseSwitch(
                    value: enabled,
                    semanticLabel: l10n.switchTitle,
                    onChanged: isToggling ? (_) {} : (value) => cubit.setEnabled(enabled: value),
                  ),
                ),
                const SizedBox(height: AppSpace.s20),
                if (!enabled)
                  BaseEmptyState(title: l10n.offTitle, text: l10n.offText)
                else if (cards.isEmpty)
                  BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                else
                  BaseSurfaceCard(title: cards[index % cards.length].title),
              ],
            ),
            footer: enabled && cards.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: AppSpace.s8,
                    children: [
                      BaseButton(text: l10n.done, onPressed: cubit.next),
                      BaseButton(text: l10n.skip, variant: .secondary, onPressed: cubit.next),
                    ],
                  )
                : null,
          ),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
        ),
      ),
    );
  }
}
