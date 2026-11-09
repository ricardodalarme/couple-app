import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:ui/ui.dart';

const _privacyPolicyUrl = 'https://www.example.com';

@RoutePage()
class const PrivacyPolicyPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: BaseAppBar(title: context.l10n.privacyPolicy.title),
      body: const WebView(url: _privacyPolicyUrl),
    );
  }
}
