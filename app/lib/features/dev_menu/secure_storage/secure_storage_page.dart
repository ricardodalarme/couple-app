import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class const SecureStoragePage({super.key}) extends StatefulWidget {
  @override
  State<SecureStoragePage> createState() => _SecureStoragePageState();
}

class _SecureStoragePageState() extends State<SecureStoragePage> {
  late Future<Map<String, String>> _secureStorageDataFuture;

  @override
  void initState() {
    super.initState();
    _loadSecureStorageData();
  }

  void _loadSecureStorageData() {
    _secureStorageDataFuture = AppInjector.instance.get<SecureStorageService>().readAll();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Secure Storage',
      actions: [
        BaseIconButton(
          icon: const Icon(Icons.delete_sweep),
          tooltip: 'Clear secure storage',
          onPressed: () async {
            await AppInjector.instance.get<SecureStorageService>().clear();
            if (!mounted) return;
            _loadSecureStorageData();
            setState(() {});
          },
        ),
      ],
      body: FutureBuilder<Map<String, String>>(
        future: _secureStorageDataFuture,
        builder: (context, snapshot) {
          final data = snapshot.data ?? {};
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: BaseLoadingIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading secure storage data'));
          }
          if (data.isEmpty) {
            return const Center(child: Text('No secure storage data available'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              final key = data.keys.elementAt(index);
              final value = data[key];
              return Dismissible(
                key: Key(key),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  await AppInjector.instance.get<SecureStorageService>().delete(key: key);
                  if (!mounted) return;
                  _loadSecureStorageData();
                  setState(() {});
                },
                background: Container(
                  color: Colors.red500,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: Spacings.large),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: BaseListTile(title: key, subtitle: value),
              );
            },
          );
        },
      ),
    );
  }
}
