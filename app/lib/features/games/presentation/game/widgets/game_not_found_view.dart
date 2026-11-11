import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The honest empty state for a game key the app has no screens for.
class const GameNotFoundView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.notFound;

    return BaseStackedContent(
      body: BaseEmptyState(
        title: l10n.title,
        text: l10n.text,
        actionText: l10n.action,
        onAction: () => context.router.maybePop(),
        isSecondaryAction: true,
      ),
    );
  }
}
