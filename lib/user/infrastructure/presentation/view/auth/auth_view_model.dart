import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/user/infrastructure/di/riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/auth/auth_state.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() => Initial();

  signInWithGoogle() async {
    state = SignInWithGoogleLoading();
    final googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    await _initUser();
    state = Success();
  }

  signInWithFacebook() async {
    state = SignInWithFacebookLoading();
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    await _initUser();
    state = Success();
  }

  Future<void> _initUser() async {
    var authId = FirebaseAuth.instance.currentUser?.uid;
    if (authId != null) {
      final isUserExist =
          await ref.read(userRepositoryProvider).isUserExist(authId);
      if (!isUserExist) {
        await ref.read(initUserProvider).execute(authId: authId);
      }
    }
  }
}
