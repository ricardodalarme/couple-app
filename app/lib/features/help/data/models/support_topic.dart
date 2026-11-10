/// The topics the backend accepts for a support request.
enum SupportTopic(final String value) {
  account('account'),
  billing('billing'),
  bug('bug'),
  other('other');

  static SupportTopic fromValue(String value) {
    for (final topic in values) {
      if (topic.value == value) return topic;
    }
    return other;
  }
}
