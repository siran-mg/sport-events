import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode node = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    node.addListener(() {
      setState(() {
        isFocused = node.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: node,
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.label),
        border: const OutlineInputBorder(),
        filled: isFocused || widget.controller.text.isNotEmpty,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        isDense: true,
      ),
      keyboardType: widget.keyboardType ?? TextInputType.text,
      validator: widget.validator,
    );
  }
}
