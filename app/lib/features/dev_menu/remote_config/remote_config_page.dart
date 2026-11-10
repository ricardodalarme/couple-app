import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:remote_config_service/remote_config_service.dart';

class const RemoteConfigPage({super.key}) extends StatefulWidget {
  @override
  State<RemoteConfigPage> createState() => _RemoteConfigPageState();
}

class _RemoteConfigPageState() extends State<RemoteConfigPage> {
  Map<String, String> _remoteConfigs = {};

  @override
  void initState() {
    super.initState();
    _loadRemoteConfigs();
  }

  void _loadRemoteConfigs() {
    _remoteConfigs = AppInjector.instance.get<RemoteConfigService>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: BaseAppBar(
        title: 'Remote Config',
        trailing: BaseRoundButton(
          icon: AppIcons.refresh,
          semanticLabel: 'Refresh',
          onPressed: () => setState(_loadRemoteConfigs),
        ),
      ),
      body: _remoteConfigs.isEmpty
          ? Center(
              child: Text(
                'No remote config data available',
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
              itemCount: _remoteConfigs.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpace.s8),
              itemBuilder: (_, index) {
                final key = _remoteConfigs.keys.elementAt(index);
                final value = _remoteConfigs[key]!;
                return BaseListTile(title: key, subtitle: value, isLoose: true);
              },
            ),
    );
  }
}
