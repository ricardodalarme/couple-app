import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/cubit/debug_sign_in_cubit.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/debug_sign_in_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_helpers/pump_app.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late AuthenticationRepository repository;

  setUp(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    repository = _MockAuthenticationRepository();
  });

  testWidgets('renders the debug sign-in labels in Portuguese', (tester) async {
    final cubit = DebugSignInCubit(authenticationRepository: repository);
    addTearDown(cubit.close);

    await tester.pumpApp(
      BlocProvider.value(value: cubit, child: const DebugSignInPage()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Entrar (debug)'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Criar conta'), findsOneWidget);
    expect(find.text('Sign in'), findsNothing);
    expect(find.text('Create account'), findsNothing);
  });

  testWidgets('explains the confirmation email after creating an account', (tester) async {
    when(
      () => repository.signUpWithEmailAndPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.isAuthenticated).thenReturn(false);
    final cubit = DebugSignInCubit(authenticationRepository: repository);
    addTearDown(cubit.close);

    await tester.pumpApp(
      BlocProvider.value(value: cubit, child: const DebugSignInPage()),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Criar conta'));
    await tester.pump();
    await tester.pump();

    expect(
      find.text('Conta criada. Confira seu e-mail para confirmar antes de entrar.'),
      findsOneWidget,
    );
  });
}
