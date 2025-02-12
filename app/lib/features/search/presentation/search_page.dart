import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:quickstart_flutter_bloc/features/search/presentation/widgets/search_text_field.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.search.title,
      body: const Padding(padding: EdgeInsets.all(Spacings.medium), child: SearchTextField()),
    );
  }
}
