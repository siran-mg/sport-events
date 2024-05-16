import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField(
      {super.key,
      required this.passwordController,
      required this.label,
      this.validator});

  final TextEditingController passwordController;
  final String label;
  final String? Function(String?)? validator;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _displayPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        label: Text(widget.label),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _displayPassword = !_displayPassword;
            });
          },
          icon:
              Icon(!_displayPassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      obscureText: !_displayPassword,
      validator: widget.validator,
    );
  }
}
