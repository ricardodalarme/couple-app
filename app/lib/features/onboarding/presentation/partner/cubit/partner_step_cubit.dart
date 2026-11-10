import 'package:flutter_bloc/flutter_bloc.dart';

/// How the person wants to start: inviting now or on their own.
enum PartnerChoice() {
  invite,
  alone,
}

class PartnerStepCubit() extends Cubit<PartnerChoice> {
  this : super(PartnerChoice.invite);

  void choose(PartnerChoice choice) => emit(choice);
}
