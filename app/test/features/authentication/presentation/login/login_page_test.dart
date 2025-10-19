import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/login_page.dart';

import '../../../../test_helpers/pump_app.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('LoginPage', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(const LoginState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(value: loginBloc, child: const LoginPage()),
      );
      await tester.pump();

      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
