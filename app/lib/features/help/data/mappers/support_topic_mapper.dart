import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';

/// Converts the support topics the backend stores into the app's enum and back.
extension SupportTopicMapper on SupportTopic {
  /// The label the support request function receives.
  String toRemote() => name;
}

extension RemoteSupportTopicMapper on String {
  /// The topic for a stored label; an unknown label reads as `other`.
  SupportTopic toSupportTopic() => switch (this) {
    'account' => SupportTopic.account,
    'billing' => SupportTopic.billing,
    'bug' => SupportTopic.bug,
    _ => SupportTopic.other,
  };
}
