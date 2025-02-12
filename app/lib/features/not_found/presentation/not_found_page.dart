import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

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
