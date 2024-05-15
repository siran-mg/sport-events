import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/core/view_model/data_state.dart';
import 'package:sport_events/user/presentation/view/sign_in_screen.dart';
import 'package:sport_events/user/presentation/view_model/auth_view_model.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    ref.listen(authViewModelProvider, (previous, next) {
      switch (next) {
        case Initial():
          print("initial");
        case Loading():
          print("loading");
        case Success():
        // TODO: Handle this case.
        case Error():
        // TODO: Handle this case.
      }
    });

    return SignInScreen(
      emailController: emailController,
      passwordController: passwordController,
      authViewModel: authViewModel,
    );
  }
}
