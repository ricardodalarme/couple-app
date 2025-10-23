abstract class AnalyticsEvent {
  const AnalyticsEvent(this.name);

  final String name;

  Map<String, Object>? get parameters => null;
}
