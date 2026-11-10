import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/pause_return.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/pause/cubit/pause_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const PausePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<PauseCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final isSent = context.select((PauseCubit cubit) => cubit.state.sendAction is Success);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<PauseCubit, PauseState>(
        listenWhen: (previous, current) => previous.sendAction != current.sendAction,
        listener: (context, state) {
          final action = state.sendAction;
          if (action is Failure) {
            BaseToast.show(
              context,
              context.l10n.pause.errors.selectOrFallback(action.exception.l10nKey),
            );
          }
        },
        child: isSent ? const _Sent() : const _Form(),
      ),
    );
  }
}

class const _Form() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.pause;
    final message = context.select((PauseCubit cubit) => cubit.state.message);
    final preset = context.select((PauseCubit cubit) => cubit.state.preset);
    final returnChoice = context.select((PauseCubit cubit) => cubit.state.returnChoice);
    final canSend = context.select((PauseCubit cubit) => cubit.state.canSend);
    final isLoading = context.select((PauseCubit cubit) => cubit.state.sendAction.isLoading);
    final cubit = context.read<PauseCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.title,
              highlight: l10n.titleHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.subtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final key in pausePresets)
                BaseChoiceChip(
                  label: l10n.presets.selectOrFallback(key),
                  isSelected: preset == key,
                  onTap: () => cubit.onPresetChosen(key, l10n.presets.selectOrFallback(key)),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s12),
          BaseTextArea(
            text: message,
            hint: l10n.hint,
            maxLength: pauseMessageMaxLength,
            onChanged: cubit.onMessageChanged,
          ),
          const SizedBox(height: AppSpace.s20),
          Text(l10n.returnTitle, style: context.text.label),
          const SizedBox(height: AppSpace.s8),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final option in PauseReturn.values)
                BaseChoiceChip(
                  label: l10n.returns.selectOrFallback(option.name),
                  isSelected: returnChoice == option,
                  onTap: () => cubit.onReturnChosen(option),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.note),
        ],
      ),
      footer: BaseButton(
        text: l10n.send,
        isEnabled: canSend,
        isLoading: isLoading,
        onPressed: cubit.send,
      ),
    );
  }
}

class const _Sent() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.pause;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(l10n.sentTitle, style: context.text.titleXl, textAlign: TextAlign.center),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.sentText,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton(text: l10n.done, onPressed: () => context.router.maybePop()),
    );
  }
}
