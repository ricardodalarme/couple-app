import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:flutter/material.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  late Future<DeviceInfo> _deviceInfoFuture;

  @override
  void initState() {
    super.initState();
    _deviceInfoFuture = AppInjector.instance.get<DeviceInfoService>().getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Device Info',
      body: FutureBuilder<DeviceInfo>(
        future: _deviceInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \\${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No device info available'));
          }

          final DeviceInfo info = snapshot.data!;
          return ListView(
            children: [
              ListTile(title: const Text('Device ID'), subtitle: Text(info.deviceId ?? '-')),
              ListTile(title: const Text('OS Name'), subtitle: Text(info.osName)),
              ListTile(title: const Text('OS Version'), subtitle: Text(info.osVersion)),
              ListTile(title: const Text('Device Name'), subtitle: Text(info.deviceName)),
              ListTile(title: const Text('Device Model'), subtitle: Text(info.deviceModel)),
              ListTile(title: const Text('Manufacturer'), subtitle: Text(info.manufacturer)),
              ListTile(
                title: const Text('Physical Device'),
                subtitle: Text(info.isPhysicalDevice ? 'Yes' : 'No'),
              ),
              ListTile(
                title: const Text('Physical RAM (MB)'),
                subtitle: Text(info.physicalRamSize.toString()),
              ),
              ListTile(
                title: const Text('Total Disk Size'),
                subtitle: Text(info.totalDiskSize.toString()),
              ),
              ListTile(
                title: const Text('Free Disk Size'),
                subtitle: Text(info.freeDiskSize.toString()),
              ),
            ],
          );
        },
      ),
    );
  }
}
