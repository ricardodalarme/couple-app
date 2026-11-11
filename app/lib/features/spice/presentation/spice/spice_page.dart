import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/lock/plus_lock.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';
import 'package:flutter_bloc_starter/features/spice/presentation/spice/cubit/spice_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// An optional, discreet mode that needs both people to switch it on and either to switch it off.
@RoutePage()
class const SpicePage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<SpiceCubit>()..load(), child: this);
  }

  @override
  State<SpicePage> createState() => _SpicePageState();
}

class _SpicePageState() extends State<SpicePage> with WidgetsBindingObserver {
  bool _exitRequested = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) context.read<SpiceCubit>().refresh();
  }

  void _exitToToday() {
    if (_exitRequested) return;
    _exitRequested = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final router = context.router;
      if (router.stack.any((route) => route.name == HomeRoute.name)) {
        router.popUntil((route) => route.settings.name == HomeRoute.name);
      } else {
        router.maybePop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.spice;
    final view = context.select((SpiceCubit cubit) => cubit.state.view);
    final index = context.select((SpiceCubit cubit) => cubit.state.index);
    final isToggling = context.select((SpiceCubit cubit) => cubit.state.toggleAction.isLoading);
    final isHidden = context.select((SpiceCubit cubit) => cubit.state.isHidden);
    final shouldExit = context.select((SpiceCubit cubit) => cubit.state.shouldExit);
    final cubit = context.read<SpiceCubit>();

    if (isHidden || shouldExit) {
      _exitToToday();
      return const BaseView(body: SizedBox.shrink());
    }

    return BaseView(
      body: BlocListener<SpiceCubit, SpiceState>(
        listenWhen: (previous, current) => previous.toggleAction != current.toggleAction,
        listener: (context, state) {
          final action = state.toggleAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: BaseRefreshable(
          onRefresh: cubit.refresh,
          child: SkeletonizerResourceWidget<SpiceView>(
            view,
            fakeValue: const SpiceView(stage: SpiceStage.off),
            successBuilder: (value) => switch (value.stage) {
              SpiceStage.off => BaseStackedContent(
                body: _Intro(title: l10n.title, text: l10n.offText),
                footer: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpace.s8,
                  children: [
                    BaseButton(
                      text: l10n.turnOn,
                      isLoading: isToggling,
                      onPressed: () => cubit.setEnabled(enabled: true),
                    ),
                    BaseButton(
                      text: l10n.notNow,
                      variant: .secondary,
                      onPressed: () => context.router.maybePop(),
                    ),
                  ],
                ),
              ),
              SpiceStage.waiting => BaseStackedContent(
                body: _Intro(title: l10n.title, text: l10n.waitingText),
                footer: BaseButton(
                  text: l10n.turnOff,
                  variant: .secondary,
                  isLoading: isToggling,
                  onPressed: () => cubit.setEnabled(enabled: false),
                ),
              ),
              SpiceStage.ready => BaseStackedContent(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Intro(title: l10n.title, text: l10n.readyText),
                    const SizedBox(height: AppSpace.s20),
                    BaseSurfaceCard(title: value.cards[index % value.cards.length]),
                  ],
                ),
                footer: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpace.s8,
                  children: [
                    BaseButton(text: l10n.drawCard, onPressed: cubit.next),
                    BaseButton(
                      text: l10n.turnOff,
                      variant: .secondary,
                      isLoading: isToggling,
                      onPressed: () => cubit.setEnabled(enabled: false),
                    ),
                  ],
                ),
              ),
              SpiceStage.plusLocked => BaseStackedContent(
                body: PlusLock(title: l10n.title),
                footer: BaseButton(
                  text: l10n.notNow,
                  variant: .secondary,
                  onPressed: () => context.router.maybePop(),
                ),
              ),
            },
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.errorTitle,
              text: l10n.errorText,
              actionText: context.l10n.common.retry,
              onAction: cubit.load,
            ),
          ),
        ),
      ),
    );
  }
}

class const _Intro({required final String title, required final String text})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(header: true, child: Text(title, style: context.text.titleXl)),
        const SizedBox(height: AppSpace.s8),
        Text(text, style: context.text.body.copyWith(color: context.colors.textSecondary)),
      ],
    );
  }
}
