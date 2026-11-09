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

    return ColoredBox(
      color: context.colors.bgScreen,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpace.screenMargin,
                AppSpace.s8,
                AppSpace.screenMargin,
                AppSpace.s8,
              ),
              child: BaseFlowHeader(title: l10n.title, onBack: () => context.router.maybePop()),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpace.screenMargin,
                  AppSpace.s8,
                  AppSpace.screenMargin,
                  AppSpace.s34,
                ),
                children: const [
                  _SettingsGroup(children: <Widget>[_BiometricsRow(), _DeleteAccountRow()]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class const _SettingsGroup({required final List<Widget> children}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.xxl);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.bgSurface,
        borderRadius: radius,
        border: AppBorders.hair(context.colors.borderDefault),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Column(children: children),
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
      showsDivider: false,
      trailing: BaseSwitch(
        value: useBiometrics,
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
