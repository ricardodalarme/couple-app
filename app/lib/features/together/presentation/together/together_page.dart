import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const TogetherPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.tabs;

    return BaseView(
      appBar: null,
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.together, style: context.text.titleXl),
            const SizedBox(height: AppSpace.s16),
            BaseListCard(
              categoryLabel: l10n.temperatureLabel,
              title: l10n.temperatureTitle,
              supportText: l10n.temperatureText,
              onTap: () => context.pushRoute(const TemperatureRoute()),
            ),
            const SizedBox(height: AppSpace.s16),
            BaseEmptyState(title: l10n.soonTitle, text: l10n.soonText),
          ],
        ),
      ),
    );
  }
}
