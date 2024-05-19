import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sport_events/user/infrastructure/di/riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_state.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_view_model.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_screen.dart';

class SocialButtons extends ConsumerWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final authState = ref.watch(authViewModelProvider);

    ref.listen(authViewModelProvider, (previous, next) {
      switch (next) {
        case Success():
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ProfilesScreen(
                userId: ref.read(currentUserIdProvider.notifier).value!,
              ),
            ),
          );
          break;
        case SignInWithGoogleLoading():
        case SignInWithFacebookLoading():
        case Initial():
        case ClosedPopup():
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: IconButton(
            onPressed: () async {
              await authViewModel.signInWithGoogle();
            },
            icon: authState is SignInWithGoogleLoading
                ? const CircularProgressIndicator()
                : const FaIcon(FontAwesomeIcons.google),
          ),
        ),
        const Gap(16),
        CircleAvatar(
          child: IconButton(
            onPressed: () async {
              await authViewModel.signInWithFacebook();
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
