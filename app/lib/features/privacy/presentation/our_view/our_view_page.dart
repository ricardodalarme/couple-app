import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// What the team can see, in plain language.
@RoutePage()
class const OurViewPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.privacy;

    return BaseView(
      appBar: BaseAppBar(title: l10n.ourTitle),
      body: BaseStackedContent(
        body: BaseListGroup(
          children: [
            BaseListTile(title: l10n.ourEncrypted, icon: AppIcons.lock),
            BaseListTile(title: l10n.ourPrivate, icon: AppIcons.eye_off),
            BaseListTile(title: l10n.ourAnalytics, icon: AppIcons.info),
            BaseListTile(title: l10n.ourPlain, icon: AppIcons.book),
          ],
        ),
      ),
    );
  }
}
