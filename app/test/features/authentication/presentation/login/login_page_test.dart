import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/login_page.dart';

import '../../../../test_helpers/pump_app.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  group('LoginPage', () {
    late LoginCubit loginCubit;

    setUp(() {
      loginCubit = MockLoginCubit();
      when(() => loginCubit.state).thenReturn(const LoginState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(BlocProvider.value(value: loginCubit, child: const LoginPage()));
      await tester.pump();

      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
