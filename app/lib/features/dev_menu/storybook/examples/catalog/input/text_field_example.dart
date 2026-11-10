import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode textFieldExample = WidgetbookComponent(
  name: 'Text field',
  useCases: [
    WidgetbookUseCase(
      name: 'Types, focus, error, help and disabled',
      builder: (context) => const GalleryPage(
        title: 'Text field',
        children: [
          GallerySection(
            title: 'Types',
            children: [
              GallerySurface(
                child: BaseTextField(label: 'Name', hint: 'Your name', leadingIcon: AppIcons.user),
              ),
              SizedBox(height: AppSpace.s16),
              GallerySurface(
                child: BaseTextField(
                  label: 'E-mail',
                  hint: 'you@example.com',
                  type: BaseTextFieldType.email,
                  leadingIcon: AppIcons.mail,
                ),
              ),
              SizedBox(height: AppSpace.s16),
              GallerySurface(
                child: BaseTextField(
                  label: 'Invite code',
                  hint: 'ABCD 1234',
                  type: BaseTextFieldType.inviteCode,
                  leadingIcon: AppIcons.shield,
                ),
              ),
              SizedBox(height: AppSpace.s16),
              GallerySurface(
                child: BaseTextField(
                  label: 'Password',
                  hint: 'At least 8 characters',
                  type: BaseTextFieldType.password,
                  leadingIcon: AppIcons.lock,
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'States',
            children: [
              GallerySurface(child: _FocusedTextField()),
              SizedBox(height: AppSpace.s16),
              GallerySurface(
                child: BaseTextField(
                  label: 'E-mail',
                  hint: 'you@example.com',
                  errorText: 'Use the address you signed up with.',
                  leadingIcon: AppIcons.mail,
                ),
              ),
              SizedBox(height: AppSpace.s16),
              GallerySurface(
                child: BaseTextField(
                  label: 'Display name',
                  hint: 'Marina',
                  helpText: 'This is how your partner sees you.',
                ),
              ),
              SizedBox(height: AppSpace.s16),
              GallerySurface(
                child: BaseTextField(
                  label: 'Disabled',
                  hint: 'Only you can change this',
                  isEnabled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);

class const _FocusedTextField() extends StatefulWidget {
  @override
  State<_FocusedTextField> createState() => _FocusedTextFieldState();
}

class _FocusedTextFieldState() extends State<_FocusedTextField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) FocusScope.of(context).nextFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BaseTextField(
      label: 'Focused',
      hint: 'Type here',
      helpText: 'The border turns to the selected role while typing.',
    );
  }
}
