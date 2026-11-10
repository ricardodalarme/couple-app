import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/update_required_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Wraps the navigator with the forced-update block and the global offline banner.
class const AppShell({required final Widget child, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final updateRequired = context.select((VersionGateCubit cubit) => cubit.state.updateRequired);
    if (updateRequired) return const UpdateRequiredPage();

    final isOffline = context.select((ConnectivityCubit cubit) => cubit.state.isOffline);

    return Column(
      children: [
        if (isOffline)
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpace.screenMargin,
                AppSpace.s8,
                AppSpace.screenMargin,
                0,
              ),
              child: BaseBanner(
                text: context.l10n.globalErrors.offline,
                variant: BaseBannerVariant.warning,
                icon: AppIcons.wifi_off,
              ),
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}
