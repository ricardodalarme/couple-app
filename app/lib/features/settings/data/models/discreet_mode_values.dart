import 'package:equatable/equatable.dart';

/// What discreet mode hides on this device and on the server.
final class const DiscreetModeValues({
  final bool neutralNotifications = false,
  final bool hideWidgetText = false,
  final bool neutralIcon = false,
}) with Equatable {
  /// Whether any part of discreet mode is on.
  bool get isOn => neutralNotifications || hideWidgetText || neutralIcon;

  DiscreetModeValues copyWith({
    bool? neutralNotifications,
    bool? hideWidgetText,
    bool? neutralIcon,
  }) => DiscreetModeValues(
    neutralNotifications: neutralNotifications ?? this.neutralNotifications,
    hideWidgetText: hideWidgetText ?? this.hideWidgetText,
    neutralIcon: neutralIcon ?? this.neutralIcon,
  );

  @override
  List<Object?> get props => [neutralNotifications, hideWidgetText, neutralIcon];
}
