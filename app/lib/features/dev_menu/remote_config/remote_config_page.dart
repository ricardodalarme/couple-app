import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:remote_config_service/remote_config_service.dart';

class RemoteConfigPage extends StatefulWidget {
  const RemoteConfigPage({super.key});

  @override
  State<RemoteConfigPage> createState() => _RemoteConfigPageState();
}

class _RemoteConfigPageState extends State<RemoteConfigPage> {
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
      title: 'Remote Config',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh',
          onPressed: () => setState(_loadRemoteConfigs),
        ),
      ],
      body: _remoteConfigs.isEmpty
          ? const Center(child: Text('No remote config data available'))
          : ListView.builder(
              itemCount: _remoteConfigs.length,
              itemBuilder: (_, index) {
                final String key = _remoteConfigs.keys.elementAt(index);
                final String value = _remoteConfigs[key]!;
                return ListTile(title: Text(key), subtitle: Text(value));
              },
            ),
    );
  }
}
