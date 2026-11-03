import 'package:common_ui/common_ui.dart';

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
  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context) {
    final buttonText = text(button);

    return switch (button) {
      ButtonProvider.google => _SignInButtonBuilder(
        key: const ValueKey(ButtonProvider.google),
        text: buttonText,
        icon: Container(
          padding: const EdgeInsets.all(Spacings.xsmall),
          color: Colors.white,
          child: Assets.logos.google.svg(height: _iconSize),
        ),
        backgroundColor: const Color(0xFF4285F4),
        iconPadding: const EdgeInsets.fromLTRB(Spacings.xxsmall, 0, Spacings.xsmall, 0),
        onPressed: onPressed,
      ),
      ButtonProvider.apple => _SignInButtonBuilder(
        key: const ValueKey(ButtonProvider.apple),
        text: buttonText,
        icon: Assets.logos.apple.svg(
          height: _iconSize,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        backgroundColor: Colors.black,
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
    return BaseTapper(
      onTap: onPressed,
      backgroundColor: backgroundColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _buttonMaxWidth),
        child: SizedBox(
          height: _buttonHeight,
          child: Row(
            children: [
              Padding(
                padding: iconPadding ?? const EdgeInsets.symmetric(horizontal: Spacings.small),
                child: icon,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(Spacings.xsmall),
                  child: Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
