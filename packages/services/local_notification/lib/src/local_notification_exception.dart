/// A local notification could not be scheduled or cancelled.
class const LocalNotificationException(final Object cause) implements Exception {
  @override
  String toString() => 'LocalNotificationException: $cause';
}
