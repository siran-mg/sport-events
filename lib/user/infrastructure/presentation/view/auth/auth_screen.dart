import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_in/sign_in_screen.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_up/sign_up_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController(
      initialPage: 0,
    );

    void goTo(int page) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sport Events"),
        ),
        body: PageView(
          controller: pageController,
          children: [
            SignInScreen(goToSignup: () {
              goTo(1);
            }),
            SignUpScreen(goToSignIn: () {
              goTo(0);
            }),
          ],
        ),
      ),
    );
  }
}
