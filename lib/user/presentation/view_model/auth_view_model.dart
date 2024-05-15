import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/core/view_model/data_state.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  DataState build() => Initial();

  void login() {
    state = Loading();
  }
}
