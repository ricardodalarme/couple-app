import 'package:common_ui/common_ui.dart';

class const SearchTextField({
  super.key,
  final ValueChanged<String>? onChanged,
  final ValueChanged<String>? onSubmitted,
}) extends StatefulWidget {
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState() extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return BaseTextField(text: '', onSubmitted: widget.onSubmitted);
  }
}
