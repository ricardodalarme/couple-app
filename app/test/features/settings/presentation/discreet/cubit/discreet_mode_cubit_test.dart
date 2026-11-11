import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/discreet_mode_values.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDiscreetRepository() extends Mock implements DiscreetRepository;

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late DiscreetRepository repository;
  late WidgetsRepository widgetsRepository;

  setUp(() {
    repository = _MockDiscreetRepository();
    widgetsRepository = _MockWidgetsRepository();
    when(() => repository.local).thenReturn(const DiscreetModeValues());
    when(() => repository.setNeutralNotifications(value: any(named: 'value')))
        .thenAnswer((_) async {});
    when(() => repository.setHideWidgetText(value: any(named: 'value'))).thenAnswer((_) async {});
    when(() => repository.setNeutralIcon(value: any(named: 'value'))).thenAnswer((_) async {});
  });

  DiscreetModeCubit build() => DiscreetModeCubit(repository: repository);
  test('load mirrors the server values and keeps the device icon', () async {
    when(() => repository.load()).thenAnswer(
      (_) async => const DiscreetModeValues(
        neutralNotifications: true,
        hideWidgetText: true,
        neutralIcon: true,
      ),
    );
    final cubit = build();

    await cubit.load();

    expect(cubit.state.values.neutralNotifications, isTrue);
    expect(cubit.state.values.hideWidgetText, isTrue);
    expect(cubit.state.values.neutralIcon, isTrue);
    expect(cubit.state.isOn, isTrue);
  });

  test('a neutral notification switch saves and keeps the value', () async {
    final cubit = build();

    await cubit.setNeutralNotifications(value: true);

    expect(cubit.state.values.neutralNotifications, isTrue);
    verify(() => repository.setNeutralNotifications(value: true)).called(1);
    expect(cubit.state.saveAction, isA<Success<void>>());
  });

  test('a failed save reverts and reports the failure', () async {
    when(() => repository.setHideWidgetText(value: any(named: 'value')))
        .thenAnswer((_) async => throw Exception('offline'));
    final cubit = build();

    await cubit.setHideWidgetText(value: true);

    expect(cubit.state.values.hideWidgetText, isFalse);
    expect(cubit.state.saveAction, isA<Failure>());
  });

  test('turning every switch off clears the mode', () async {
    when(() => repository.load())
        .thenAnswer((_) async => const DiscreetModeValues(neutralIcon: true));
    final cubit = build();
    await cubit.load();

    await cubit.setNeutralIcon(value: false);

    expect(cubit.state.isOn, isFalse);
    verify(() => repository.setNeutralIcon(value: false)).called(1);
  });

  test('hiding widget text updates the shared cubit and applies the widget payload', () async {
    final payload = WidgetPayload.fake().copyWith(discreet: true).sanitized();
    when(() => widgetsRepository.applyDiscreetModeImmediately(discreet: true))
        .thenAnswer((_) async => payload);
    final cubit = DiscreetModeCubit(repository: repository, widgetsRepository: widgetsRepository);

    final result = await cubit.setHideWidgetText(value: true);

    expect(cubit.state.values.hideWidgetText, isTrue);
    expect(cubit.state.isOn, isTrue);
    expect(result, payload);
    verify(() => widgetsRepository.applyDiscreetModeImmediately(discreet: true)).called(1);
  });

  test('adopting a saved value keeps the shield in the same state', () {
    final cubit = build()..adoptHideWidgetText(value: true);

    expect(cubit.state.values.hideWidgetText, isTrue);
    expect(cubit.state.isOn, isTrue);
  });
}
