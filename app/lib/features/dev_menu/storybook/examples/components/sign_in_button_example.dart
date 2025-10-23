import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode signInButtonExample = WidgetbookUseCase(
  name: 'SignInButton',
  builder: (context) => SignInButton(
    context.knobs.object.dropdown(label: 'Provider', options: ButtonProvider.values),
    text: (provider) =>
        'Sign in with ${provider.name.characters.first.toUpperCase() + provider.name.substring(1)}',
    onPressed: () => context.showSnackBar(message: 'Click success'),
  ),
);
