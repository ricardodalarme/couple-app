import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/shared/widgets/social_button.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode socialButtonExample = WidgetbookUseCase(
  name: '$SocialButton',
  builder: (context) => SocialButton(
    context.knobs.object.dropdown(label: 'Provider', options: ButtonProvider.values),
    text: (provider) =>
        'Sign in with ${provider.name.characters.first.toUpperCase() + provider.name.substring(1)}',
    onPressed: () => context.showSnackBar('Click success'),
  ),
);
