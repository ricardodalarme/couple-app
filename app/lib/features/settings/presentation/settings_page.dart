import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/widgets/settings_option.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

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

class _BiometricsOption extends StatelessWidget {
  const _BiometricsOption();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) => SettingsOption(
        text: context.l10n.settings.optionBiometrics,
        value: state.settings.useBiometrics,
        onChanged: context.read<SettingsCubit>().onUseBiometricsChanged,
      ),
    );
  }
}
