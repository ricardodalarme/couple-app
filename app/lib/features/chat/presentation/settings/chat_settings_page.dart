import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/settings/cubit/chat_settings_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The consent switch and what the conversation sends to the model.
@RoutePage()
class const ChatSettingsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ChatSettingsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;
    final status = context.select((ChatSettingsCubit cubit) => cubit.state.status);
    final isEnabled = context.select((ChatSettingsCubit cubit) => cubit.state.isEnabled);
    final messagesLeft = context.select((ChatSettingsCubit cubit) => cubit.state.messagesLeft);
    final limit = context.select((ChatSettingsCubit cubit) => cubit.state.limit);
    final hasPlus = context.select((ChatSettingsCubit cubit) => cubit.state.hasPlus);
    final cubit = context.read<ChatSettingsCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.settingsTitle),
      body: BlocListener<ChatSettingsCubit, ChatSettingsState>(
        listenWhen: (previous, current) => previous.toggleAction != current.toggleAction,
        listener: (context, state) {
          switch (state.toggleAction) {
            case Success():
              BaseToast.show(context, state.isEnabled ? l10n.settingsOn : l10n.settingsOff);
            case Failure(:final exception):
              BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
            default:
              break;
          }
        },
        child: switch (status) {
          Success() => BaseStackedContent(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseListGroup(
                  children: [
                    BaseListTile(
                      title: l10n.toggleLabel,
                      subtitle: l10n.toggleSubtitle,
                      control: BaseSwitch(
                        value: isEnabled,
                        semanticLabel: l10n.toggleLabel,
                        onChanged: (value) => cubit.setEnabled(enabled: value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpace.s16),
                Text(
                  hasPlus ? l10n.planPlus : l10n.planFree,
                  style: context.text.label.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s4),
                Text(
                  hasPlus ? l10n.usagePlus(left: messagesLeft, limit: limit) : l10n.usageFree,
                  style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s20),
                Semantics(
                  header: true,
                  child: Text(l10n.sendingTitle, style: context.text.titleXs),
                ),
                const SizedBox(height: AppSpace.s8),
                Text(
                  l10n.sendingText,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s16),
                BaseNote(text: l10n.disableNote, icon: AppIcons.info),
              ],
            ),
          ),
          Failure() => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
          _ => const Center(child: BaseLoadingDots()),
        },
      ),
    );
  }
}
