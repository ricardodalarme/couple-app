import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Safe mode and quick exit; nothing here is sent to the server or logged.
@RoutePage()
class const SafeModePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<SafeModeCubit>(),
      child: AppThemeHost(initialVariant: AppThemeVariant.neutral, child: this),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.safeMode;
    final isOn = context.select((SafeModeCubit cubit) => cubit.state.isOn);

    return BaseView(
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
            const SizedBox(height: AppSpace.s8),
            Text(l10n.text, style: context.text.body.copyWith(color: context.colors.textSecondary)),
            const SizedBox(height: AppSpace.s20),
            BaseListGroup(
              children: [
                BaseListTile(
                  title: l10n.toggle,
                  subtitle: l10n.toggleText,
                  control: BaseSwitch(
                    value: isOn,
                    semanticLabel: l10n.toggle,
                    onChanged: (value) => context.read<SafeModeCubit>().set(value: value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpace.s12),
            BaseNote(text: l10n.localOnly),
          ],
        ),
        footer: BaseButton(
          text: l10n.quickExit,
          onPressed: () => context.router.root.replaceAll([const NeutralRoute()]),
        ),
      ),
    );
  }
}
