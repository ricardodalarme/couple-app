import 'package:common_ui/common_ui.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    required this.text,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        const Gap(Spacings.medium),
        BaseSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
