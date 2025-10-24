import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons, SearchBar, WidgetStatePropertyAll;

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, this.onChanged, this.onSubmitted});

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      onSubmitted: widget.onSubmitted,
      shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      leading: const Padding(padding: EdgeInsets.all(Spacings.small), child: Icon(Icons.search)),
      trailing: [BaseIconButton(onPressed: _controller.clear, icon: const Icon(Icons.clear))],
    );
  }
}
