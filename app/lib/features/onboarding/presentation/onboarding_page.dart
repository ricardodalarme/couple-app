import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/widgets/page_indicator_widget.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const OnboardingPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<OnboardingCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          const Gap(Spacings.xxxlarge),
          Assets.images.placeholder.svg(),
          const Gap(Spacings.xxlarge),
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) => context.read<OnboardingCubit>().onPageChanged(index),
              itemCount: context.l10n.onboarding.pages.length,
              itemBuilder: (context, index) {
                final page = context.l10n.onboarding.pages[index];

                return Padding(
                  padding: const EdgeInsets.all(Spacings.xxlarge),
                  child: Column(
                    children: [
                      Text(
                        page.title,
                        style: context.typography.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(Spacings.large),
                      Text(
                        page.message,
                        style: context.typography.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const _PageIndicator(),
          const Gap(Spacings.xlarge),
          Padding(
            padding: const EdgeInsets.all(Spacings.large),
            child: BaseButton(
              text: context.l10n.onboarding.doneButton,
              onPressed: () async {
                await context.read<OnboardingCubit>().onCompleted();
                if (context.mounted) await context.router.replace(const LoginRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class const _PageIndicator() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPage = context.select((OnboardingCubit cubit) => cubit.state);

    return PageIndicatorWidget(
      current: currentPage,
      totalPages: context.l10n.onboarding.pages.length,
    );
  }
}
