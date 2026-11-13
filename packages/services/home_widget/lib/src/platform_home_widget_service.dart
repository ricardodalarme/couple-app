import 'package:home_widget/home_widget.dart';
import 'package:home_widget_service/src/home_widget_service.dart';

/// Delegates to the `home_widget` plugin.
class const PlatformHomeWidgetService() implements HomeWidgetService {
  @override
  Future<void> setAppGroupId(String id) => HomeWidget.setAppGroupId(id);

  @override
  Future<void> saveString(String key, String? value) =>
      HomeWidget.saveWidgetData<String>(key, value);

  @override
  Future<String?> readString(String key) => HomeWidget.getWidgetData<String>(key);

  @override
  Future<void> updateWidget({
    String? name,
    String? androidName,
    String? iosName,
    String? qualifiedAndroidName,
  }) => HomeWidget.updateWidget(
    name: name,
    androidName: androidName,
    iOSName: iosName,
    qualifiedAndroidName: qualifiedAndroidName,
  );

  @override
  Future<void> scheduleUpdates(
    List<DateTime> dates, {
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  }) => HomeWidget.scheduleWidgetUpdates(
    dates,
    name: name,
    androidName: androidName,
    qualifiedAndroidName: qualifiedAndroidName,
  );

  @override
  Future<void> cancelScheduledUpdates({
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  }) => HomeWidget.cancelScheduledWidgetUpdates(
    name: name,
    androidName: androidName,
    qualifiedAndroidName: qualifiedAndroidName,
  );

  @override
  Future<Uri?> initiallyLaunched() => HomeWidget.initiallyLaunchedFromHomeWidget();

  @override
  Stream<Uri?> get clicked => HomeWidget.widgetClicked;
}
