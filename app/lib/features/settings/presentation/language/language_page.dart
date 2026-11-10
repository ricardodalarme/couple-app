import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/cubit/app_preferences_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The language list: Portuguese now, English disabled until it is complete.
@RoutePage()
class const LanguagePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.appPreferences;
    final locale = context.select((AppPreferencesCubit cubit) => cubit.state.settings.locale);
    final cubit = context.read<AppPreferencesCubit>();
    final isPortuguese = locale == AppLocale.pt.languageCode;
    final isEnglish = locale == AppLocale.en.languageCode;

    return BaseView(
      appBar: BaseAppBar(title: l10n.language),
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
                  BaseOptionTile(
                    title: l10n.languagePortuguese,
                    isSelected: isPortuguese,
                    onTap: isPortuguese ? null : () => cubit.setLocale(AppLocale.pt),
                  ),
                  BaseOptionTile(
                    title: l10n.languageEnglish,
                    support: l10n.comingSoon,
                    isSelected: isEnglish,
                    isEnabled: false,
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseNote(text: l10n.languageNote, icon: AppIcons.info),
            ],
          ),
        ),
      ),
    );
  }
}
