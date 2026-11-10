import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/app_text_scale.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';

/// Applies the device preferences to the media query of the whole app.
class const AppPreferencesMedia({
  required final Settings settings,
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final textScaler = settings.textScale == 1
        ? media.textScaler
        : AppTextScaler(system: media.textScaler, appScale: settings.textScale);

    return MediaQuery(
      data: media.copyWith(
        textScaler: textScaler,
        disableAnimations: settings.reduceMotion || media.disableAnimations,
        highContrast: settings.highContrast || media.highContrast,
      ),
      child: child,
    );
  }
}
