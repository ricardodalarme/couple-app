import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const NotFoundPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.l10n.notFound.title, style: context.typography.titleLarge),
            Text(context.l10n.notFound.description),
            const Gap(Spacings.xxlarge),
            BaseButton(
              text: context.l10n.notFound.buttonBack,
              onPressed: () => context.navigateTo(const HomeRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
