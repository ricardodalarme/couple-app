import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/cubit/signup_cubit.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/signup_page.dart';

import '../../../../test_helpers/pump_app.dart';

class MockSignupCubit extends MockCubit<SignupState> implements SignupCubit {}

void main() {
  group('SignUpPage', () {
    late SignupCubit signupCubit;

    setUp(() {
      signupCubit = MockSignupCubit();
      when(() => signupCubit.state).thenReturn(const SignupState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(BlocProvider.value(value: signupCubit, child: const SignUpPage()));

      expect(find.byType(SignUpPage), findsOneWidget);
    });
  });
}
