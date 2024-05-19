import 'package:sport_events/user/domain/entity/user.dart';
import 'package:sport_events/user/domain/repository/user_repository.dart';
import 'package:uuid/uuid.dart';

sealed class InitUserResult {}

class InitUserSuccess extends InitUserResult {}

class InitUserFailure extends InitUserResult {}

class InitUser {
  final UserRepository userRepository;

  InitUser({required this.userRepository});

  Future<InitUserResult> execute({required String authId}) async {
    try {
      await userRepository.createUser(User(
        authId: authId,
        id: const Uuid().v4(),
      ));
      return InitUserSuccess();
    } on Exception {
      return InitUserFailure();
    }
  }
}
