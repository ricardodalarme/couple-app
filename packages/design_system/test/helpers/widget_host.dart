import 'package:design_system/design_system.dart';
import 'package:design_system/design_system_l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const Size defaultTestSurface = Size(390, 844);

Widget uiLocalized(Widget child) => TranslationProvider(child: child);

AppColors colorsOf(AppThemeVariant variant) => AppColors.forVariant(variant);

Widget appFor({
  required AppThemeVariant variant,
  required Widget home,
  bool disableAnimations = false,
}) {
  return MaterialApp(
    builder: (context, navigator) {
      return AppThemeHost(
        initialVariant: variant,
        child: uiLocalized(navigator ?? const SizedBox.shrink()),
      );
    },
    home: disableAnimations
        ? Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(disableAnimations: true),
              child: home,
            ),
          )
        : home,
  );
}

Widget materialAppFor(
  Widget child, {
  required AppThemeVariant variant,
  double textScale = 1,
  bool reduceMotion = false,
  Size size = defaultTestSurface,
}) {
  return MaterialApp(
    theme: AppTheme.light(variant),
    builder: (context, navChild) => MediaQuery(
      data: MediaQuery.of(context).copyWith(
        size: size,
        disableAnimations: reduceMotion,
        textScaler: TextScaler.linear(textScale),
      ),
      child: uiLocalized(navChild!),
    ),
    home: Scaffold(body: SingleChildScrollView(child: child)),
  );
}

Widget scaffoldHost(
  Widget child, {
  required AppThemeVariant variant,
  bool reduceMotion = false,
  double textScale = 2,
}) {
  return MaterialApp(
    builder: (context, navChild) => MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(disableAnimations: reduceMotion, textScaler: TextScaler.linear(textScale)),
      child: uiLocalized(navChild!),
    ),
    home: AppThemeHost(
      initialVariant: variant,
      child: Scaffold(body: child),
    ),
  );
}

Widget galleryHost(
  Widget child, {
  required AppThemeVariant variant,
  double textScale = 1,
  double width = 350,
}) {
  return AppThemeHost(
    initialVariant: variant,
    child: uiLocalized(
      MediaQuery(
        data: MediaQueryData(size: defaultTestSurface, textScaler: TextScaler.linear(textScale)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: SizedBox(
              width: width,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpace.s20),
                child: child,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget inputHost(Widget child, {required AppThemeVariant variant, double textScale = 1}) {
  return MaterialApp(
    theme: AppTheme.light(variant),
    builder: (context, navChild) => uiLocalized(navChild!),
    home: AppThemeHost(
      initialVariant: variant,
      child: Builder(
        builder: (context) {
          final colors = Theme.of(context).extension<AppColors>()!;

          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScale)),
            child: Material(
              color: colors.bgScreen,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpace.s20),
                child: child,
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget themedHost(
  Widget child, {
  AppThemeVariant variant = AppThemeVariant.rose,
  double textScale = 1,
  Size size = defaultTestSurface,
}) {
  return AppThemeHost(
    initialVariant: variant,
    child: uiLocalized(
      MediaQuery(
        data: MediaQueryData(size: size, textScaler: TextScaler.linear(textScale)),
        child: Directionality(textDirection: TextDirection.ltr, child: child),
      ),
    ),
  );
}

Widget atTextScale(double scale, Widget child) {
  return Builder(
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
      child: child,
    ),
  );
}

void setSurface(WidgetTester tester, {double width = 390, double height = 844}) {
  tester.view.physicalSize = Size(width, height);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Finder buttonWithText(String text) =>
    find.ancestor(of: find.text(text), matching: find.byType(BaseButton));

Finder containerOf(Finder ancestor) =>
    find.descendant(of: ancestor, matching: find.byType(AnimatedContainer));

BoxDecoration decorationOf(WidgetTester tester, Finder finder) {
  final container = tester.widget<AnimatedContainer>(finder.first);

  return container.decoration! as BoxDecoration;
}

/// A page-hosted widget for template tests: BaseApp + BaseView + text scale.
Widget templateHost(
  Widget child, {
  required AppThemeVariant variant,
  double textScale = 1,
  Size size = defaultTestSurface,
  Widget? appBar,
}) {
  return BaseApp(
    theme: AppTheme.light(variant),
    home: MediaQuery(
      data: MediaQueryData(size: size, textScaler: TextScaler.linear(textScale)),
      child: BaseView(appBar: appBar, body: child),
    ),
  );
}

extension PumpTemplate on WidgetTester {
  Future<void> pumpTemplate(
    Widget child, {
    required AppThemeVariant variant,
    double textScale = 1,
    Size size = defaultTestSurface,
    Widget? appBar,
  }) {
    return pumpWidget(
      templateHost(child, variant: variant, textScale: textScale, size: size, appBar: appBar),
    );
  }
}
