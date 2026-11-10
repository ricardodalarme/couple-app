import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/quick_repair/cubit/quick_repair_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const QuickRepairPage({@QueryParam('text') final String text = '', super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<QuickRepairCubit>()..start(text),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSent = context.select((QuickRepairCubit cubit) => cubit.state.sendAction is Success);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<QuickRepairCubit, QuickRepairState>(
        listenWhen: (previous, current) => previous.sendAction != current.sendAction,
        listener: _onSendChanged,
        child: isSent ? const _Sent() : const _Form(),
      ),
    );
  }

  void _onSendChanged(BuildContext context, QuickRepairState state) {
    final action = state.sendAction;
    if (action is! Failure) return;

    BaseToast.show(
      context,
      context.l10n.repair.quick.errors.selectOrFallback(action.exception.l10nKey),
    );
  }
}

class const _Form() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.quick;
    final text = context.select((QuickRepairCubit cubit) => cubit.state.text);
    final preset = context.select((QuickRepairCubit cubit) => cubit.state.preset);
    final canSend = context.select((QuickRepairCubit cubit) => cubit.state.canSend);
    final isLoading = context.select((QuickRepairCubit cubit) => cubit.state.sendAction.isLoading);
    final cubit = context.read<QuickRepairCubit>();

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
              for (final key in repairPresets)
                BaseChoiceChip(
                  label: l10n.presets.selectOrFallback(key),
                  isSelected: preset == key,
                  onTap: () => cubit.onPresetChosen(key, l10n.presets.selectOrFallback(key)),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s16),
          BaseTextArea(
            text: text,
            hint: l10n.hint,
            maxLength: repairMessageMaxLength,
            onChanged: cubit.onTextChanged,
          ),
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
    final l10n = context.l10n.repair.quick;

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
