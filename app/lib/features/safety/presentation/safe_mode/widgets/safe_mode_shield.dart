import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';

/// Covers the whole app with a blank screen whenever it is not in the foreground and safe or
/// discreet mode is on, so the app switcher shows nothing.
class const SafeModeShield({required final Widget child, super.key}) extends StatefulWidget {
  @override
  State<SafeModeShield> createState() => _SafeModeShieldState();
}

class _SafeModeShieldState() extends State<SafeModeShield> with WidgetsBindingObserver {
  bool _isHidden = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isHidden = state != AppLifecycleState.resumed;
    if (isHidden != _isHidden) setState(() => _isHidden = isHidden);
  }

  @override
  Widget build(BuildContext context) {
    final safeMode = context.select((SafeModeCubit cubit) => cubit.state);
    final discreet = context.select((DiscreetModeCubit cubit) => cubit.state.isOn);
    final hides = safeMode || discreet;

    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        widget.child,
        if (hides && _isHidden) const Positioned.fill(child: ColoredBox(color: Color(0xFFFFFFFF))),
      ],
    );
  }
}
