import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/widgets/settings_option.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

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
    return BaseView(
      title: context.l10n.settings.title,
      body: const Padding(
        padding: EdgeInsets.all(Spacings.large),
        child: Column(children: [_BiometricsOption()]),
      ),
    );
  }
}

class const _BiometricsOption() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final useBiometrics = context.select(
      (SettingsCubit cubit) => cubit.state.settings.useBiometrics,
    );

    return SettingsOption(
      text: context.l10n.settings.optionBiometrics,
      value: useBiometrics,
      onChanged: context.read<SettingsCubit>().onUseBiometricsChanged,
    );
  }
}
