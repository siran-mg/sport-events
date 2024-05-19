import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/core/components/buttons/primary_button.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_screen.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_state.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_view_model.dart';

class ProfilesScreen extends ConsumerStatefulWidget {
  const ProfilesScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  ProfilesScreenState createState() => ProfilesScreenState();
}

class ProfilesScreenState extends ConsumerState<ProfilesScreen> {
  @override
  void initState() {
    final userProfilesViewModel = ref.read(profilesViewModelProvider.notifier);
    userProfilesViewModel.getUserProfiles(id: widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profilesState = ref.watch(profilesViewModelProvider);

    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            switch (profilesState) {
              case Loading():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case UserProfilesNotFound():
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Profile introuvable"),
                      PrimaryButton(
                        label: "Se déconnecter",
                        onTap: () {
                          ref
                              .read(profilesViewModelProvider.notifier)
                              .logOut()
                              .then((_) =>
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const AuthScreen(),
                                    ),
                                  ));
                        },
                      )
                    ],
                  ),
                );
              case Success(user: final user):
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Est l'utilisateur connecté : ${user.authId == widget.userId}"),
                    PrimaryButton(
                      label: "Se déconnecter",
                      onTap: () {
                        ref
                            .read(profilesViewModelProvider.notifier)
                            .logOut()
                            .then((_) => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const AuthScreen(),
                                  ),
                                ));
                      },
                    )
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
