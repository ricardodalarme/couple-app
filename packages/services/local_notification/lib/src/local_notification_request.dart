/// A notification to show at a local wall-clock time.
class const LocalNotificationRequest({
  required final int id,
  required final DateTime at,
  required final String title,
  required final String body,
});
