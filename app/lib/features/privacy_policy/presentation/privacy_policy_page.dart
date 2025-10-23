import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:quickstart_flutter_bloc/features/_shared/presentation/widgets/web_view.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

const _privacyPolicyUrl = 'https://www.example.com';

@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.privacyPolicy.title,
      body: const WebView(url: _privacyPolicyUrl),
    );
  }
}
