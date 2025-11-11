import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/change_password/change_password_page.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/change_password/cubit/change_password_cubit.dart';

import '../../../../test_helpers/pump_app.dart';

class MockChangePasswordCubit extends MockCubit<ChangePasswordState>
    implements ChangePasswordCubit {}

void main() {
  group('ChangePasswordPage', () {
    late ChangePasswordCubit changePasswordCubit;

    setUp(() {
      changePasswordCubit = MockChangePasswordCubit();
      when(
        () => changePasswordCubit.state,
      ).thenReturn(const ChangePasswordState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: changePasswordCubit,
          child: const ChangePasswordPage(),
        ),
      );
      await tester.pump();

      expect(find.byType(ChangePasswordPage), findsOneWidget);
    });
  });
}
