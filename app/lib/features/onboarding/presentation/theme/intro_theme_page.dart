import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/cubit/intro_cubit.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/widgets/intro_scaffold.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

const double _swatchSide = 44;
const double _swatchRadius = 12;

@RoutePage()
class const IntroThemePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<IntroCubit>()..start(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.intro.theme;
    final cubit = context.read<IntroCubit>();

    Future<void> next(Future<void> Function() save) async {
      await save();
      if (context.mounted) await context.pushRoute(const SignInRoute());
    }

    return IntroScaffold(
      stepIndex: 2,
      title: l10n.title,
      highlight: l10n.titleHighlight,
      subtitle: l10n.subtitle,
      body: const _ThemeOptions(),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.footnote,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s12),
          IntroFooter(
            skipText: context.l10n.intro.skip,
            continueText: context.l10n.intro.continueButton,
            onSkip: () => next(() => cubit.skip(3)),
            onContinue: () => next(() => cubit.complete(3)),
          ),
        ],
      ),
    );
  }
}

class const _ThemeOptions() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.intro.theme;
    final selected = context.select((IntroCubit cubit) => cubit.state.theme);

    final options = [
      (AppThemeVariant.rose, l10n.rose, l10n.roseSupport),
      (AppThemeVariant.blue, l10n.blue, l10n.blueSupport),
      (AppThemeVariant.neutral, l10n.neutral, l10n.neutralSupport),
    ];

    return Column(
      children: [
        for (final (variant, title, support) in options) ...[
          BaseOptionTile(
            title: title,
            support: support,
            leading: _Swatch(variant: variant),
            isSelected: selected == variant,
            onTap: () {
              context.read<IntroCubit>().selectTheme(variant);
              AppThemeScope.set(context, variant);
            },
          ),
          const SizedBox(height: AppSpace.s10),
        ],
      ],
    );
  }
}

class const _Swatch({required final AppThemeVariant variant}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.forVariant(variant);

    return Container(
      width: _swatchSide,
      height: _swatchSide,
      decoration: BoxDecoration(
        color: colors.bgScreen,
        borderRadius: BorderRadius.circular(_swatchRadius),
        border: Border.all(color: colors.borderDefault),
      ),
      alignment: Alignment.center,
      child: Container(
        width: _swatchSide / 2,
        height: AppSpace.s6,
        decoration: BoxDecoration(
          color: colors.accentHighlight,
          borderRadius: BorderRadius.circular(AppSpace.s2),
        ),
      ),
    );
  }
}
