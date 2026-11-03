import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/profile/profile_page.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class MockAppCubit() extends MockCubit<AppState> implements AppCubit;

void main() {
  group('ProfilePage', () {
    late AppCubit appCubit;

    setUp(() {
      appCubit = MockAppCubit();
      when(() => appCubit.state).thenReturn(AppState.unauthenticated);
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(BlocProvider.value(value: appCubit, child: const ProfilePage()));
      await tester.pump();

      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
