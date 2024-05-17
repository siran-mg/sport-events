import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.google),
          ),
        ),
        const Gap(16),
        CircleAvatar(
          child: IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebook),
          ),
        )
      ],
    );
  }
}
