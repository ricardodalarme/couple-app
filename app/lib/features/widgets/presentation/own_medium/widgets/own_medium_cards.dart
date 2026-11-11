import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Medium personal widgets (`X-147`): Ideia do dia and Potinho do dia ruim.
class const OwnMediumWidgetsCards({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;

    if (!payload.isSignedIn) {
      return WidgetSurfacePreview(
        categoryLabel: l10n.signedOutLabel,
        title: l10n.signedOutBody,
        subtitle: l10n.ownIdeaHint,
        isDark: isDarkPreview,
        deepLinkUri: Uri.parse('repara://sign-in'),
      );
    }

    final ideaTitle = payload.discreet
        ? l10n.discreetReminderLabel
        : (payload.dailyIdeaTitle ?? l10n.ownIdeaDefault);
    final ideaSubtitle = payload.discreet ? l10n.discreetNeutralBody : l10n.ownMediumIdeaAction;

    final jarTitle = payload.discreet ? l10n.discreetReminderLabel : l10n.ownMediumJarTitle;
    final jarSubtitle = payload.discreet ? l10n.discreetNeutralBody : l10n.ownMediumJarPrivacy;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WidgetSurfacePreview(
          categoryLabel: l10n.ownIdeaLabel,
          title: ideaTitle,
          subtitle: ideaSubtitle,
          isDark: isDarkPreview,
          deepLinkUri: Uri.parse('repara://today'),
        ),
        const SizedBox(height: AppSpace.s16),
        WidgetSurfacePreview(
          categoryLabel: l10n.ownJarLabel,
          title: jarTitle,
          subtitle: jarSubtitle,
          isDark: isDarkPreview,
          deepLinkUri: Uri.parse('repara://jar'),
        ),
      ],
    );
  }
}
