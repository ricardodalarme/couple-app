import 'package:common_ui/common_ui.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, this.onChanged, this.onSubmitted});

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return BaseTextField(text: '', onSubmitted: widget.onSubmitted);
  }
}
