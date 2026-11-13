/// Reads and writes the native home screen widget store.
abstract interface class HomeWidgetService() {
  /// Sets the App Group the app and the widget extension share on iOS.
  Future<void> setAppGroupId(String id);

  /// Stores [value] under [key]; a null [value] removes the key.
  Future<void> saveString(String key, String? value);

  /// The value stored under [key], or null when it is absent.
  Future<String?> readString(String key);

  /// Asks the native widgets to reload their timelines.
  Future<void> updateWidget({
    String? name,
    String? androidName,
    String? iosName,
    String? qualifiedAndroidName,
  });

  /// Schedules [dates] as widget update times.
  Future<void> scheduleUpdates(
    List<DateTime> dates, {
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  });

  /// Cancels the updates scheduled for a widget.
  Future<void> cancelScheduledUpdates({
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  });

  /// The URI that launched the app from a widget, if any.
  Future<Uri?> initiallyLaunched();

  /// URIs delivered while the app is running when a widget is tapped.
  Stream<Uri?> get clicked;
}
