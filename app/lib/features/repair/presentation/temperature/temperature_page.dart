import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/cubit/temperature_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/widgets/temperature_intensity.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/widgets/temperature_level.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/widgets/temperature_result.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const TemperaturePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<TemperatureCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final step = context.select((TemperatureCubit cubit) => cubit.state.step);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<TemperatureCubit, TemperatureState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: _onSaveChanged,
        child: switch (step) {
          TemperatureStep.level => const TemperatureLevel(),
          TemperatureStep.intensity => const TemperatureIntensity(),
          TemperatureStep.result => const TemperatureResult(),
        },
      ),
    );
  }

  void _onSaveChanged(BuildContext context, TemperatureState state) {
    final action = state.saveAction;
    if (action is! Failure) return;

    BaseToast.show(
      context,
      context.l10n.temperature.errors.selectOrFallback(action.exception.l10nKey),
    );
  }
}
