import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/help_lines/cubit/help_lines_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Help lines with one-tap dialling, always in the neutral theme and never behind Plus.
@RoutePage()
class const HelpLinesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HelpLinesCubit>(),
      child: AppThemeHost(initialVariant: AppThemeVariant.neutral, child: this),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.safety;
    final state = context.select((HelpLinesCubit cubit) => cubit.state);
    final cubit = context.read<HelpLinesCubit>();

    return BaseView(
      body: BlocListener<HelpLinesCubit, HelpLinesState>(
        listenWhen: (previous, current) => previous.copiedKey != current.copiedKey,
        listener: (context, state) {
          if (state.copiedKey != null) {
            BaseToast.show(context, l10n.copied);
            context.read<HelpLinesCubit>().clearCopied();
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.subtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              BaseListGroup(
                children: [
                  for (final line in state.lines)
                    BaseListTile(
                      title: l10n.lines.selectOrFallback(line.key),
                      subtitle: line.isVerified ? line.number : '${line.number} · ${l10n.toVerify}',
                      onTap: () => cubit.reach(line),
                      trailing: BaseTextLink(text: l10n.call, onPressed: () => cubit.reach(line)),
                    ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseNote(text: l10n.privateNote),
              const SizedBox(height: AppSpace.s12),
              BaseTextLink(
                text: l10n.safeModeLink,
                onPressed: () => context.pushRoute(const SafeModeRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
