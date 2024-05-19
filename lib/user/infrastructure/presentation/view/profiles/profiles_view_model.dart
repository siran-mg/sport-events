import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/user/infrastructure/di/riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_state.dart';

import '../../../../domain/use_case/get_user_profiles.dart';

part 'profiles_view_model.g.dart';

@riverpod
class ProfilesViewModel extends _$ProfilesViewModel {
  @override
  ProfilesState build() => Loading();

  getUserProfiles({required String id}) async {
    final user = await ref.read(getUserProfilesProvider).execute(id: id);
    switch (user) {
      case UserNotFound():
        state = UserProfilesNotFound();
        break;
      case Result(value: final user):
        state = Success(user: user);
        break;
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    } else {
      await FacebookAuth.instance.logOut();
    }
  }
}
