import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:quickstart_flutter_bloc/features/onboarding/presentation/widgets/page_indicator_widget.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget implements AutoRouteWrapper {
  const OnboardingPage({super.key});

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
                final OnboardingPageData page = context.l10n.onboarding.pages[index];

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
          BlocBuilder<OnboardingCubit, int>(
            builder: (context, state) => PageIndicatorWidget(
              current: state,
              totalPages: context.l10n.onboarding.pages.length,
            ),
          ),
          const Gap(Spacings.xlarge),
          Padding(
            padding: const EdgeInsets.all(Spacings.large),
            child: BaseButton(
              text: context.l10n.onboarding.doneButton,
              onPressed: () {
                context.read<OnboardingCubit>().onCompleted();
                context.router.replace(const LoginRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
