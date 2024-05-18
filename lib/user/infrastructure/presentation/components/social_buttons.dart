import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_state.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_view_model.dart';

class SocialButtons extends ConsumerWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final authState = ref.watch(authViewModelProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: IconButton(
            onPressed: () {
              authViewModel.signInWithGoogle();
            },
            icon: authState is SignInWithGoogleLoading
                ? const CircularProgressIndicator()
                : const FaIcon(FontAwesomeIcons.google),
          ),
        ),
        const Gap(16),
        CircleAvatar(
          child: IconButton(
            onPressed: () {
              authViewModel.signInWithFacebook();
            },
            icon: authState is SignInWithFacebookLoading
                ? const CircularProgressIndicator()
                : const FaIcon(FontAwesomeIcons.facebook),
          ),
        )
      ],
    );
  }
}
