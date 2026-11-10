import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/edit_profile_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class MockEditProfileCubit() extends MockCubit<EditProfileState> implements EditProfileCubit;

void main() {
  group('EditProfilePage', () {
    late EditProfileCubit editProfileCubit;

    setUp(() {
      editProfileCubit = MockEditProfileCubit();
      when(() => editProfileCubit.state).thenReturn(const EditProfileState());
    });

    testWidgets('fills the fields from the cubit state', (tester) async {
      when(() => editProfileCubit.state).thenReturn(
        const EditProfileState(
          firstName: FormInput<String>('John'),
          lastName: FormInput<String>('Doe'),
          email: FormInput<String>('john@example.com'),
        ),
      );

      await tester.pumpApp(
        BlocProvider.value(value: editProfileCubit, child: const EditProfilePage()),
      );
      await tester.pump();

      expect(find.text('John'), findsOneWidget);
      expect(find.text('Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(value: editProfileCubit, child: const EditProfilePage()),
      );
      await tester.pump();

      expect(find.byType(EditProfilePage), findsOneWidget);
    });
  });
}
