import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  final String label;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: FilledButton(
        onPressed: isLoading ? null : onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            if (isLoading)
              const SizedBox(
                width: 8,
              ),
            if (isLoading)
              const SizedBox(
                height: 18.0,
                width: 18.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
