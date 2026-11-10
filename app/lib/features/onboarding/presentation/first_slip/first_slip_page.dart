import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/first_slip/cubit/first_slip_cubit.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/widgets/intro_scaffold.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const FirstSlipPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<FirstSlipCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.firstSlip;

    return BlocListener<FirstSlipCubit, FirstSlipState>(
      listenWhen: (previous, current) => previous.saveAction != current.saveAction,
      listener: (context, state) {
        switch (state.saveAction) {
          case Success():
            context.pushRoute(const SignInRoute());
          case Failure():
            BaseToast.show(context, l10n.saveError);
          default:
            break;
        }
      },
      child: IntroScaffold(
        stepIndex: 3,
        title: l10n.title,
        highlight: l10n.titleHighlight,
        subtitle: l10n.subtitle,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseTextArea(
              hint: l10n.hint,
              onChanged: context.read<FirstSlipCubit>().onTextChanged,
            ),
            const SizedBox(height: AppSpace.s16),
            BaseNote(text: l10n.localNote),
          ],
        ),
        footer: const _Footer(),
      ),
    );
  }
}

class const _Footer() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.firstSlip;
    final canSave = context.select((FirstSlipCubit cubit) => cubit.state.canSave);
    final isLoading = context.select((FirstSlipCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<FirstSlipCubit>();

    return Row(
      children: [
        BaseButton(
          text: context.l10n.intro.skip,
          variant: .text,
          isFullWidth: false,
          onPressed: () async {
            await cubit.skip();
            if (context.mounted) await context.pushRoute(const SignInRoute());
          },
        ),
        const SizedBox(width: AppSpace.s12),
        Expanded(
          child: BaseButton(
            text: l10n.save,
            isEnabled: canSave,
            isLoading: isLoading,
            onPressed: cubit.save,
          ),
        ),
      ],
    );
  }
}
