import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/errors/app_error_view.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/cubit/mood_cubit.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/widgets/mood_form.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const MoodPage({final String? initialMood, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = AppInjector.instance.get<MoodCubit>();
        cubit.load().then((_) {
          final mood = MoodKind.values.asNameMap()[initialMood];
          if (mood != null && !cubit.isClosed) cubit.selectMood(mood);
        });

        return cubit;
      },
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final entry = context.select((MoodCubit cubit) => cubit.state.entry);

    return BaseView(
      appBar: BaseAppBar(subtitle: context.l10n.mood.privateCue),
      body: BlocListener<MoodCubit, MoodState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: _onSaveChanged,
        child: switch (entry) {
          Failure() => AppErrorView(
            exception: entry.exception,
            onRetry: context.read<MoodCubit>().load,
          ),
          Loading() => const Center(child: BaseLoadingDots()),
          _ => const MoodForm(),
        },
      ),
    );
  }

  void _onSaveChanged(BuildContext context, MoodState state) {
    final action = state.saveAction;
    final l10n = context.l10n.mood;
    if (action is Failure) {
      BaseToast.show(
        context,
        l10n.errors.selectOrFallback(action.exception.l10nKey),
        variant: BaseToastVariant.error,
      );

      return;
    }
    if (action is Success) BaseToast.show(context, l10n.saved);
  }
}
