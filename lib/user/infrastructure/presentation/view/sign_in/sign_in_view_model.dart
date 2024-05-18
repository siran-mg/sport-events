import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_in/sign_in_state.dart';

part 'sign_in_view_model.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  @override
  SignInState build() => Initial();

  login({required String email, required String password}) async {
    state = Loading();
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user == null) {
        state = BadCredentials();
      } else {
        state = Success();
      }
    } catch (e) {
      state = BadCredentials();
    }
  }
}
