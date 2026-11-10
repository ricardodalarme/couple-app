import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const TermsListPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.terms.list;

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseStackedContent(body: Text(l10n.title, style: context.text.body)),
    );
  }
}
