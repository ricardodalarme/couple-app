import 'package:crash_report_service/crash_report_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocErrorObserver({required final CrashReportService _crashReportService})
    extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _crashReportService.recordError(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
