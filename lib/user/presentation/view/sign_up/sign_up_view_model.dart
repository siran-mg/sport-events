import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/user/presentation/view/sign_up/sign_up_state.dart';

part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignUpState build() => Initial();
}
