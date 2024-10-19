import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/change_password_page.dart';

import '../../../test_helpers/pump_app.dart';

class MockChangePasswordBloc
    extends MockBloc<ChangePasswordEvent, ChangePasswordState>
    implements ChangePasswordBloc {}

void main() {
  group('ChangePasswordPage', () {
    late ChangePasswordBloc changePasswordBloc;

    setUp(() {
      changePasswordBloc = MockChangePasswordBloc();
      when(() => changePasswordBloc.state)
          .thenReturn(const ChangePasswordState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: changePasswordBloc,
          child: const ChangePasswordPage(),
        ),
      );
      await tester.pump();

      expect(find.byType(ChangePasswordPage), findsOneWidget);
    });
  });
}
