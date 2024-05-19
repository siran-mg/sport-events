import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_state.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_view_model.dart';

class ProfilesScreen extends ConsumerWidget {
  const ProfilesScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfilesViewModel = ref.read(profilesViewModelProvider.notifier);
    userProfilesViewModel.getUserProfiles(id: userId);
    final profilesState = ref.watch(profilesViewModelProvider);

    return SafeArea(
      child: Scaffold(body: Builder(builder: (context) {
        switch (profilesState) {
          case Loading():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UserProfilesNotFound():
            return const Center(
              child: Text("Profile introuvable"),
            );
          case Success(user: final user):
            return Center(
              child: Text("Est l'utilisateur connecté : ${user.id == userId}"),
            );
        }
      })),
    );
  }
}
