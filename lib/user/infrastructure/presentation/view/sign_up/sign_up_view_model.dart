import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/user/infrastructure/di/riverpod.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_up/sign_up_state.dart';

part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignUpState build() => Initial();

  signUp({
    required String email,
    required String password,
  }) async {
    state = Loading();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final userId = ref.read(currentUserIdProvider.notifier).value;
      await ref.read(initUserProvider).execute(authId: userId!);
      state = Success();
    } catch (e) {
      state = EmailAlreadyUserError();
    }
  }
}
