import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class AppStatusWrapperWidget extends StatelessWidget {
  const AppStatusWrapperWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<AppCubit>()..initialize(),
      child: BlocListener<AppCubit, AppState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _onStatusChanged,
        child: child,
      ),
    );
  }

  void _onStatusChanged(BuildContext context, AppState state) {
    final RootStackRouter appRouter = AppInjector.instance.get<RootStackRouter>();
    final isAuthenticated = state.status == AppStatus.authenticated;
    final PageRouteInfo<void> newRoute = isAuthenticated ? const HomeRoute() : const LoginRoute();

    appRouter.replaceAll([newRoute]);
  }
}
