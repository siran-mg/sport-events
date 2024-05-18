import 'package:flutter/material.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_screen.dart';

class UserButton extends StatelessWidget {
  const UserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AuthScreen();
          }));
        },
        icon: const Icon(Icons.person));
  }
}
