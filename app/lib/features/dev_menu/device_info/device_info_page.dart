import 'package:core/core.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:ui/ui.dart';

class const DeviceInfoPage({super.key}) extends StatefulWidget {
  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState() extends State<DeviceInfoPage> {
  late Future<DeviceInfo> _deviceInfoFuture;

  @override
  void initState() {
    super.initState();
    _deviceInfoFuture = AppInjector.instance.get<DeviceInfoService>().getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: const BaseAppBar(title: 'Device Info'),
      body: BaseStackedContent(
        body: FutureBuilder<DeviceInfo>(
          future: _deviceInfoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.only(top: AppSpace.s44),
                child: Center(child: BaseLoadingDots(semanticLabel: 'Loading')),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}', style: context.text.bodySm);
            } else if (!snapshot.hasData) {
              return Text('No device info available', style: context.text.bodySm);
            }

            final info = snapshot.data!;
            return BaseListGroup(
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
      ),
    );
  }
}
