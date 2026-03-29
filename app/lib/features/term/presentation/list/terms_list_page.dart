import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class TermsListPage extends StatelessWidget {
  const TermsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TranslationsTermsListEn l10n = context.l10n.terms.list;

    return BaseView(
      title: l10n.title,
      body: Center(child: Text(l10n.title)),
    );
  }
}
