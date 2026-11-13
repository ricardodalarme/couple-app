import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_widget_service/home_widget_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('home_widget');
  late List<MethodCall> calls;
  late PlatformHomeWidgetService service;

  setUp(() {
    calls = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (call) async {
        calls.add(call);

        return null;
      },
    );
    service = const PlatformHomeWidgetService();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      null,
    );
  });

  test('setAppGroupId sends the shared App Group', () async {
    await service.setAppGroupId('group.com.example');

    expect(calls.single.arguments, {'groupId': 'group.com.example'});
  });

  test('saveString sends the value and clears the key with null', () async {
    await service.saveString('payload', '{"a":1}');
    await service.saveString('payload', null);

    expect((calls.first.arguments as Map)['data'], '{"a":1}');
    expect((calls.last.arguments as Map)['data'], isNull);
  });

  test('updateWidget maps the iOS kind and the Android provider', () async {
    await service.updateWidget(
      iosName: 'ReparaOwnSmallWidget',
      androidName: 'widgets.ReparaOwnSmallWidgetProvider',
      qualifiedAndroidName: 'com.example.widgets.ReparaOwnSmallWidgetProvider',
    );

    expect(calls.single.arguments, {
      'name': null,
      'android': 'widgets.ReparaOwnSmallWidgetProvider',
      'ios': 'ReparaOwnSmallWidget',
      'qualifiedAndroidName': 'com.example.widgets.ReparaOwnSmallWidgetProvider',
    });
  });

  test('scheduleUpdates sends the update times', () async {
    final nextMidnight = DateTime.utc(2026, 11, 14);

    await service.scheduleUpdates(
      [nextMidnight],
      name: 'ReparaCoupleCounterWidgetProvider',
      androidName: 'widgets.ReparaCoupleCounterWidgetProvider',
      qualifiedAndroidName: 'com.example.widgets.ReparaCoupleCounterWidgetProvider',
    );

    expect(calls.single.arguments, {
      'updateTimes': [nextMidnight.millisecondsSinceEpoch],
      'name': 'ReparaCoupleCounterWidgetProvider',
      'android': 'widgets.ReparaCoupleCounterWidgetProvider',
      'qualifiedAndroidName': 'com.example.widgets.ReparaCoupleCounterWidgetProvider',
    });
  });

  test('cancelScheduledUpdates sends the provider name', () async {
    await service.cancelScheduledUpdates(
      name: 'ReparaCoupleCounterWidgetProvider',
      androidName: 'widgets.ReparaCoupleCounterWidgetProvider',
      qualifiedAndroidName: 'com.example.widgets.ReparaCoupleCounterWidgetProvider',
    );

    expect(calls.single.arguments, {
      'name': 'ReparaCoupleCounterWidgetProvider',
      'android': 'widgets.ReparaCoupleCounterWidgetProvider',
      'qualifiedAndroidName': 'com.example.widgets.ReparaCoupleCounterWidgetProvider',
    });
  });
}
