import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const TermsListPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.terms.list;

    return BaseView(
      title: l10n.title,
      body: Center(child: Text(l10n.title)),
    );
  }
}
