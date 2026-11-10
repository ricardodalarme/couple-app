import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/need/cubit/need_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const NeedPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<NeedCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final isSent = context.select((NeedCubit cubit) => cubit.state.sendAction is Success);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<NeedCubit, NeedState>(
        listenWhen: (previous, current) => previous.sendAction != current.sendAction,
        listener: _onStateChanged,
        child: isSent ? const _Sent() : const _NeedForm(),
      ),
    );
  }

  void _onStateChanged(BuildContext context, NeedState state) {
    final action = state.sendAction;
    if (action is! Failure) return;

    BaseToast.show(context, context.l10n.need.errors.selectOrFallback(action.exception.l10nKey));
  }
}

class const _NeedForm() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.need;
    final selected = context.select((NeedCubit cubit) => cubit.state.need);
    final isLoading = context.select((NeedCubit cubit) => cubit.state.sendAction.isLoading);

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
              for (final need in needOptions)
                BaseChoiceChip(
                  label: l10n.options.selectOrFallback(need),
                  isSelected: selected == need,
                  onTap: () => context.read<NeedCubit>().onNeedToggled(need),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s20),
          BaseNote(text: l10n.note),
        ],
      ),
      footer: BaseButton(
        text: l10n.send,
        isEnabled: selected != null,
        isLoading: isLoading,
        onPressed: context.read<NeedCubit>().send,
      ),
    );
  }
}

class const _Sent() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.need.sent;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(l10n.title, style: context.text.titleXl, textAlign: TextAlign.center),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.text,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton(text: l10n.done, onPressed: () => context.router.maybePop()),
    );
  }
}
