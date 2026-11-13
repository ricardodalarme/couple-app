import 'package:flutter_bloc/flutter_bloc.dart';

part 'partner_step_state.dart';

class PartnerStepCubit() extends Cubit<PartnerChoice> {
  this : super(PartnerChoice.invite);

  void choose(PartnerChoice choice) => emit(choice);
}
