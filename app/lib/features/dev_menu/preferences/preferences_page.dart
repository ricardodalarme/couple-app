import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
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
      title: 'Preferences',
      actions: [
        BaseIconButton(
          icon: const Icon(Icons.delete_sweep),
          tooltip: 'Clear preferences',
          onPressed: () async {
            await AppInjector.instance.get<PreferencesService>().clear();
            if (!mounted) return;
            _loadPreferencesData();
            setState(() {});
          },
        ),
      ],
      body: _preferencesData.isEmpty
          ? const Center(child: Text('No preferences data available'))
          : ListView.builder(
              itemCount: _preferencesData.length,
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
                    color: Colors.red500,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: Spacings.large),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: BaseListTile(title: key, subtitle: value.toString()),
                );
              },
            ),
    );
  }
}
