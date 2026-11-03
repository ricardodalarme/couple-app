import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const SearchPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.search.title,
      body: const Padding(padding: EdgeInsets.all(Spacings.medium), child: SearchTextField()),
    );
  }
}
