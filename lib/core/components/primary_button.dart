import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
