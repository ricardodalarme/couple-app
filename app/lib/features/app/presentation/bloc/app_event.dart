part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class AppInitialized extends AppEvent {
  const AppInitialized();
}

final class AppStatusChanged extends AppEvent {
  const AppStatusChanged(this.isAuthenticated);

  final bool isAuthenticated;
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}
