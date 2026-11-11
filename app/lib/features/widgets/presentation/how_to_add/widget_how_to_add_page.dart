import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/how_to_add/widgets/how_to_add_steps_list.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Step-by-step instructions (`X-156`) for placing a widget on the home screen or iOS lock screen.
@RoutePage()
class const WidgetHowToAddPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;

    return BaseView(
      appBar: BaseAppBar(title: l10n.howToAddTitle),
      body: BaseStackedContent(
        footer: BaseButton(text: l10n.howToAddDone, onPressed: () => context.maybePop()),
        body: const HowToAddStepsList(),
      ),
    );
  }
}
