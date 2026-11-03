import 'package:common_ui/common_ui.dart';

class const SettingsOption({
  required final String text,
  required final bool value,
  required final ValueChanged<bool> onChanged,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        const Gap(Spacings.medium),
        BaseSwitch(value: value, onChanged: onChanged),
      ],
    );
  }
}
