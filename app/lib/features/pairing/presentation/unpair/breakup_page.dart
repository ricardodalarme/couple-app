import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/unpair/cubit/unpair_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const BreakupPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<UnpairCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.unpair;
    final breakup = l10n.breakup;
    final action = context.select((UnpairCubit cubit) => cubit.state.unpairAction);

    return BaseView(
      appBar: BaseAppBar(title: breakup.appBarTitle),
      body: BlocListener<UnpairCubit, UnpairState>(
        listenWhen: (previous, current) => previous.unpairAction != current.unpairAction,
        listener: (context, state) {
          switch (state.unpairAction) {
            case Success<void>():
              context.router.replace(const UnpairDoneRoute());
            case Failure(:final exception):
              BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
            case Initial() || Loading():
              break;
          }
        },
        child: BaseMomentContent(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BaseFace(kind: FaceKind.sad, size: FaceSize.showcase),
              const SizedBox(height: AppSpace.s24),
              Semantics(
                header: true,
                liveRegion: true,
                child: AppHighlightedText(
                  text: breakup.title,
                  highlight: breakup.highlight,
                  style: context.text.display,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpace.s12),
              Text(
                breakup.text,
                textAlign: TextAlign.center,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
            ],
          ),
          footer: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseButton(
                text: breakup.continueLabel,
                isLoading: action.isLoading,
                onPressed: action.isLoading ? null : context.read<UnpairCubit>().unpair,
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: breakup.cancel,
                variant: .secondary,
                onPressed: context.router.maybePop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
