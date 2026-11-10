import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const SearchPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: BaseAppBar(title: context.l10n.search.title),
      body: const BaseStackedContent(body: _SearchField()),
    );
  }
}

class const _SearchField() extends StatefulWidget {
  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState() extends State<_SearchField> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      text: _query,
      hint: context.l10n.search.fieldSearchHint,
      leadingIcon: AppIcons.search,
      onChanged: (value) => setState(() => _query = value),
    );
  }
}
