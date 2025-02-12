import 'package:common_ui/src/generated/assets.gen.dart';
import 'package:common_ui/src/tokens/colors.dart';
import 'package:flutter/material.dart' show MaterialButton;
import 'package:flutter/widgets.dart';

enum ButtonProvider {
  google('Google'),
  facebook('Facebook');

  const ButtonProvider(this.text);

  final String text;
}

const double _buttonMaxWidth = 220;

class SignInButton extends StatelessWidget {
  const SignInButton(this.button, {required this.text, required this.onPressed, super.key});

  final String Function(ButtonProvider) text;
  final VoidCallback onPressed;
  final ButtonProvider button;

  @override
  Widget build(BuildContext context) {
    final String buttonText = text(button);

    return switch (button) {
      ButtonProvider.google => SignInButtonBuilder(
        key: const Key('Google'),
        text: buttonText,
        icon: Container(
          padding: const EdgeInsets.all(4),
          color: Colors.white,
          child: Assets.logos.google.svg(height: 24),
        ),
        backgroundColor: const Color(0xFF4285F4),
        iconPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
        onPressed: onPressed,
      ),
      ButtonProvider.facebook => SignInButtonBuilder(
        key: const Key('Facebook'),
        text: buttonText,
        icon: Assets.logos.facebook.svg(height: 30),
        backgroundColor: const Color(0xFF1877f2),
        iconPadding: const EdgeInsets.symmetric(horizontal: 4),
        onPressed: onPressed,
      ),
    };
  }
}

class SignInButtonBuilder extends StatelessWidget {
  const SignInButtonBuilder({
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    required this.icon,
    super.key,
    this.iconPadding,
    this.innerPadding,
    this.height,
    this.maxWidth = _buttonMaxWidth,
    this.textStyle = const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
  });

  final String text;
  final Widget icon;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final EdgeInsets? iconPadding;
  final EdgeInsets? innerPadding;
  final double? height;
  final double maxWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      height: height,
      padding: EdgeInsets.zero,
      color: backgroundColor,
      onPressed: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Row(
          children: [
            Padding(padding: iconPadding ?? const EdgeInsets.symmetric(horizontal: 8), child: icon),
            Expanded(
              child: Padding(
                padding: innerPadding ?? const EdgeInsets.all(4),
                child: Text(text, style: textStyle, maxLines: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
