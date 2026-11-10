import 'package:design_system/src/components/navigation/base_app_bar.dart';
import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Brightness, Scaffold, ThemeData;

/// The page shell: scaffold, theme background, safe area and an app bar.
class const BaseView({
  required final Widget body,
  final Widget? appBar = const BaseAppBar(),
  final bool hasSafeArea = true,
  final bool resizeToAvoidBottomInset = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = this.appBar;
    final background = context.colors.bgScreen;
    final backgroundBrightness = ThemeData.estimateBrightnessForColor(background);
    final iconBrightness = backgroundBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    final content = Column(
      children: [
        if (appBar != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screenMargin,
              AppSpace.screenTop,
              AppSpace.screenMargin,
              AppSpace.s8,
            ),
            child: appBar,
          ),
        Expanded(child: body),
      ],
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: background,
        statusBarIconBrightness: iconBrightness,
        statusBarBrightness: backgroundBrightness,
        systemNavigationBarColor: background,
        systemNavigationBarIconBrightness: iconBrightness,
      ),
      child: Scaffold(
        backgroundColor: background,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: hasSafeArea ? SafeArea(child: content) : content,
      ),
    );
  }
}
