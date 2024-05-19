import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/user/infrastructure/di/riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_screen.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_screen.dart';

class UserButton extends ConsumerWidget {
  const UserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.read(currentUserIdProvider);

    return IconButton(
        onPressed: () {
          final screen = currentUserId == null
              ? const AuthScreen()
              : ProfilesScreen(userId: currentUserId);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        icon: const Icon(Icons.person));
  }
}
