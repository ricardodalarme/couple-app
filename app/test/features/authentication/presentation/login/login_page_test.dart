import 'package:bloc_test/bloc_test.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class MockLoginCubit() extends MockCubit<LoginState> implements LoginCubit;

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

    testWidgets('primary action is pressable before validation', (tester) async {
      when(() => loginCubit.onSubmit()).thenAnswer((_) async {});

      await tester.pumpApp(BlocProvider.value(value: loginCubit, child: const LoginPage()));
      await tester.pump();

      await tester.tap(find.widgetWithText(BaseButton, 'Login'));
      await tester.pump();

      verify(() => loginCubit.onSubmit()).called(1);
    });
  });
}
