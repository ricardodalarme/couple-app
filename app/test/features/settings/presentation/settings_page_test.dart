import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:quickstart_flutter_bloc/features/settings/presentation/settings_page.dart';

import '../../../test_helpers/pump_app.dart';

class MockSettingsCubit extends MockCubit<SettingsState>
    implements SettingsCubit {}

void main() {
  group('SettingsPage', () {
    late SettingsCubit settingsCubit;

    setUp(() {
      settingsCubit = MockSettingsCubit();
      when(() => settingsCubit.state).thenReturn(const SettingsState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(value: settingsCubit, child: const SettingsPage()),
      );
      await tester.pump();

      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
