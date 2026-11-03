import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/edit_profile_page.dart';
import 'package:flutter_test/flutter_test.dart';
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

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(value: editProfileCubit, child: const EditProfilePage()),
      );
      await tester.pump();

      expect(find.byType(EditProfilePage), findsOneWidget);
    });
  });
}
