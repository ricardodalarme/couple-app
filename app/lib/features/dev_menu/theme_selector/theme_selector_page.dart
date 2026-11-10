import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

class const ThemeSelectorPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current = AppThemeScope.of(context);

    return BaseView(
      appBar: const BaseAppBar(title: 'Theme Selector'),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpace.s10,
          children: [
            for (final variant in AppThemeVariant.values)
              BaseOptionTile(
                title: variant.name,
                isSelected: variant == current,
                onTap: () => unawaited(_select(context, variant)),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _select(BuildContext context, AppThemeVariant variant) async {
    AppThemeScope.set(context, variant);
    final repository = AppInjector.instance.get<SettingsRepository>();
    await repository.save(repository.get().copyWith(themeVariant: variant.name));
  }
}
