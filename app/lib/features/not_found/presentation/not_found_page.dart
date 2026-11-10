import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const NotFoundPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notFound;

    return BaseView(
      body: BaseMomentContent(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.title, textAlign: TextAlign.center, style: context.text.titleXl),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.description,
              textAlign: TextAlign.center,
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        footer: BaseButton(
          text: l10n.buttonBack,
          onPressed: () => context.navigateTo(const HomeRoute()),
        ),
      ),
    );
  }
}
