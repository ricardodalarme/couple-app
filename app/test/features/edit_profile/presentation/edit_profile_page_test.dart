import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/edit_profile_page.dart';

import '../../../test_helpers/pump_app.dart';

class MockEditProfileBloc extends MockBloc<EditProfileEvent, EditProfileState>
    implements EditProfileBloc {}

void main() {
  group('EditProfilePage', () {
    late EditProfileBloc editProfileBloc;

    setUp(() {
      editProfileBloc = MockEditProfileBloc();
      when(() => editProfileBloc.state).thenReturn(const EditProfileState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: editProfileBloc,
          child: const EditProfilePage(),
        ),
      );
      await tester.pump();

      expect(find.byType(EditProfilePage), findsOneWidget);
    });
  });
}
