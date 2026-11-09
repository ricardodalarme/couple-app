import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class const SettingsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SettingsCubit>()..opened(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.settings;

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseSectionHeader(title: l10n.sectionAccount, isLabel: true),
            const SizedBox(height: AppSpace.s12),
            const BaseListGroup(children: <Widget>[_BiometricsRow(), _DeleteAccountRow()]),
          ],
        ),
      ),
    );
  }
}

class const _BiometricsRow() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final useBiometrics = context.select(
      (SettingsCubit cubit) => cubit.state.settings.useBiometrics,
    );

    return BaseListTile(
      title: context.l10n.settings.optionBiometrics,
      icon: AppIcons.shield,
      control: BaseSwitch(
        value: useBiometrics,
        semanticLabel: context.l10n.settings.optionBiometrics,
        onChanged: context.read<SettingsCubit>().onUseBiometricsChanged,
      ),
    );
  }
}

class const _DeleteAccountRow() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseListTile(
      title: context.l10n.account.deleteAccount.title,
      icon: AppIcons.trash,
      isDestructive: true,
      showsChevron: true,
      onTap: () => context.pushRoute(const DeleteAccountRoute()),
    );
  }
}
