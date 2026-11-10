import 'dart:async';

import 'package:connectivity_service/connectivity_service.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockConnectivityService() extends Mock implements ConnectivityService;

void main() {
  late ConnectivityService service;
  late StreamController<bool> changes;

  setUp(() {
    service = _MockConnectivityService();
    changes = StreamController<bool>.broadcast();
    when(() => service.onStatusChange).thenAnswer((_) => changes.stream);
    when(() => service.hasInternetAccess).thenAnswer((_) async => true);
  });

  tearDown(() => changes.close());

  test('it starts from the current connection', () async {
    final cubit = ConnectivityCubit(connectivityService: service);

    await cubit.start();

    expect(cubit.state.isOnline, isTrue);
    expect(cubit.state.isOffline, isFalse);
    await cubit.close();
  });

  test('a dropped connection raises the offline flag and a return clears it', () async {
    final cubit = ConnectivityCubit(connectivityService: service);
    await cubit.start();

    changes.add(false);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isOffline, isTrue);

    changes.add(true);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isOffline, isFalse);
    await cubit.close();
  });
}
