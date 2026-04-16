import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:device_info_service/device_info_service.dart';

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
            return const Center(child: BaseLoadingIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \\${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No device info available'));
          }

          final info = snapshot.data!;
          return ListView(
            children: [
              BaseListTile(title: 'Device ID', subtitle: info.deviceId ?? '-'),
              BaseListTile(title: 'OS Name', subtitle: info.osName),
              BaseListTile(title: 'OS Version', subtitle: info.osVersion),
              BaseListTile(title: 'Device Name', subtitle: info.deviceName),
              BaseListTile(title: 'Device Model', subtitle: info.deviceModel),
              BaseListTile(title: 'Manufacturer', subtitle: info.manufacturer),
              BaseListTile(
                title: 'Physical Device',
                subtitle: info.isPhysicalDevice ? 'Yes' : 'No',
              ),
              BaseListTile(title: 'Physical RAM (MB)', subtitle: info.physicalRamSize.toString()),
              BaseListTile(title: 'Total Disk Size', subtitle: info.totalDiskSize.toString()),
              BaseListTile(title: 'Free Disk Size', subtitle: info.freeDiskSize.toString()),
            ],
          );
        },
      ),
    );
  }
}
