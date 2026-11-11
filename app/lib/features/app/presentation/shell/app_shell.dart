import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/time_in_app/cubit/time_in_app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/update_required_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Wraps the navigator with the forced-update block, the time-in-app prompt and
/// the global offline banner.
class const AppShell({required final Widget child, final RootStackRouter? router, super.key})
    extends StatefulWidget {
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState() extends State<AppShell> {
  bool _isShowingPrompt = false;

  @override
  Widget build(BuildContext context) {
    final updateRequired = context.select((VersionGateCubit cubit) => cubit.state.updateRequired);
    if (updateRequired) return const UpdateRequiredPage();

    final isAuthenticated = context.select(
      (AppCubit cubit) => cubit.state == AppState.authenticated,
    );
    final isOffline = context.select((ConnectivityCubit cubit) => cubit.state.isOffline);

    return BlocListener<TimeInAppCubit, TimeInAppState>(
      listenWhen: (previous, current) =>
          isAuthenticated && !previous.shouldPrompt && current.shouldPrompt,
      listener: (context, _) => _showTimeInAppPrompt(),
      child: Column(
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
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  void _showTimeInAppPrompt() {
    if (_isShowingPrompt) return;
    _isShowingPrompt = true;
    final router = widget.router ?? AppInjector.instance.get<RootStackRouter>();
    unawaited(router.push(const TimeInAppRoute()).whenComplete(() => _isShowingPrompt = false));
  }
}
