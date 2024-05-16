import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.emailController,
    required this.label,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController emailController;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        label: Text(label),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
    );
  }
}
