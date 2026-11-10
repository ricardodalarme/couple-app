import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:preferences_service/preferences_service.dart';

class const PreferencesPage({super.key}) extends StatefulWidget {
  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState() extends State<PreferencesPage> {
  Map<String, dynamic> _preferencesData = {};

  @override
  void initState() {
    super.initState();
    _loadPreferencesData();
  }

  void _loadPreferencesData() {
    _preferencesData = AppInjector.instance.get<PreferencesService>().readAll();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: BaseAppBar(
        title: 'Preferences',
        trailing: BaseRoundButton(
          icon: AppIcons.trash,
          semanticLabel: 'Clear preferences',
          onPressed: () async {
            await AppInjector.instance.get<PreferencesService>().clear();
            if (!mounted) return;
            _loadPreferencesData();
            setState(() {});
          },
        ),
      ),
      body: _preferencesData.isEmpty
          ? Center(
              child: Text(
                'No preferences data available',
                style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                AppSpace.screenMargin,
                AppSpace.s8,
                AppSpace.screenMargin,
                AppSpace.s8,
              ),
              itemCount: _preferencesData.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpace.s8),
              itemBuilder: (_, index) {
                final key = _preferencesData.keys.elementAt(index);
                final value = _preferencesData[key];
                return Dismissible(
                  key: Key(key),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) async {
                    await AppInjector.instance.get<PreferencesService>().delete(key: key);
                    if (!mounted) return;
                    _loadPreferencesData();
                    setState(() {});
                  },
                  background: Container(
                    color: AppPalette.errorInk,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: AppSpace.s16),
                    child: const AppIcon(icon: AppIcons.trash, color: AppPalette.white),
                  ),
                  child: BaseListTile(title: key, subtitle: value.toString(), isLoose: true),
                );
              },
            ),
    );
  }
}
