import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:quickstart_flutter_bloc/features/settings/presentation/settings_page.dart';

import '../../test_helpers/pump_app.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  group('SettingsPage', () {
    late SettingsBloc settingsBloc;

    setUp(() {
      settingsBloc = MockSettingsBloc();
      when(() => settingsBloc.state).thenReturn(const SettingsState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: settingsBloc,
          child: const SettingsPage(),
        ),
      );
      await tester.pump();

      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
