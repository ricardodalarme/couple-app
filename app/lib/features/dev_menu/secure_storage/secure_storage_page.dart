import 'package:core/core.dart';
import 'package:secure_storage_service/secure_storage_service.dart';
import 'package:ui/ui.dart';

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
      appBar: BaseAppBar(
        title: 'Secure Storage',
        trailing: BaseRoundButton(
          icon: AppIcons.trash,
          semanticLabel: 'Clear secure storage',
          onPressed: () async {
            await AppInjector.instance.get<SecureStorageService>().clear();
            if (!mounted) return;
            _loadSecureStorageData();
            setState(() {});
          },
        ),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _secureStorageDataFuture,
        builder: (context, snapshot) {
          final data = snapshot.data ?? {};
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: BaseLoadingDots(semanticLabel: 'Loading'));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading secure storage data',
                style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
              ),
            );
          }
          if (data.isEmpty) {
            return Center(
              child: Text(
                'No secure storage data available',
                style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screenMargin,
              AppSpace.s8,
              AppSpace.screenMargin,
              AppSpace.s8,
            ),
            itemCount: data.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpace.s8),
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
                  color: AppPalette.errorInk,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpace.s16),
                  child: const AppIcon(icon: AppIcons.trash, color: AppPalette.white),
                ),
                child: BaseListTile(title: key, subtitle: value, isLoose: true),
              );
            },
          );
        },
      ),
    );
  }
}
