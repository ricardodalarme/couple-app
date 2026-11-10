import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/app_text_scale.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/cubit/app_preferences_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Text size and accessibility, applied to the whole app at once.
@RoutePage()
class const AppPreferencesPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.appPreferences;
    final settings = context.select((AppPreferencesCubit cubit) => cubit.state.settings);
    final cubit = context.read<AppPreferencesCubit>();
    final textScale = AppTextScale.fromFactor(settings.textScale);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<AppPreferencesCubit, AppPreferencesState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction && current.saveAction is Failure,
        listener: (context, _) => BaseToast.show(context, l10n.saveError),
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: l10n.textSizeLabel,
                    value: _textScaleLabel(l10n, textScale),
                    showsChevron: true,
                    onTap: () => _pickTextScale(context, textScale),
                  ),
                  BaseListTile(
                    title: l10n.reduceMotion,
                    control: BaseSwitch(
                      value: settings.reduceMotion,
                      semanticLabel: l10n.reduceMotion,
                      onChanged: (value) => cubit.setReduceMotion(value: value),
                    ),
                  ),
                  BaseListTile(
                    title: l10n.highContrast,
                    control: BaseSwitch(
                      value: settings.highContrast,
                      semanticLabel: l10n.highContrast,
                      onChanged: (value) => cubit.setHighContrast(value: value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s20),
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: l10n.language,
                    value: _localeLabel(l10n, settings.locale),
                    icon: AppIcons.globe,
                    showsChevron: true,
                    onTap: () => context.pushRoute(const LanguageRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseNote(text: l10n.colourInProfile, icon: AppIcons.settings),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickTextScale(BuildContext context, AppTextScale current) async {
    final l10n = context.l10n.appPreferences;
    final cubit = context.read<AppPreferencesCubit>();
    final picked = await BaseSheet.show<AppTextScale>(
      context: context,
      title: l10n.textSizeLabel,
      child: Builder(
        builder: (sheetContext) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final scale in AppTextScale.values) ...[
              BaseOptionTile(
                title: _textScaleLabel(l10n, scale),
                isSelected: scale == current,
                onTap: () => Navigator.of(sheetContext).pop(scale),
              ),
              if (scale != AppTextScale.values.last) const SizedBox(height: AppSpace.s10),
            ],
          ],
        ),
      ),
    );
    if (picked != null) await cubit.setTextScale(picked);
  }
}

String _textScaleLabel(Translations$appPreferences$pt l10n, AppTextScale scale) => switch (scale) {
  .small => l10n.textSizeSmall,
  .medium => l10n.textSizeMedium,
  .large => l10n.textSizeLarge,
  .extraLarge => l10n.textSizeExtraLarge,
};

String _localeLabel(Translations$appPreferences$pt l10n, String locale) => switch (locale) {
  'en' => l10n.languageEnglish,
  _ => l10n.languagePortuguese,
};
