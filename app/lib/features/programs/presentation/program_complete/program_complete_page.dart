import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The warm end of a program; no score, streak or progress bar.
@RoutePage()
class const ProgramCompletePage({required final String title, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;

    return BaseView(
      appBar: BaseAppBar(title: l10n.completeTitle),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpace.s24),
            const BaseFace(kind: FaceKind.affectionate, size: FaceSize.showcase),
            const SizedBox(height: AppSpace.s20),
            Semantics(
              header: true,
              child: Text(
                l10n.completeTitle,
                textAlign: TextAlign.center,
                style: context.text.titleXl,
              ),
            ),
            const SizedBox(height: AppSpace.s12),
            Text(
              l10n.completeText(title: title),
              textAlign: TextAlign.center,
              style: context.text.body,
            ),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.completeHint,
              textAlign: TextAlign.center,
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        footer: BaseButton(
          text: l10n.seePrograms,
          onPressed: () => context.router.navigate(const ProgramsRoute()),
        ),
      ),
    );
  }
}
