import 'package:flutter/services.dart';
import 'package:flutter_bloc_starter/features/safety/data/models/help_line.dart';
import 'package:url_launcher/url_launcher.dart';

/// The help lines and the two ways to reach one. Nothing is logged or sent anywhere.
class HelpLinesRepository() {
  List<HelpLine> getHelpLines() => bundledHelpLines;

  /// Opens the phone app with [number]; returns false when this device cannot place calls.
  Future<bool> call(String number) async {
    final uri = Uri(scheme: 'tel', path: number);
    if (!await canLaunchUrl(uri)) return false;

    return launchUrl(uri);
  }

  /// Copies [number], for devices that cannot place calls.
  Future<void> copy(String number) => Clipboard.setData(ClipboardData(text: number));
}
