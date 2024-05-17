import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _displayPassword = false;
  bool isFocused = false;
  final FocusNode node = FocusNode();

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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _displayPassword = !_displayPassword;
            });
          },
          icon: Icon(
            !_displayPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: !_displayPassword,
      validator: widget.validator,
    );
  }
}
