import 'package:common_ui/common_ui.dart';
import 'package:design_system/design_system.dart';

const _googleBlue = Color(0xFF4285F4);

enum ButtonProvider(final String text) {
  google('Google'),
  apple('Apple'),
}

class const SocialButton(
  final ButtonProvider button, {
  required final String Function(ButtonProvider) text,
  required final VoidCallback onPressed,
  super.key,
}) extends StatelessWidget {
  static const double _iconSize = AppIconSize.xl;

  @override
  Widget build(BuildContext context) {
    final buttonText = text(button);

    return switch (button) {
      ButtonProvider.google => _SignInButtonBuilder(
        key: const ValueKey(ButtonProvider.google),
        text: buttonText,
        icon: Container(
          padding: const EdgeInsets.all(AppSpace.s4),
          color: AppPalette.white,
          child: Assets.logos.google.svg(height: _iconSize),
        ),
        backgroundColor: _googleBlue,
        iconPadding: const EdgeInsets.fromLTRB(AppSpace.s2, 0, AppSpace.s4, 0),
        onPressed: onPressed,
      ),
      ButtonProvider.apple => _SignInButtonBuilder(
        key: const ValueKey(ButtonProvider.apple),
        text: buttonText,
        icon: Assets.logos.apple.svg(
          height: _iconSize,
          colorFilter: const ColorFilter.mode(AppPalette.white, BlendMode.srcIn),
        ),
        backgroundColor: AppPalette.neutral900,
        onPressed: onPressed,
      ),
    };
  }
}

class const _SignInButtonBuilder({
  required final Color backgroundColor,
  required final VoidCallback onPressed,
  required final String text,
  required final Widget icon,
  super.key,
  final EdgeInsets? iconPadding,
}) extends StatelessWidget {
  static const double _buttonMaxWidth = 220;
  static const double _buttonHeight = 36;

  @override
  Widget build(BuildContext context) {
    return AppPressable(
      onTap: onPressed,
      child: ColoredBox(
        color: backgroundColor,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _buttonMaxWidth),
          child: SizedBox(
            height: _buttonHeight,
            child: Row(
              children: [
                Padding(
                  padding: iconPadding ?? const EdgeInsets.symmetric(horizontal: AppSpace.s8),
                  child: icon,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpace.s4),
                    child: Text(
                      text,
                      style: context.text.bodySm.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppPalette.white,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
