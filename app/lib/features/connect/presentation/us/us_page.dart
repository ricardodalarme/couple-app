import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/cubit/us_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// A light way to say "I miss us", with an optional small plan, and no pressure to answer.
@RoutePage()
class const UsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<UsCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.connectUs;
    final wasSent = context.select((UsCubit cubit) => cubit.state.wasSent);
    final isSending = context.select((UsCubit cubit) => cubit.state.sendAction.isLoading);
    final cubit = context.read<UsCubit>();

    return BaseView(
      body: BlocListener<UsCubit, UsState>(
        listenWhen: (previous, current) => previous.sendAction != current.sendAction,
        listener: (context, state) {
          final action = state.sendAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.text,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              if (wasSent) ...[
                const SizedBox(height: AppSpace.s20),
                BaseNote(text: l10n.sentNote, icon: AppIcons.check),
              ],
            ],
          ),
          footer: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.s8,
            children: [
              if (!wasSent)
                BaseButton(text: l10n.send, isLoading: isSending, onPressed: cubit.send),
              BaseButton(
                text: l10n.plan,
                variant: wasSent ? .primary : .secondary,
                onPressed: () => context.pushRoute(const DateNightRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
