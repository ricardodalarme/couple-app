import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The one lock shown in place of a Plus feature; tapping it opens the plans.
///
/// Never place it over safety, pause or unpair, which are always free.
class const PlusLock({required final String title, final String? text, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;

    return BaseListCard(
      categoryLabel: l10n.lockLabel,
      title: title,
      supportText: text ?? l10n.lockText,
      onTap: () => context.pushRoute(const PlansRoute()),
    );
  }
}
